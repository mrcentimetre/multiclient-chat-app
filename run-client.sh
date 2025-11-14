#!/bin/bash
# Run script for Enhanced Chat Client

echo "========================================="
echo "  Enhanced Chat Client"
echo "========================================="

# Check if JAR exists
if [ ! -f "dist/ChatClient.jar" ]; then
    echo "ERROR: ChatClient.jar not found!"
    echo "Please run build.sh first to build the application."
    exit 1
fi

# Run the client
echo "Starting client..."
java -jar dist/ChatClient.jar
