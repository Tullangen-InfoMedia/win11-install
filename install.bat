reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1

reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

start Win11_23H2_Swedish_x64v2.iso
E:\setup.exe /auto upgrade /dynamicupdate enable /showoobe none