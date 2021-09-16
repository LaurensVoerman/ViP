@cd /D "%~dp0"
@SET "UE_4_26=C:\Program Files\Epic Games\UE_4.26\Engine\Binaries\Win64\UE4Editor.exe"

@FOR /F "usebackq tokens=1,2* " %%i in (`reg QUERY "HKLM\SOFTWARE\EpicGames\Unreal Engine\4.26" /v "InstalledDirectory" 2^> NUL`) do @(
@if %%i==InstalledDirectory @if %%j==REG_SZ set "UE_4_26=%%k\Engine\Binaries\Win64\UE4Editor.exe"
)
@if not exist "%UE_4_26%" @(
@echo UE4Editor not found; "%UE_4_26%"
@GOTO :EOF
)
@echo UE4Editor found:  "%UE_4_26%"

for %%i in (*.uproject) do (
start "UE4" /b "%UE_4_26%" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
rem start "UE4" /b "argprint.exe" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
GOTO :EOF
)