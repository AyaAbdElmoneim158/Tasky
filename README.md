# Tasky

A feature-packed To-Do app built with Flutter, focusing on task management with robust functionalities such as authentication, QR scanning, and responsive design.

## Features

- **Phone Number Authentication**: Users can sign in with their phone numbers, with validation based on the selected country.
- **JWT Authorization**: Ensures secure API access using JWT tokens, with refresh token handling:
  - `401`: Not authorized, refresh required.
  - `403`: Refresh token failed.
  - `200`: Successfully refreshed.
- **To-Do List Management**:
  - Loading state
  - Empty state
  - Error state
  - Pull-to-refresh
  - Infinite scroll with pagination
- **QR Code Generation & Scanning**:
  - Generate QR codes based on task ID for sharing.
  - Scan QR codes to open task details directly via a GET request.
- **Media Integration**:
  - Add images to tasks using the camera or gallery.
- **Cross-Platform Support**: The app provides APK and EXE versions for testing.
- **Responsive Design**: Optimized for various screen sizes.

## Installation

Follow these steps to get the app up and running on your machine:

1. **Clone the repository**
    ```sh
    git clone https://github.com/AyaAbdElmoneim158/Tasky
    ```

2. **Navigate to the project directory**
    ```sh
    cd tasky-app
    ```

3. **Install dependencies**
    ```sh
    flutter pub get
    ```

4. **Run the app**
    ```sh
    flutter run
    ```

## Architecture

Tasky is built with a modular architecture to ensure maintainability and scalability:

- **Authentication**: Handles phone number validation and JWT token management.
- **Task Management**: A robust to-do list system that supports various states like loading, empty, and error.
- **QR Integration**: Generates and scans QR codes to link tasks for easy access.
- **Media Support**: Allows users to add images to tasks via camera or gallery.
  
## Directory Structure

```plaintext
lib/
│
├── core/
├── features/              
│   ├── auth/              
│   │   ├── data/          # JWT and phone authentication
│   │   ├── domain/        
│   │   ├── presentation/  # Login and signup screens
│   │
│   ├── todo/              # To-do list functionalities
│       ├── data/          
│       ├── domain/        
│       ├── presentation/  # Task UI, states (loading, error, etc.)
│
├── qr/                    # QR code generation and scanning
