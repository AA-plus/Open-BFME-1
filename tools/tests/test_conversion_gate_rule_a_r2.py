"""Rule A round-2 probes (owner verdict 2026-10-13, conversion_gate, adversarial
review round 2). The 36 probes are reviewer G2's (build/r2_g/test_rule_a_g2.py);
suffix _refuse expects a refusal, _pass a pass. The tests after them pin each
round-2 fix so a mutation that drops one turns a test red."""
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools" / "tests"))
sys.path.insert(0, str(ROOT / "tools"))
from test_conversion_gate_reshown_emit import _gate  # noqa

P = "game/GameEngine/Source/Common/Probe.cpp"
H = "game/GameEngine/Include/Common/ProbeEmit.h"

def run(b, a, files=None):
    before = {P: b}; after = {P: a}
    if files:
        before.update(files); after.update(files)
    return _gate(before, after)

def F(name, body, head="void "):
    return "%s%s()\n{\n\t__asm {\n%s\t}\n}\n" % (head, name, body)

E = lambda v: "\t__emit %s\n" % v
CASES = {}
def case(req, name, exp):
    def deco(fn):
        CASES[fn.__name__] = (req, name, exp); return fn
    return deco

# --- R1 per function ---
@case(1, "pure removal of a function", "pass")
def test_r1_pure_removal_pass():
    assert run(F("f", E("0x90")) + F("g", E("0xC3")), F("g", E("0xC3"))) == []
@case(1, "re-shown identical lines same function", "pass")
def test_r1_reshown_pass():
    assert run("int x;\n" + F("g", E("0xC3")+E("0x90")), F("g", E("0xC3")+E("0x90"))) == []
@case(1, "lines moved within one function", "pass")
def test_r1_moved_within_pass():
    assert run(F("g", E("0xC3")+E("0x90")), F("g", E("0x90")+E("0xC3"))) == []
@case(1, "byte value changed in one function", "refuse")
def test_r1_changed_value_refuse():
    assert run(F("g", E("0x90")), F("g", E("0xC3"))) != []
@case(1, "move bytes f->g (f removed)", "refuse")
def test_r1_move_refuse():
    assert run(F("f", E("0x90")) + F("g", ""), F("g", E("0x90"))) != []
@case(1, "function renamed in same commit", "refuse(conservative)")
def test_r1_rename_refuse():
    assert run(F("f", E("0x90")), F("f2", E("0x90"))) != []
@case(1, "_emit single underscore added", "refuse")
def test_r1_single_underscore_refuse():
    assert run(F("g", E("0x90")), F("g", E("0x90") + "\t_emit 0xC3\n")) != []
@case(1, "_emit<->__emit spelling swap", "pass")
def test_r1_spelling_swap_pass():
    assert run(F("g", E("0x90")), F("g", "\t_emit 0x90\n")) == []
@case(1, "emit inside a comment / string only", "pass")
def test_r1_comment_pass():
    assert run(F("g", ""), F("g", "\t// __emit 0x90\n\t/* __emit 0xC3 */\n")) == []
@case(1, "emit with line continuation in macro", "refuse")
def test_r1_continuation_refuse():
    hdr = "#define RAW \\\n\t__emit 0x90 \\\n\t__emit 0xC3\n"
    assert run(hdr + F("g", ""), hdr + F("g", "\tRAW\n")) != []

# --- R2 define / enum ---
@case(2, "define operand added", "refuse")
def test_r2_define_refuse():
    d = "#define OP 0xC3\n"
    assert run(d + F("g", ""), d + F("g", E("OP"))) != []
@case(2, "literal -> equal define (same value)", "pass")
def test_r2_literal_to_define_pass():
    d = "#define OP 0xC3\n"
    assert run(d + F("g", E("0xC3")), d + F("g", E("OP"))) == []
@case(2, "nested define OP->OP2->0xC3, literal swap", "pass")
def test_r2_nested_define_pass():
    d = "#define OP2 0xC3\n#define OP OP2\n"
    assert run(d + F("g", E("0xC3")), d + F("g", E("OP"))) == []
@case(2, "nested emit macro TWO -> ONE ONE (ONE = __emit)", "refuse")
def test_r2_nested_emit_macro_refuse():
    d = "#define ONE __emit 0xC3\n#define TWO ONE ONE\n"
    assert run(d + F("g", ""), d + F("g", "\tTWO\n")) != []
@case(2, "multi-byte macro used once more", "refuse")
def test_r2_multibyte_macro_refuse():
    d = "#define PRO __emit 0x55 __emit 0x8B __emit 0xEC\n"
    assert run(d + F("g", "\tPRO\n"), d + F("g", "\tPRO\n\tPRO\n")) != []
@case(2, "function-like macro E(x), arg value changed", "refuse")
def test_r2_fnlike_macro_value_refuse():
    d = "#define EB(x) __emit x\n"
    assert run(d + F("g", "\tEB(0x90)\n"), d + F("g", "\tEB(0xC3)\n")) != []
@case(2, "function-like macro E(x), new use in clean function", "refuse")
def test_r2_fnlike_macro_new_refuse():
    d = "#define EB(x) __emit x\n"
    assert run(d + F("g", ""), d + F("g", "\tEB(0xC3)\n")) != []
@case(2, "macro from included game/ header used in clean fn", "refuse")
def test_r2_game_header_macro_refuse():
    hdr = {H: "#define RAWH __emit 0xC3\n"}
    inc = '#include "Common/ProbeEmit.h"\n'
    assert run(inc + F("g", ""), inc + F("g", "\tRAWH\n"), hdr) != []
@case(2, "#undef then redefine with new value", "refuse")
def test_r2_undef_redefine_refuse():
    b = "#define OP 0x90\n" + F("g", E("OP"))
    a = "#define OP 0x90\n#undef OP\n#define OP 0xC3\n" + F("g", E("OP"))
    assert run(b, a) != []
@case(2, "enum explicit value added", "refuse")
def test_r2_enum_explicit_refuse():
    en = "enum { A = 0x90, B = 0xC3 };\n"
    assert run(en + F("g", ""), en + F("g", E("B"))) != []
@case(2, "enum implicit increment == literal", "pass")
def test_r2_enum_implicit_pass():
    en = "enum { A = 0x90, B };\n"
    assert run(en + F("g", E("0x91")), en + F("g", E("B"))) == []
@case(2, "enum implicit value shifted by inserting member", "refuse")
def test_r2_enum_shift_refuse():
    assert run("enum { A = 0x90, B };\n" + F("g", E("B")),
               "enum { A = 0x90, Z, B };\n" + F("g", E("B"))) != []
@case(2, "const int operand value changed", "refuse")
def test_r2_const_int_refuse():
    assert run("const int K = 0x90;\n" + F("g", E("K")),
               "const int K = 0xC3;\n" + F("g", E("K"))) != []
@case(2, "static const operand value changed", "refuse")
def test_r2_static_const_refuse():
    assert run("static const int K = 0x90;\n" + F("g", E("K")),
               "static const int K = 0xC3;\n" + F("g", E("K"))) != []
@case(2, "static const == literal swap", "pass")
def test_r2_static_const_swap_pass():
    k = "static const int K = 0x90;\n"
    assert run(k + F("g", E("0x90")), k + F("g", E("K"))) == []

# --- R3 scopes ---
@case(3, "N::f -> M::f (namespaces)", "refuse")
def test_r3_ns_refuse():
    assert run("namespace N {\n" + F("f", E("0x90")) + "}\nnamespace M {\n" + F("f", "") + "}\n",
               "namespace N {\n" + F("f", "") + "}\nnamespace M {\n" + F("f", E("0x90")) + "}\n") != []
@case(3, "overloads f(int) -> f(char) same namespace", "refuse")
def test_r3_overload_refuse():
    b = "void f(int)\n{\n\t__asm {\n\t__emit 0x90\n\t}\n}\nvoid f(char)\n{\n}\n"
    a = "void f(int)\n{\n}\nvoid f(char)\n{\n\t__asm {\n\t__emit 0x90\n\t}\n}\n"
    assert run(b, a) != []
@case(3, "out-of-class A::B::f -> A::C::f", "refuse")
def test_r3_out_of_class_refuse():
    assert run(F("A::B::f", E("0x90")) + F("A::C::f", ""), F("A::B::f", "") + F("A::C::f", E("0x90"))) != []
@case(3, "anonymous namespace f -> global f", "refuse")
def test_r3_anon_refuse():
    assert run("namespace {\n" + F("f", E("0x90")) + "}\n" + F("g", ""),
               "namespace {\n" + F("f", "") + "}\n" + F("g", E("0x90"))) != []
@case(3, "anon ns f -> ::f (same name, different scope)", "refuse")
def test_r3_anon_same_name_refuse():
    assert run("namespace {\n" + F("f", E("0x90")) + "}\n",
               "namespace {\n" + F("f", "") + "}\n" + F("::f", E("0x90"))) != []
@case(3, "template f<int> body -> f<char> specialization", "refuse")
def test_r3_template_refuse():
    b = "template<class T> " + F("f", E("0x90")) + "template<> " + F("f<char>", "")
    a = "template<class T> " + F("f", "") + "template<> " + F("f<char>", E("0x90"))
    assert run(b, a) != []
@case(3, "move between N::f and N::g, macro w/o ';' before namespace", "refuse")
def test_r3_macro_before_namespace_refuse():
    pre = "DECLARE_THING(Foo)\nnamespace N {\n"
    assert run(pre + F("f", E("0x90")) + F("g", "") + "}\n",
               pre + F("f", "") + F("g", E("0x90")) + "}\n") != []
@case(3, "in-class method -> sibling class method same name", "refuse")
def test_r3_class_inline_refuse():
    assert run("class A {\n" + F("f", E("0x90")) + "};\nclass B {\n" + F("f", "") + "};\n",
               "class A {\n" + F("f", "") + "};\nclass B {\n" + F("f", E("0x90")) + "};\n") != []

# --- R4 no file-wide cancellation ---
@case(4, "delete f's bytes, add same bytes to g", "refuse")
def test_r4_swap_refuse():
    assert run(F("f", E("0x90")) + F("g", ""), F("f", "") + F("g", E("0x90"))) != []
@case(4, "file-scope emit (key None) moved into fn", "refuse")
def test_r4_none_refuse():
    assert run("#pragma x\n__emit 0x90;\n" + F("g", ""), F("g", E("0x90"))) != []
@case(4, "define-owned bytes moved: macro deleted, literal added", "refuse")
def test_r4_define_to_fn_refuse():
    assert run("#define RAW __emit 0x90\n" + F("g", ""), F("g", E("0x90"))) != []


# --- round-2 fixes, one or more tests each ---
def test_fix1_nested_emit_macro_value_is_expanded():
    b = "#define ONE __emit 0x90\n#define TWO ONE ONE\n" + F("g", "\tTWO\n")
    a = "#define ONE __emit 0xC3\n#define TWO ONE ONE\n" + F("g", "\tTWO\n")
    assert run(b, a) != []


def test_fix1_three_level_macro_same_bytes_passes():
    d = "#define ONE __emit 0xC3\n#define TWO ONE ONE\n#define FOUR TWO TWO\n"
    assert run(d + F("g", "\tFOUR\n") + F("h", ""), d + F("g", "\tFOUR\n") + F("h", "")) == []


def test_fix2_fnlike_macro_same_arg_reshown_passes():
    d = "#define EB(x) __emit x\n"
    assert run("int y;\n" + d + F("g", "\tEB(0x90)\n"), d + F("g", "\tEB(0x90)\n")) == []


def test_fix2_fnlike_macro_arg_by_value_passes():
    d = "#define EB(x) __emit x\n"
    assert run(d + F("g", E("0x90")), d + F("g", "\tEB(0x90)\n")) == []


def test_fix3_header_macro_value_change_refused_in_header():
    inc = '#include "Common/ProbeEmit.h"\n'
    b = {P: inc + F("g", "\tRAWH\n"), H: "#define RAWH __emit 0x90\n"}
    a = {P: inc + F("g", "\tRAWH\n"), H: "#define RAWH __emit 0xC3\n"}
    assert _gate(b, a) != []


def test_fix3_header_macro_reshown_use_passes():
    hdr = {H: "#define RAWH __emit 0xC3\n"}
    inc = '#include "Common/ProbeEmit.h"\n'
    assert run("int y;\n" + inc + F("g", "\tRAWH\n"), inc + F("g", "\tRAWH\n"), hdr) == []


def test_fix3_header_constant_resolves():
    hdr = {H: "#define OPH 0x90\n#define USEH __emit OPH\n"}
    inc = '#include "Common/ProbeEmit.h"\n'
    assert run(inc + F("g", E("0x90")), inc + F("g", E("OPH")), hdr) == []


def test_fix4_const_literal_swap_passes():  # M2: constants unresolved -> red
    k = "const int K = 0x90;\n"
    assert run(k + F("g", E("0x90")), k + F("g", E("K"))) == []


def test_fix4_const_value_change_refused():  # M2 -> red
    assert run("const unsigned char K = 0x90;\n" + F("g", E("K")),
               "const unsigned char K = 0xC3;\n" + F("g", E("K"))) != []


def test_enum_value_change_refused():  # M4: enums unparsed -> red
    assert run("enum { B = 0x90 };\n" + F("g", E("B")),
               "enum { B = 0xC3 };\n" + F("g", E("B"))) != []


def test_enum_literal_swap_passes():  # M4 -> red
    assert run("enum { B = 0xC3 };\n" + F("g", E("0xC3")),
               "enum { B = 0xC3 };\n" + F("g", E("B"))) == []


def test_fix6_extern_c_after_macro_is_a_scope():
    pre = "DECLARE_THING(Foo)\nextern \"C\" {\n"
    assert run(pre + F("f", E("0x90")) + F("g", "") + "}\n",
               pre + F("f", "") + F("g", E("0x90")) + "}\n") != []


def test_fix6_struct_after_macro_is_a_scope():
    pre = "DECLARE_THING(Foo)\nstruct S : public Base {\n"
    assert run(pre + F("f", E("0x90")) + F("g", "") + "};\n",
               pre + F("f", "") + F("g", E("0x90")) + "};\n") != []


def test_fix6_function_returning_struct_is_still_a_function():
    # `struct S* f()` must stay a function: re-showing its emit passes.
    body = "struct S* f()\n{\n\t__asm {\n\t__emit 0x90\n\t}\n}\n"
    assert run("int y;\n" + body, body) == []


# --- orchestrator spot checks of b87538b88a (build/r2_g/test_orch_extra.py) ---
I = "game/GameEngine/Include/Common/ProbeEmit.inl"
H2 = "game/GameEngine/Include/Common/ProbeOuter.h"


def test_token_paste_refuse():
    m = "#define CAT(a,b) a##b\n"
    assert run(m + F("g", ""), m + F("g", "\tCAT(__em,it) 0xC3\n")) != []


def test_token_paste_reshown_passes():
    m = "#define CAT(a,b) a##b\n"
    body = F("g", "\tCAT(__em,it) 0xC3\n")
    assert run("int y;\n" + m + body, m + body) == []


def test_inl_header_macro_refuse():
    inc = '#include "Common/ProbeEmit.inl"\n'
    assert run(inc + F("g", ""), inc + F("g", "\tRAWI\n"), {I: "#define RAWI __emit 0xC3\n"}) != []


def test_transitive_header_macro_refuse():
    files = {H: "#define RAWH __emit 0xC3\n", H2: '#include "Common/ProbeEmit.h"\n#define OUTER RAWH RAWH\n'}
    inc = '#include "Common/ProbeOuter.h"\n'
    assert run(inc + F("g", ""), inc + F("g", "\tOUTER\n"), files) != []


def test_header_constant_value_change_refuse():
    body = '#include "Common/ProbeEmit.h"\n' + F("g", E("OPH"))
    assert _gate({P: body, H: "#define OPH 0x90\n"}, {P: body, H: "#define OPH 0xC3\n"}) != []


def test_header_const_int_value_change_refuse():
    body = '#include "Common/ProbeEmit.h"\n' + F("g", E("KH"))
    assert _gate({P: body, H: "const int KH = 0x90;\n"}, {P: body, H: "const int KH = 0xC3;\n"}) != []


def test_header_constant_unrelated_change_passes():
    body = '#include "Common/ProbeEmit.h"\n' + F("g", E("OPH"))
    assert _gate({P: body, H: "#define OPH 0x90\n#define X 1\n"},
                 {P: body, H: "#define OPH 0x90\n#define X 2\n"}) == []


def test_header_macro_body_change_refuse():
    body = '#include "Common/ProbeEmit.h"\n' + F("g", "\tRAWH\n")
    assert _gate({P: body, H: "#define RAWH __emit 0x90\n"},
                 {P: body, H: "#define RAWH __emit 0x90 __emit 0xC3\n"}) != []


def test_plain_cpp_edit_without_emit_pass():
    assert run(F("g", "") + "int x;\n", F("g", "") + "int y;\n") == []
