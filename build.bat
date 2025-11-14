@echo off
REM Build script for Enhanced Chat Application (Windows)
REM Creates executable JAR files for server and client

echo =========================================
echo   Building Enhanced Chat Application
echo =========================================

REM Create necessary directories
echo Creating build directories...
if not exist bin mkdir bin
if not exist dist mkdir dist

REM Clean previous build
echo Cleaning previous build...
del /Q bin\* 2>nul
del /Q dist\* 2>nul

REM Compile all Java files
echo Compiling Java source files...
javac -encoding UTF-8 -d bin ^
    src/common/*.java ^
    src/server/*.java ^
    src/client/*.java ^
    src/client/ui/*.java ^
    src/client/utils/*.java ^
    src/client/files/*.java

if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Compilation failed!
    exit /b 1
)

echo Compilation successful!

REM Create Server JAR
echo Creating Server JAR...
(
echo Manifest-Version: 1.0
echo Main-Class: server.Server
echo Class-Path: .
) > bin\server-manifest.txt

cd bin
jar cvfm ..\dist\ChatServer.jar server-manifest.txt common\*.class server\*.class
cd ..

REM Create Client JAR
echo Creating Client JAR...
(
echo Manifest-Version: 1.0
echo Main-Class: client.ui.LoginUI
echo Class-Path: .
) > bin\client-manifest.txt

cd bin
if exist "client\files" (
    jar cvfm ..\dist\ChatClient.jar client-manifest.txt common\*.class client\*.class client\ui\*.class client\utils\*.class client\files\*.class
) else (
    jar cvfm ..\dist\ChatClient.jar client-manifest.txt common\*.class client\*.class client\ui\*.class client\utils\*.class
)
cd ..

REM Create logs directory in dist
if not exist dist\logs mkdir dist\logs

echo.
echo =========================================
echo   Build Complete!
echo =========================================
echo Server JAR: dist\ChatServer.jar
echo Client JAR: dist\ChatClient.jar
echo.
echo To run:
echo   Server: java -jar dist\ChatServer.jar
echo   Client: java -jar dist\ChatClient.jar
echo =========================================
pause
