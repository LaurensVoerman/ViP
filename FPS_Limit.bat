cd /D "%~dp0"
for %%i in (*.uproject) do (
start "UE4" /b "C:\Program Files\Epic Games\UE_4.26\Engine\Binaries\Win64\UE4Editor.exe" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
rem start "UE4" /b "argprint.exe" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
goto EOF
)