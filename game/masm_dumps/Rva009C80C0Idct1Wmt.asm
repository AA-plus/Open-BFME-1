.386
.model flat
; VP6 fixed-point IDCT step. VC7.1 /O2 will not reproduce this body
; from C++ or intrinsics: the intrinsic form emits a 108-byte body with
; an aligned local frame, ten bytes more than retail's 98, and the exact
; schedule here -- pmullw, paddw, psraw, then three widening punpck stages
; to 128 bits and eight aligned movdqa stores at 16-byte strides -- needs the
; register assignment the donor uses. Measured and rejected; kept as MASM.
; Complete leaf RET at 0x009C8121 followed by fourteen INT3; no caller names
; this body and the native return and formal count are unresolved, so the
; symbol stays address-derived. Evidence:
; targets/game/reverse/identity_evidence/009c80c0-bfme2-donor.md
; ?Rva009C80C0@@YAXPBF0PAF@Z
; Retail @ 0x009C80C0 size 98
_TEXT SEGMENT
public ?Rva009C80C0@@YAXPBF0PAF@Z
?Rva009C80C0@@YAXPBF0PAF@Z PROC
    db 8Bh,44h,24h,04h,0BAh,0Fh,00h,00h,00h,66h,0Fh,6Eh,0D2h,8Bh,4Ch,24h
    db 08h,8Bh,54h,24h,0Ch,0F3h,0Fh,7Eh,00h,0F3h,0Fh,7Eh,09h,66h,0Fh,0D5h
    db 0C1h,66h,0Fh,0FDh,0C2h,66h,0Fh,71h,0E0h,05h,66h,0Fh,61h,0C0h,66h,0Fh
    db 62h,0C0h,66h,0Fh,6Ch,0C0h,66h,0Fh,6Fh,0C8h,66h,0Fh,7Fh,02h,66h,0Fh
    db 7Fh,4Ah,10h,66h,0Fh,7Fh,42h,20h,66h,0Fh,7Fh,4Ah,30h,66h,0Fh,7Fh
    db 42h,40h,66h,0Fh,7Fh,4Ah,50h,66h,0Fh,7Fh,42h,60h,66h,0Fh,7Fh,4Ah
    db 70h,0C3h
?Rva009C80C0@@YAXPBF0PAF@Z ENDP
_TEXT ENDS
END
