reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1

reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

setup.exe /auto upgrade /compat ignorewarning /dynamicupdate enable /showoobe none /eula accept /finalize