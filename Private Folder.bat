@ECHO OFF
title Private Folder
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST "Private Folder" goto MDLOCKER

:CONFIRM
cls
echo Type Yes To Lock Private Folder Or Type No To Keep It Unlocked.
set/p "cho=>"
if %cho%==Yes goto LOCK
if %cho%==yes goto LOCK
if %cho%==No goto REMAIN
if %cho%==no goto REMAIN
if NOT %cho%==Yes goto WRONG
if NOT %cho%==yes goto WRONG
if NOT %cho%==No goto WRONG
if NOT %cho%==no goto WRONG
goto CONFIRM

:WRONG
cls
echo Invalid Option Try Again.   Type Yes To Lock Private Folder Or Type No To Keep It Unlocked.
set/p "cho=>"
if %cho%==Yes goto LOCK
if %cho%==yes goto LOCK
if %cho%==No goto REMAIN
if %cho%==no goto REMAIN
if NOT %cho%==Yes goto WRONG
if NOT %cho%==yes goto WRONG
if NOT %cho%==No goto WRONG
if NOT %cho%==no goto WRONG
goto WRONG

:LOCK
cls
ren "Private Folder" "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
goto LOCKED

:LOCKED
cls
echo Private Folder Was Successfully Locked.
goto END

:UNLOCK
cls
echo Type In Your Password To Unlock Private Folder.
set/p "pass=>"
if NOT %pass%== ..... goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" "Private Folder"
goto UNLOAD

:UNLOAD
cls
echo Private Folder Was Successfully Unlocked.
goto END

:FAIL
cls
echo Invalid Password Try Again.   Type In Your Password To Unlock Private Folder.
set/p "pass=>" goto UNLOCKED
if NOT %pass%== ..... goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" "Private Folder"
goto UNLOAD

:UNLOCKED
cls
echo Private Folder Was Successfully Unlocked.
goto END

:REMAIN
cls
echo This Folder Will Remain Unlocked.
goto END

:MDLOCKER
md "Private Folder"
echo Private Folder Was Successfully Created.   Use This Batch File To Lock And Unlock Private Folder.
goto End

:END
timeout 5