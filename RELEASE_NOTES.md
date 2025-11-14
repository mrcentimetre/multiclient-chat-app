# Release Notes

## Version 1.0.0 - Initial Release

### Overview
First stable release of the Enhanced Multi-Client Chat Application - a fully-featured network chat application built with Java Socket Programming.

### Features

#### Core Functionality
- ✅ **Multi-Client Support**: Server handles up to 50 concurrent users
- ✅ **Real-Time Group Chat**: Instant messaging to all connected users
- ✅ **Private Messaging**: Secure one-to-one conversations
- ✅ **User Authentication**: Username validation and duplicate prevention
- ✅ **Online Users List**: Real-time display of connected users
- ✅ **System Notifications**: Join/leave alerts for all users

#### User Interface
- 🎨 Professional Java Swing GUI
- 🎨 Color-coded message types
- 🎨 Separate private chat windows
- 🎨 Intuitive controls and navigation
- 🎨 Timestamp display for all messages

#### Technical Features
- 🔧 Multi-threaded server architecture
- 🔧 Thread-safe client management
- 🔧 Structured message protocol (TYPE|SENDER|RECIPIENT|CONTENT)
- 🔧 TCP socket-based communication
- 🔧 Graceful connection handling
- 🔧 Chat history logging

### What's Included

**Pre-built Executables:**
- `ChatServer.jar` - Server application
- `ChatClient.jar` - Client application

**Launch Scripts:**
- `run-server.sh` / `run-server.bat` - Easy server startup
- `run-client.sh` / `run-client.bat` - Easy client startup

**Documentation:**
- `README.txt` - Quick start guide
- `LICENSE.txt` - License information

### System Requirements

**Minimum:**
- Java Runtime Environment (JRE) 8 or higher
- 50 MB free disk space
- Network connectivity (localhost for single machine, LAN for multiple machines)

**Recommended:**
- Java 11 or higher
- 100 MB free disk space
- Stable network connection

### Installation

1. **Download** the release ZIP file
2. **Extract** to your preferred location
3. **Verify Java** is installed:
   ```bash
   java -version
   ```
4. **Run** the application using the launch scripts

### Quick Start

**Step 1: Start Server**
```bash
# Windows: Double-click run-server.bat
# Mac/Linux: ./run-server.sh
# Or: java -jar ChatServer.jar
```

**Step 2: Start Client(s)**
```bash
# Windows: Double-click run-client.bat
# Mac/Linux: ./run-client.sh
# Or: java -jar ChatClient.jar
```

**Step 3: Login and Chat**
- Enter username (3-20 alphanumeric characters)
- Keep default settings (localhost:5000)
- Click "Connect"
- Start chatting!

### Usage Tips

**Group Chat:**
- Type your message and press Enter or click "Send"
- Messages appear for all connected users

**Private Chat:**
- Method 1: Select a user from "Online Users" → Click "Private Chat"
- Method 2: Double-click on a username
- Private messages appear only to sender and recipient

**User Management:**
- Click "Refresh Users" to update the online users list
- Click "Disconnect" to properly leave the chat

### Known Limitations

- Maximum 50 concurrent users (configurable in source code)
- File transfer feature not implemented in this version
- Admin console not available in this version
- Voice/video chat not supported
- No message encryption (transmitted as plain text)
- Server runs on localhost by default (requires code change for remote deployment)

### Troubleshooting

**"Address already in use"**
- Another process is using port 5000
- Solution: Close other applications or change port in source code

**"Connection refused"**
- Server is not running
- Solution: Start the server before starting clients

**"Username already taken"**
- Someone else is using that username
- Solution: Choose a different username

**Private chat window doesn't open**
- User may have disconnected
- Solution: Click "Refresh Users" and try again

### Technical Details

**Architecture:**
- Client-Server model with TCP sockets
- One server thread per connected client
- Asynchronous message handling
- ConcurrentHashMap for thread-safe client storage

**Network Protocol:**
- Port: 5000 (default)
- Protocol: TCP/IP
- Message format: Pipe-delimited strings
- Encoding: UTF-8

**Message Types:**
- BROADCAST - Group chat messages
- PRIVATE - One-to-one messages
- SYSTEM - Server notifications
- JOIN/LEAVE - Connection events
- USER_LIST - Online users update
- ERROR - Error notifications

### Source Code

Full source code is available at:
https://github.com/mrcentimetre/multiclient-chat-app

To build from source:
```bash
# Clone repository
git clone https://github.com/mrcentimetre/multiclient-chat-app

# Build
./build.sh  # Mac/Linux
build.bat   # Windows

# Run
java -jar dist/ChatServer.jar
java -jar dist/ChatClient.jar
```

### License

This project is released under the MIT License. See LICENSE.txt for details.

### Credits

**Developed by:** [mrcentimetre](https://github.com/mrcentimetre)
**University:** University of Moratuwa
**Year:** 2025

**Technologies Used:**
- Java SE 8+
- Java Socket API
- Java Swing GUI
- Multi-threading (java.util.concurrent)

**Skills Demonstrated:**
- Full-stack application development (server + client)
- Network protocol design and implementation
- Multi-threaded architecture
- GUI/UX design
- Software packaging and distribution

### Support

For issues, questions, or contributions:
- GitHub Issues: https://github.com/mrcentimetre/multiclient-chat-app/issues
- Documentation: See README.md in source repository

### Future Enhancements (Roadmap)

Potential features for future versions:
- File transfer capability
- Message encryption (TLS/SSL)
- Admin control panel
- User profiles and avatars
- Message history persistence (database)
- Emoji support
- Remote server deployment
- Configuration file support
- Auto-reconnect on disconnect
- Typing indicators
- Read receipts

---

## Changelog

### v1.0.0 (2025-11-14)
- Initial public release
- Core chat functionality
- Private messaging feature
- Professional GUI
- Cross-platform support
- Complete documentation

---

**Thank you for using Enhanced Chat Application!**

Built with ❤️ for learning network programming concepts
