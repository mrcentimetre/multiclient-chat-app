@echo off
REM Run script for Enhanced Chat Server (Windows)

echo =========================================
echo   Enhanced Chat Server
echo =========================================

REM Check if JAR exists
if not exist "dist\ChatServer.jar" (
    echo ERROR: ChatServer.jar not found!
    echo Please run build.bat first to build the application.
    pause
    exit /b 1
)

REM Run the server
echo Starting server...
java -jar dist\ChatServer.jar
pause
