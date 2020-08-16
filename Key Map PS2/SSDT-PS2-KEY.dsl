DefinitionBlock ("", "SSDT", 2, "ACDT", "RMCF", 0x00000000)
{
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF, Package ()
        {
            "Keyboard", 
            Package (0x04)
            {
                "Custom PS2 Map", 
                Package ()
                {
                    Package (){}, 
                    "3d=65", // FN + F3 => F14 Decrease brightness
                    "3e=66", // FN + F4 => F15 Decrease brightness
                    "e037=64", // PrtSc => F13 
                    "e045=58", 
                    "46=58"
                }, 

                "Custom ADB Map", 
                Package (0x02)
                {
                    Package (0x00){}, 
                    "41=0" //F7 = 0
                }
            }
        })
    }
}

