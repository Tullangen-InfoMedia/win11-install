@echo off

if %ERRORLEVEL% equ 0 (
    echo Running as Administrator
) else (
    echo You are NOT Administrator. Exiting...
    EXIT /B 1
)

cd /d "%~dp0"

if not exist Win11.iso (
	echo Downloading ISO
	curl --output "Win11.iso" --url "https://infomedia.orebro.se/StaticFileHosting/Win11.bin"
) else (
	echo ISO already exists, using existing
)

rem echo Setting registry keys
rem reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig
rem reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassTPMCheck /t REG_DWORD /d 1
rem reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig /v BypassSecureBootCheck /t REG_DWORD /d 1

rem reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup
rem reg add HKEY_LOCAL_MACHINE\SYSTEM\Setup\MoSetup /v AllowUpgradesWithUnsupportedTPMOrCPU /t REG_DWORD /d 1

rem echo Bypassing TPM requirement
rem start skipTPM.bat

rem echo Waiting
rem timeout 8

echo Mounting ISO
start Win11.iso

echo Waiting for mount
timeout 8

echo Starting setup
start /b E:\setup.exe /auto upgrade /dynamicupdate enable /showoobe none /eula accept /copylogs C:\Win11Temp

pause