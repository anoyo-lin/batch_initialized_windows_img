@echo off
set cnt=30
set pcname=MTQ-FB-POS%cnt%
set name=本地连接
set ip=10.12.9.%cnt%
set mask=255.255.255.0
set gw=10.12.9.1
set dns1=8.8.8.8
set dns2=8.8.4.4
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Prefs\infrasys\gourmate4g\udid" /v "/U/D/I/D" /t reg_sz /d %cnt% /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName" /v ComputerName /t reg_sz /d %pcname% /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName" /v ComputerName /t reg_sz /d %pcname% /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" /t reg_sz /d %pcname% /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v Hostname /t reg_sz /d %pcname% /f >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Start Page" /t reg_sz /d "about:blank" /f >nul 2>nul
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t reg_sz /d "about:blank" /f >nul 2>nul
netsh interface ip set address name=%name% source=static addr=%ip% mask=%mask% gateway=%gw% >nul 2>nul
netsh interface ip set dns name=%name% source=static addr=%dns1% >nul 2>nul
netsh interface ip add dns %name% %dns2% index=2 >nul 2>nul
del /q "c:\init.cmd"
