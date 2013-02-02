::Initial GuTHub

::Set our Window Title
@title GitHub_Uility_3663

::Set our default parameters
@echo off
color 0a



:menuLOOP

	call:header
	::Print our header
	::call:header
	
	::Load up our menu selections
	echo. 
	echo.
	for /f "tokens=1,2,* delims=_ " %%A in ('"C:/Windows/system32/findstr.exe /b /c:":menu_" "%~f0""') do echo.  %%B  %%C
	
	call:printstatus

	set choice=
	echo.&set /p choice= Please make a selection or hit ENTER to exit: ||GOTO:EOF
	echo.&call:menu_%choice%
	
GOTO:menuLOOP

:menu_1    ----Install GitHub CMD for windows----
cls
color 0a	
	echo [*] Installing Github for windows Cmd
	echo [*] Just click next on all the windows
	echo [*] I promise you everything will work out just fine.
	echo --------------------------------------------------------------
	pause 
GithubInstall.exe
echo.[*] Once you completed the install congrats! 
echo.[*] Now you can use the other options in this program
	
	set choice=
	echo.&set /p choice= Please make a selection or hit ENTER to return: ||GOTO:EOF
	echo.&call:bootsubmenu_%choice%
color 0b	
cls
GOTO:EOF

:menu_2 ----Pull 2013FRC Repo----
cls
color 0a
echo [*]
echo [*] This will pull the latest 2013FRC into your WindRiver workspace folder
pause
echo [*] *Hint The thing you should put into the next prompt is C:\WindRiver\workspace
echo [*] If you know what you are doing then go ahead and ignore that last statement
set /p Path = "Enter Directory: C:\"
git clone https://github.com/team3663/2013FRC.git C:\%Path%
echo [*] Done
echo [*] Press any key to exit.
pause

	set choice=
	echo.&set /p choice= Please make a selection or hit ENTER to return: ||GOTO:EOF
	echo.&call:extrasubmenu_%choice%
color 0a	
cls
GOTO:EOF


:menu_3    Commit and Push Changes
cls
color 0a
echo. Starting github setup with 2013FRC
pause
cd C:\WindRiver\workspace\2013FRC
git init
git remote add 2013FRC https://github.com/team3663/2013FRC.git
git checkout master
set /p Username = Please enter your github username: 
set /p Email = Please enter your github emal: 
git --global user.name %Username%
git --global user.email %Email%
echo. Starting commit
git add -A
set /p Commit = Please enter your commit message: 
git commit -m "%Commit%"
pause

	
	set choice=
	echo.&set /p choice= Please make a selection or hit ENTER to return: ||GOTO:EOF
	echo.&call:extrasubmenu_%choice%
color 0b	
cls	
GOTO:EOF

:menu_4    Install Save Credentials
cls
color 0a
echo.This wll save you some time
pause
gitwinstore.exe
pause

	
	set choice=
	echo.&set /p choice= Please make a selection or hit ENTER to return: ||GOTO:EOF
	echo.&call:extrasubmenu_%choice%
cls	
GOTO:EOF



:header  
cls        
color 0a
adb kill-server
adb start-server
cls
	echo.
	echo.                ---------------------------
	echo.          -------------Github Utility-----------------
	echo.               --------by Kainoa Seto--------
	echo.               ----------------------------
	echo.
pause
cls	
color 0a
GOTO:EOF

:printstatus
	echo.
	echo. For Team 3663

GOTO:EOF

