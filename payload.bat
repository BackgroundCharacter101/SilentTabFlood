@echo off
setlocal EnableDelayedExpansion

:: === Start kill monitor silently ===
start "" cmd /c monitor.bat "%~f0"

:: === Set the tab count and maximum number ===
set /a count=0
set /a max_count=20

:: === Loop to open tabs faster ===
:loop
if !count! lss !max_count! (
    start "" "https://earth.google.com/web/@22.95617415,11.99957293,-994.69698081a,33169858.85265827d,35y,-0h,0t,0r/data=CgRCAggBSg0I____________ARAA"
    set /a count+=1
    timeout /t 1 >nul  :: Minimal delay (1 second)
    goto loop
)

:: Exit silently when done
exit
