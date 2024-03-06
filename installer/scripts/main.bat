@echo off
echo downloading file..
powershell -c "Invoke-WebRequest -Uri 'https://github.com/quandie/roblox-nextbot-possession/archive/refs/heads/main.zip' -OutFile './nextbot_possession.zip'"
:start
echo waiting for file..
timeout /t 10 /nobreak
IF EXIST "./nextbot_possession.zip" (
    echo file found, calling script..
    call "open.bat"
) ELSE (
    echo file isnt founded, trying again..
    goto start
)
pause