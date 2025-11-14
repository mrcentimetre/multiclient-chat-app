#!/bin/bash
# Build script for Enhanced Chat Application
# Creates executable JAR files for server and client

echo "========================================="
echo "  Building Enhanced Chat Application"
echo "========================================="

# Create necessary directories
echo "Creating build directories..."
mkdir -p bin
mkdir -p dist

# Clean previous build
echo "Cleaning previous build..."
rm -rf bin/*
rm -rf dist/*

# Compile all Java files
echo "Compiling Java source files..."
javac -encoding UTF-8 -d bin \
    src/common/*.java \
    src/server/*.java \
    src/client/*.java \
    src/client/ui/*.java \
    src/client/utils/*.java \
    src/client/files/*.java

if [ $? -ne 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 1
fi

echo "Compilation successful!"

# Create Server JAR
echo "Creating Server JAR..."
cat > bin/server-manifest.txt << EOF
Manifest-Version: 1.0
Main-Class: server.Server
Class-Path: .
EOF

cd bin
jar cvfm ../dist/ChatServer.jar server-manifest.txt \
    common/*.class \
    server/*.class
cd ..

# Create Client JAR
echo "Creating Client JAR..."
cat > bin/client-manifest.txt << EOF
Manifest-Version: 1.0
Main-Class: client.ui.LoginUI
Class-Path: .
EOF

cd bin
# Add files directory if it exists
if [ -d "client/files" ]; then
    jar cvfm ../dist/ChatClient.jar client-manifest.txt \
        common/*.class \
        client/*.class \
        client/ui/*.class \
        client/utils/*.class \
        client/files/*.class
else
    jar cvfm ../dist/ChatClient.jar client-manifest.txt \
        common/*.class \
        client/*.class \
        client/ui/*.class \
        client/utils/*.class
fi
cd ..

# Create logs directory in dist
mkdir -p dist/logs

echo ""
echo "========================================="
echo "  Build Complete!"
echo "========================================="
echo "Server JAR: dist/ChatServer.jar"
echo "Client JAR: dist/ChatClient.jar"
echo ""
echo "To run:"
echo "  Server: java -jar dist/ChatServer.jar"
echo "  Client: java -jar dist/ChatClient.jar"
echo "========================================="
