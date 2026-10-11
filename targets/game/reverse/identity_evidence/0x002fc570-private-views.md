# Private views in command-bar removal

Retail 0x002FC570..0x002FC73F is identified by executeAction COMMANDBAR_REMOVE_BUTTON_OBJECTTYPE, but that does not identify every private view with an EA class. The receiver returned by findTemplate is used at +0x2C as the command-set string passed to ControlBar::findCommandSet and at +0x294/+0x298 as vector bounds. name_oracle ThingTemplate+0x2C independently reports m_placementViewAngle, conflicting with this use: the old bank view cannot honestly claim the canonical ThingTemplate field identity. Its private view now retains the target address and offsets.

name_oracle CommandButton+0xC reports no BFME witness, only a Zero Hour m_name hint. Retail compares that string through AsciiString::compare. The string heap prefix contains count at +4 and capacity at +6; these layout facts do not establish the old bank's descriptive private member names. Raw dis_retail 0x002FC570 463 documents the reads; exact source/DIR32 gates remain unchanged.

The ModuleInfo vector bounds are measured private views. No specific identity is claimed for the unused 20-byte nugget fields. The private types retain Rva002FC570 and their fields retain offsets; existing external callee class names remain pinned and unchanged.
