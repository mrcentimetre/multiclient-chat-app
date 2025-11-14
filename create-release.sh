#!/bin/bash
# Script to create a distributable release package

VERSION="1.0.0"
RELEASE_NAME="enhanced-chat-app-v${VERSION}"

echo "========================================="
echo "  Creating Release Package v${VERSION}"
echo "========================================="

# Build the application first
echo "Building application..."
bash build.sh

if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

# Create release directory
echo "Creating release directory..."
mkdir -p release
rm -rf "release/${RELEASE_NAME}"
mkdir -p "release/${RELEASE_NAME}"

# Copy JAR files
echo "Copying application files..."
cp dist/ChatServer.jar "release/${RELEASE_NAME}/"
cp dist/ChatClient.jar "release/${RELEASE_NAME}/"

# Copy run scripts
cp run-server.sh "release/${RELEASE_NAME}/"
cp run-server.bat "release/${RELEASE_NAME}/"
cp run-client.sh "release/${RELEASE_NAME}/"
cp run-client.bat "release/${RELEASE_NAME}/"

# Make shell scripts executable
chmod +x "release/${RELEASE_NAME}/run-server.sh"
chmod +x "release/${RELEASE_NAME}/run-client.sh"

# Create logs directory
mkdir -p "release/${RELEASE_NAME}/logs"

# Create README for release
cat > "release/${RELEASE_NAME}/README.txt" << EOF
========================================
Enhanced Multi-Client Chat Application
Version ${VERSION}
========================================

QUICK START GUIDE
-----------------

REQUIREMENTS:
- Java 8 or higher installed on your system
- No additional dependencies needed!

HOW TO RUN:
-----------

1. START THE SERVER (First):

   On Windows:
   - Double-click: run-server.bat
   - Or run: java -jar ChatServer.jar

   On Mac/Linux:
   - Open terminal in this folder
   - Run: ./run-server.sh
   - Or run: java -jar ChatServer.jar

2. START CLIENT(S):

   On Windows:
   - Double-click: run-client.bat
   - Or run: java -jar ChatClient.jar

   On Mac/Linux:
   - Open terminal in this folder
   - Run: ./run-client.sh
   - Or run: java -jar ChatClient.jar

3. LOGIN:
   - Enter any username (3-20 characters)
   - Server host: localhost
   - Server port: 5000
   - Click "Connect"

4. CHAT:
   - Send messages in the group chat
   - Select a user and click "Private Chat" for one-to-one messaging
   - Click "Refresh Users" to update online users list
   - Click "Disconnect" to leave

FEATURES:
---------
✓ Real-time group chat with multiple users
✓ Private one-to-one messaging
✓ Online users list
✓ System notifications (user join/leave)
✓ Professional GUI interface
✓ Chat history logging

TROUBLESHOOTING:
----------------

Server won't start?
- Check if port 5000 is already in use
- Make sure Java is installed: java -version

Client can't connect?
- Make sure the server is running first
- Check that server host is "localhost" and port is "5000"

Need help?
- Visit: https://github.com/yourusername/multiclient-chat-app
- Read full documentation: README.md in source code

========================================
Built with Java Socket Programming
University of Moratuwa - 2025
========================================
EOF

# Create LICENSE file
cat > "release/${RELEASE_NAME}/LICENSE.txt" << EOF
MIT License

Copyright (c) 2025 Enhanced Chat Application

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create ZIP archive
echo "Creating ZIP archive..."
cd release
zip -r "${RELEASE_NAME}.zip" "${RELEASE_NAME}"
cd ..

echo ""
echo "========================================="
echo "  Release Package Created Successfully!"
echo "========================================="
echo "Package: release/${RELEASE_NAME}.zip"
echo ""
echo "Contents:"
echo "  - ChatServer.jar (Server application)"
echo "  - ChatClient.jar (Client application)"
echo "  - run-server.sh/bat (Server launcher)"
echo "  - run-client.sh/bat (Client launcher)"
echo "  - README.txt (User guide)"
echo "  - LICENSE.txt"
echo ""
echo "To distribute:"
echo "  1. Upload release/${RELEASE_NAME}.zip to GitHub Releases"
echo "  2. Or share the ZIP file directly with users"
echo "========================================="
