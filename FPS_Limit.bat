@cd /D "%~dp0"
@SET "UE_4_27=C:\Program Files\Epic Games\UE_4.27\Engine\Binaries\Win64\UE4Editor.exe"

@FOR /F "usebackq tokens=1,2* " %%i in (`reg QUERY "HKLM\SOFTWARE\EpicGames\Unreal Engine\4.27" /v "InstalledDirectory" 2^> NUL`) do @(
@if %%i==InstalledDirectory @if %%j==REG_SZ set "UE_4_27=%%k\Engine\Binaries\Win64\UE4Editor.exe"
)
@if not exist "%UE_4_27%" @(
@echo UE4Editor not found; "%UE_4_27%"
@GOTO :EOF
)
@echo UE4Editor found:  "%UE_4_27%"
rem fake builddata
for %%i in (Content\VirtualRealityBP\Maps\*.umap) do (
  	if not exist Content\VirtualRealityBP\Maps\%%~ni_BuiltData.uasset (
  		fsutil file createnew Content\VirtualRealityBP\Maps\%%~ni_BuiltData.uasset 0
  	)
)

for %%i in (*.uproject) do (
start "UE4" /b "%UE_4_27%" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
rem start "UE4" /b "argprint.exe" "%~dp0%%i" -ExecCmds="t.MaxFPS 30"
GOTO :EOF
)