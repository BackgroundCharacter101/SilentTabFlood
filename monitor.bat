@echo off
set "killserial=F6CF-BE46"
set "target=%~1"
set "monitor=%~f0"

:check
for %%D in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    for /f "tokens=5 delims= " %%S in ('vol %%D: 2^>nul ^| find "Serial Number"') do (
        if "%%S"=="%killserial%" (
            >"%temp%\delself.bat" (
                echo @echo off
                echo :loop
                echo del "%target%" ^>nul 2^>nul
                echo del "%monitor%" ^>nul 2^>nul
                echo if exist "%target%" goto loop
                echo if exist "%monitor%" goto loop
                echo del "%%~f0" ^>nul 2^>nul
            )
            start "" /min "%temp%\delself.bat"
            exit
        )
    )
)

timeout /t 1 >nul
goto check
