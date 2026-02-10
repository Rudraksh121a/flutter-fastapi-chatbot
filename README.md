# Flutter FastAPI Chatbot

A modern, real-time chatbot application built with Flutter and FastAPI. This project combines a beautiful Flutter frontend with a powerful FastAPI backend powered by Ollama AI models and the Strands framework for intelligent, context-aware conversations with real-time web data access.

![Flutter](https://img.shields.io/badge/Flutter-3.10.8-02569B?style=flat&logo=flutter)
![FastAPI](https://img.shields.io/badge/FastAPI-0.128.7-009688?style=flat&logo=fastapi)
![Python](https://img.shields.io/badge/Python-3.13+-3776AB?style=flat&logo=python)

## 🌟 Features

- **Real-time Chat**: WebSocket-based communication for instant messaging
- **AI-Powered Responses**: Utilizes Ollama's Llama 3.2 model for intelligent conversation
- **Web Search Integration**: AI agent can fetch real-time information from the web
- **Modern UI**: Clean, responsive Flutter interface with Material Design
- **Cross-Platform**: Supports Android, iOS, Web, Windows, Linux, and macOS
- **Dark Theme**: Eye-friendly dark mode interface

## 🏗️ Architecture

The application follows a client-server architecture:

- **Frontend**: Flutter application with WebSocket client
- **Backend**: FastAPI server with WebSocket support
- **AI Engine**: Ollama running Llama 3.2:3b model
- **Agent Framework**: Strands AI agent with HTTP request tools

```
┌─────────────┐          ┌──────────────┐          ┌─────────────┐
│   Flutter   │ ◄─────► │   FastAPI    │ ◄─────► │   Ollama    │
│   Client    │ WebSocket│   Server     │          │  (Llama 3.2)│
└─────────────┘          └──────────────┘          └─────────────┘
                                ▲
                                │
                                ▼
                         ┌──────────────┐
                         │  Web Search  │
                         │    Tools     │
                         └──────────────┘
```

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Backend Requirements
- Python 3.13 or higher
- [Ollama](https://ollama.ai/) installed and running
- uv (Python package manager) - optional but recommended

### Frontend Requirements
- Flutter SDK 3.10.8 or higher
- Dart SDK (included with Flutter)

### Ollama Setup
1. Install Ollama from [ollama.ai](https://ollama.ai/)
2. Pull the Llama 3.2 model:
   ```bash
   ollama pull llama3.2:3b
   ```
3. Ensure Ollama is running on `http://localhost:11434`

## 🚀 Installation & Setup

### Backend Setup

1. Navigate to the server directory:
   ```bash
   cd server
   ```

2. Install dependencies using uv (recommended):
   ```bash
   uv sync
   ```
   
   Or using pip:
   ```bash
   pip install -e .
   ```

3. Start the FastAPI server:
   ```bash
   python main.py
   ```
   
   The server will start on `http://localhost:8000`

### Frontend Setup

1. Navigate to the project root directory

2. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   # For web
   flutter run -d chrome
   
   # For desktop
   flutter run -d windows  # or macos, linux
   
   # For mobile (with device connected)
   flutter run
   ```

## 💡 Usage

1. **Start the Backend**: Make sure the FastAPI server is running on port 8000
2. **Start Ollama**: Ensure Ollama is running with the Llama 3.2 model
3. **Launch the App**: Run the Flutter application
4. **Start Chatting**: Type your message in the input field and press send

The AI assistant can:
- Answer general questions using its trained knowledge
- Fetch real-time information from the web when needed
- Provide context-aware responses based on conversation history

## 📡 API Endpoints

### WebSocket Endpoint
- **URL**: `ws://localhost:8000/ws/chat`
- **Purpose**: Real-time bidirectional communication
- **Message Format**:
  ```json
  {
    "message": "Your question here"
  }
  ```
- **Response Format**:
  ```json
  {
    "type": "search_result",
    "response": "AI response here"
  }
  ```

### REST Endpoint
- **URL**: `POST http://localhost:8000/chat`
- **Purpose**: Single message/response interaction
- **Request Body**:
  ```json
  {
    "message": "Your question here"
  }
  ```
- **Response**:
  ```json
  {
    "response": "AI response here"
  }
  ```

### Health Check
- **URL**: `GET http://localhost:8000/health`
- **Purpose**: Check server status

## 📁 Project Structure

```
flutter-fastapi-chatbot/
├── lib/                        # Flutter application code
│   ├── main.dart              # Application entry point
│   ├── pages/                 # Application screens
│   │   ├── home_page.dart     # Main home screen
│   │   └── chat_page.dart     # Chat interface
│   ├── services/              # Service layer
│   │   └── chat_web_services.dart  # WebSocket client
│   ├── widgets/               # Reusable UI components
│   │   ├── side_bar.dart
│   │   ├── search_section.dart
│   │   └── search_bar_button.dart
│   └── theme/                 # App theming
│       └── colors.dart
├── server/                    # FastAPI backend
│   ├── app/
│   │   ├── main.py           # FastAPI application
│   │   ├── models/           # Data models
│   │   │   └── chat_model.py
│   │   ├── routes/           # API routes
│   │   │   ├── chat.py       # Chat endpoints
│   │   │   └── health.py     # Health check
│   │   └── services/         # Business logic
│   │       └── chat_services.py  # AI agent integration
│   ├── main.py               # Server entry point
│   └── pyproject.toml        # Python dependencies
├── android/                  # Android platform files
├── ios/                      # iOS platform files
├── web/                      # Web platform files
├── windows/                  # Windows platform files
├── linux/                    # Linux platform files
├── macos/                    # macOS platform files
└── pubspec.yaml              # Flutter dependencies
```

## 🛠️ Technologies Used

### Frontend
- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **google_fonts**: Custom fonts integration
- **web_socket_client**: WebSocket communication

### Backend
- **FastAPI**: Modern Python web framework
- **Uvicorn**: ASGI server
- **Strands**: AI agent framework
- **Strands-tools**: HTTP request tools for web search

### AI/ML
- **Ollama**: Local LLM runtime
- **Llama 3.2**: Language model (3B parameters)

## 🔧 Configuration

### Backend Configuration
The backend can be configured in `server/app/services/chat_services.py`:

- **Ollama Host**: Change the host URL if Ollama is running on a different address
- **Model ID**: Switch to a different Ollama model if desired
- **System Prompt**: Customize the AI assistant's behavior

### Frontend Configuration
The frontend WebSocket URL can be configured in `lib/services/chat_web_services.dart`:

- **WebSocket URL**: Update if the backend is running on a different host/port

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👤 Author

Rudraksh121a

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev/) for the amazing framework
- [FastAPI](https://fastapi.tiangolo.com/) for the modern Python framework
- [Ollama](https://ollama.ai/) for making LLMs accessible locally
- [Strands](https://github.com/strands-ai/strands) for the AI agent framework
