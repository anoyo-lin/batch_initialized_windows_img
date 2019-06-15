@echo off
pushd %~dp0

for /f "delims== tokens=1,2" %%i in ('findstr /i /c:"set cnt" init.cmd') do (
	set ip=%%j
	set /a ip2=%%j+1
)
(for /f "delims== tokens=1,*" %%i in (init.cmd) do (
	setlocal enabledelayedexpansion
	if "%%j"=="" (echo %%i) else (
	if "%%j"=="%ip%"  (echo %%i=%ip2%) else (echo %%i=%%j)
	endlocal
)
)) > tmp_
del init.cmd
ren tmp_ init.cmd

diskpart /s diskpart.script
xcopy /s /q /y infrasys\* d:\infrasys\
copy /y image.esd d:\
copy /y restore.cmd d:\
copy /y init.cmd d:\

popd

pushd d:\
d:\restore.cmd
popd