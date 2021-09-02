/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLjm52w3.aml, Thu Sep  2 13:19:22 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000082 (130)
 *     Revision         0x02
 *     Checksum         0x6F
 *     OEM ID           "hack"
 *     OEM Table ID     "_TPL1"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_TPL1", 0x00000000)
{
    External (_SB_.PCI0.I2C1.TPL1, DeviceObj)
    External (GPEN, FieldUnitObj)
    External (SDM1, FieldUnitObj)

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            GPEN = One
            SDM1 = Zero
        }
    }

    Scope (_SB.PCI0.I2C1.TPL1)
    {
        Name (OSYS, 0x07DD)
    }
}

