@echo off

goto comment

Copyright 2020 Charles Ganza

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

:comment

echo Welcome to package manager for Android!
echo.
echo 1: Enable
echo 0: Disable

set /a enable_package = 1
set /a disable_package = 0
set whatsapp_= com.whatsapp
set instagram_= com.instagram.android
set facebook_= com.facebook.katana

echo.

:prompt
set /p operation= "Enter operation: " 
if not "%operation%" == "1" if not "%operation%" == "0" (
	echo Enter a valid operation! 1 for enable and 0 for disable
	echo.
	goto prompt
)

echo.
echo Quick links
echo.
echo W: Whatsapp
echo F: Facebook
echo I: Instagram
echo.
set /p package_name= "Enter package name: "

if "%package_name%" == "W" (goto whatsapp)
if "%package_name%" == "F" (goto facebook)
if "%package_name%" == "I" (goto instagram)

echo %package_name% 

::if the user didn't use quick links
if %operation% == %enable_package% (adb shell pm enable %package_name%) else (adb shell pm disable-user --user 0 %package_name%)

:whatsapp
if "%package_name%" == "W" if %operation% == %enable_package% (adb shell pm enable %whatsapp_%) else (adb shell pm disable-user --user 0 %whatsapp_%)
:instagram
if "%package_name%" == "I" if %operation% == %enable_package% (adb shell pm enable %instagram_%) else (adb shell pm disable-user --user 0 %instagram_%)
:facebook
if "%package_name%" == "F" if %operation% == %enable_package% (adb shell pm enable %facebook_%) else (adb shell pm disable-user --user 0 %facebook_%)

echo.

pause