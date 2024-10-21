# Tasky

A feature-packed To-Do app built with Flutter, focusing on task management with robust functionalities such as authentication, QR scanning, and responsive design.

![App Preview](https://github.com/user-attachments/assets/9a9cb45c-53f5-4ad2-94cc-a2118667d7a1)

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Architecture](#architecture)
- [Screens](#screen)
- [Directory Structure](#directory-structure)

---

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

---

## Installation

Follow these steps to get the app up and running on your machine:

1. **Clone the repository**
    ```sh
    git clone https://github.com/AyaAbdElmoneim158/Tasky
    ```

2. **Navigate to the project directory**
    ```sh
    cd Tasky
    ```

3. **Install dependencies**
    ```sh
    flutter pub get
    ```

4. **Run the app**
    ```sh
    flutter run
    ```

---

## Architecture

Tasky is built with a modular architecture to ensure maintainability and scalability:

- **Authentication**: Handles phone number validation and JWT token management.
- **Task Management**: A robust to-do list system that supports various states like loading, empty, and error.
- **QR Integration**: Generates and scans QR codes to link tasks for easy access.
- **Media Support**: Allows users to add images to tasks via camera or gallery.

---

## Screens

Splash Screen             |  Welcome Screen           | Login Screen            | SignUp Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![Splash Screen](https://github.com/user-attachments/assets/d10aac25-7a2a-4a3a-90bc-a2d697d9049b) | ![welcome_screen](https://github.com/user-attachments/assets/5237c65e-69d6-4f90-b6f2-fb9f7dd3f4cb)|![login_screen](https://github.com/user-attachments/assets/a938d4f1-f2ae-4fb4-bea7-fbab0041c8c0)| ![sign up_screen](https://github.com/user-attachments/assets/0c7b6fdb-3273-48e6-895a-9a7f73f4bfae)

Home Screen             |  Task Details Screen           | Add New Task Screen            | Profile Screen
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![home_screen](https://github.com/user-attachments/assets/5c880ad9-bad5-44a5-aa14-13848ad92d2c)|![task_details_screen](https://github.com/user-attachments/assets/5a87914b-a3ed-4dd2-87e8-4e99c96bbae4)|![add_new_task_screen](https://github.com/user-attachments/assets/21abb107-4b5a-4594-a1ed-ac59061864bd)|![profile_screen](https://github.com/user-attachments/assets/b4f00f8a-13b6-47ac-842e-b8c2ef9e297d)

---

## Directory Structure

```plaintext
lib/
├── core/                   # Common modules shared across the entire app
│   ├── api/                
│   ├── errors/             
│   ├── shared/             
│   ├── utils/              
│   ├── routing/            
│   ├── theme/              
│
├── features/               
│   ├── home/                
│   ├── login/              
│   │   ├── data/            
│   │   │   ├── models/      
│   │   │   ├── repos/       
│   │   ├── presentation/    
│   │       ├── view/        
│   │       ├── view_model/  
│   │
│   ├── profile/            
│   ├── register/           
│   ├── splash/              
│   ├── task_details/        
│   ├── welcome/             
│
└── main.dart
└── injection_container.dart 
└── tasky_app.dart
