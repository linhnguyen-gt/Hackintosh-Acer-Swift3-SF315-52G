/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLuL0cPh.aml, Sat Jun  6 13:22:50 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000334 (820)
 *     Revision         0x02
 *     Checksum         0x72
 *     OEM ID           "hack"
 *     OEM Table ID     "_TPL1"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_TPL1", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.INUM, MethodObj)    // 1 Arguments (from opcode)
    External (_SB_.PCI0.HIDD, MethodObj)    // 5 Arguments (from opcode)
    External (_SB_.PCI0.HIDG, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.I2C0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.TP7D, MethodObj)    // 6 Arguments (from opcode)
    External (_SB_.PCI0.TP7G, UnknownObj)    // (from opcode)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments (from opcode)
    External (GPEN, FieldUnitObj)    // (from opcode)
    External (GPLI, FieldUnitObj)    // (from opcode)
    External (OSYS, FieldUnitObj)    // (from opcode)
    External (SBFI, IntObj)    // (from opcode)
    External (SBRG, FieldUnitObj)    // (from opcode)
    External (SDM0, FieldUnitObj)    // (from opcode)
    External (SDM1, FieldUnitObj)    // (from opcode)
    External (SDS0, FieldUnitObj)    // (from opcode)
    External (SDS1, FieldUnitObj)    // (from opcode)
    External (TCTP, FieldUnitObj)    // (from opcode)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            Store (One, GPEN)
            Store (One, SBRG)
            Store (Zero, SDM1)
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
        Device (TPXX)
        {
            Name (HID2, Zero)
            Name (SBFB, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x004C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, _Y00, Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y01)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFB, \_SB.PCI0.I2C1.TPXX._Y00._ADR, BADR)  // _ADR: Address
            CreateDWordField (SBFB, \_SB.PCI0.I2C1.TPXX._Y00._SPE, SPED)  // _SPE: Speed
            CreateDWordField (SBFI, \_SB.PCI0.I2C1.TPXX._Y01._INT, INT2)  // _INT: Interrupts
            CreateWordField (SBFG, 0x17, INT1)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                Store (GNUM (GPLI), INT1)
                Store (INUM (GPLI), INT2)
                SHPO (GPLI, One)
                If (LEqual (TCTP, One))
                {
                    Store ("SYNA7DB5", _HID)
                    Store (0x20, HID2)
                    Store (0x2C, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                If (LEqual (TCTP, 0x02))
                {
                    Store ("ELAN0501", _HID)
                    Store (One, HID2)
                    Store (0x15, BADR)
                    Store (0x00061A80, SPED)
                    Return (Zero)
                }

                Store ("ELAN0501", _HID)
                Store (One, HID2)
                Store (0x15, BADR)
                Store (0x00061A80, SPED)
                Return (Zero)
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50")  // _CID: Compatible ID
            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (TPSW, Zero)
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }

                If (LEqual (Arg0, TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFB, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                           
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFB, SBFI))
            }
        }
    }
}

