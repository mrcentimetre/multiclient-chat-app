@echo off
REM Script to create a distributable release package (Windows)

set VERSION=1.0.0
set RELEASE_NAME=enhanced-chat-app-v%VERSION%

echo =========================================
echo   Creating Release Package v%VERSION%
echo =========================================

REM Build the application first
echo Building application...
call build.bat

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Build failed!
    exit /b 1
)

REM Create release directory
echo Creating release directory...
if not exist release mkdir release
if exist "release\%RELEASE_NAME%" rd /s /q "release\%RELEASE_NAME%"
mkdir "release\%RELEASE_NAME%"

REM Copy JAR files
echo Copying application files...
copy dist\ChatServer.jar "release\%RELEASE_NAME%\"
copy dist\ChatClient.jar "release\%RELEASE_NAME%\"

REM Copy run scripts
copy run-server.sh "release\%RELEASE_NAME%\"
copy run-server.bat "release\%RELEASE_NAME%\"
copy run-client.sh "release\%RELEASE_NAME%\"
copy run-client.bat "release\%RELEASE_NAME%\"

REM Create logs directory
if not exist "release\%RELEASE_NAME%\logs" mkdir "release\%RELEASE_NAME%\logs"

REM Create README
(
echo ========================================
echo Enhanced Multi-Client Chat Application
echo Version %VERSION%
echo ========================================
echo.
echo QUICK START GUIDE
echo -----------------
echo.
echo REQUIREMENTS:
echo - Java 8 or higher installed on your system
echo - No additional dependencies needed!
echo.
echo HOW TO RUN:
echo -----------
echo.
echo 1. START THE SERVER ^(First^):
echo    - Double-click: run-server.bat
echo    - Or run: java -jar ChatServer.jar
echo.
echo 2. START CLIENT^(S^):
echo    - Double-click: run-client.bat
echo    - Or run: java -jar ChatClient.jar
echo.
echo 3. LOGIN:
echo    - Enter any username ^(3-20 characters^)
echo    - Server host: localhost
echo    - Server port: 5000
echo    - Click "Connect"
echo.
echo 4. CHAT:
echo    - Send messages in the group chat
echo    - Select a user and click "Private Chat" for one-to-one messaging
echo.
echo FEATURES:
echo ---------
echo - Real-time group chat with multiple users
echo - Private one-to-one messaging
echo - Online users list
echo - Professional GUI interface
echo.
echo ========================================
) > "release\%RELEASE_NAME%\README.txt"

REM Create ZIP using PowerShell
echo Creating ZIP archive...
powershell -command "Compress-Archive -Path 'release\%RELEASE_NAME%' -DestinationPath 'release\%RELEASE_NAME%.zip' -Force"

echo.
echo =========================================
echo   Release Package Created Successfully!
echo =========================================
echo Package: release\%RELEASE_NAME%.zip
echo.
echo To distribute:
echo   1. Upload to GitHub Releases
echo   2. Or share the ZIP file directly
echo =========================================
pause
