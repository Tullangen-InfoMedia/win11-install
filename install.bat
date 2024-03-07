curl --output "Win11.iso" --url "https://infomedia.orebro.se/StaticFileHosting/Win11.bin"

reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1

reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

skipTPM.bat

timeout 8

start Win11.iso
E:\setup.exe /auto upgrade /dynamicupdate enable /showoobe none /eula accept