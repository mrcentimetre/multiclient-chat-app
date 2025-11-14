@echo off
REM Run script for Enhanced Chat Client (Windows)

echo =========================================
echo   Enhanced Chat Client
echo =========================================

REM Check if JAR exists
if not exist "dist\ChatClient.jar" (
    echo ERROR: ChatClient.jar not found!
    echo Please run build.bat first to build the application.
    pause
    exit /b 1
)

REM Run the client
echo Starting client...
java -jar dist\ChatClient.jar
pause
