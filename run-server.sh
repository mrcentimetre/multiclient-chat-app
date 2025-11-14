#!/bin/bash
# Run script for Enhanced Chat Server

echo "========================================="
echo "  Enhanced Chat Server"
echo "========================================="

# Check if JAR exists
if [ ! -f "dist/ChatServer.jar" ]; then
    echo "ERROR: ChatServer.jar not found!"
    echo "Please run build.sh first to build the application."
    exit 1
fi

# Run the server
echo "Starting server..."
java -jar dist/ChatServer.jar
