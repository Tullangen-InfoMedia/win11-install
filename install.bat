@echo off

cd /d "%~dp0"

if not exist Win11.iso (
	echo Downloading ISO
	curl --output "Win11.iso" --url "https://infomedia.orebro.se/StaticFileHosting/Win11.bin"
) else (
	echo ISO already exists, using existing
)

echo Setting registry keys
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1

reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup
reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

echo Bypassing TPM requirement
start skipTPM.bat

echo Waiting
timeout 8

echo Mounting ISO
start Win11.iso

echo Starting setup
E:\setup.exe /auto upgrade /dynamicupdate enable /showoobe none /eula accept /copylogs C:\Win11Temp\win11.log

pause