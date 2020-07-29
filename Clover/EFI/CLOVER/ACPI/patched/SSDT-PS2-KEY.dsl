//
DefinitionBlock ("", "SSDT", 2, "ACDT", "RMCF", 0)
{
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF,Package() 
        {
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package(){},
                    "3d=65", //BRIGHTNESS_DOWN
                    "3e=66", //BRIGHTNESS_UP
                    "e037=64", //PrtSc = F13
                    "e045=58", //Pause Break
                    "46=58", //F12

                },

                //or
                
                "Custom ADB Map", Package()
                {
                    Package(){},
                     "41=80"
                    
                }
           
            },
        })
    }
}
//EOF