@echo off

set SCREENCAP_FILE_PREFIX=screenshot
set SCREENCAP_WORKING_DIR=/sdcard/

rem adb path, leave blank if adb is already on the user or system path
set SCREENCAP_ADB_PATH=

rem create output file name and path from parameters and date and time
rem loop

:CLOCK
rem FOR /L %%A IN (1,1,1) DO (
rem removing the upper for loop
set Timestamp=%date:~0,2%-%date:~3,2%-%date:~6,4%-%time:~0,2%-%time:~3,2%-%time:~6,2%-%time:~9,2%
set SCREENCAP_FILE_NAME=%SCREENCAP_FILE_PREFIX%-%Timestamp%.png
set SCREENCAP_FILE_PATH=%SCREENCAP_WORKING_DIR%%SCREENCAP_FILE_NAME%

rem calling adb shell screencap, pull and remove the previos file
%SCREENCAP_ADB_PATH%adb shell screencap -p %SCREENCAP_FILE_PATH%
%SCREENCAP_ADB_PATH%adb pull %SCREENCAP_FILE_PATH%
%SCREENCAP_ADB_PATH%adb shell rm %SCREENCAP_FILE_PATH%
goto:CLOCK
