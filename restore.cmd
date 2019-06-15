@echo off
dism /Apply-Image /ImageFile:image.esd /Index:1 /ApplyDir:C:\
bcdboot C:\windows /s C:
copy /y init.cmd C:\
del /q init.cmd
shutdown /r /t 3
del /q restore.cmd
