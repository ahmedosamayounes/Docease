## 📊 System Design
<img width="1024" height="800" alt="c2d54618-1e62-4915-aa5c-a7145954b112" src="https://github.com/user-attachments/assets/0b75f4c5-c24c-4659-b8b1-2b7fe76c6223" />


# DocEase - Doctor Appointment Booking App

DocEase is a professional, high-performance Flutter application designed for seamless medical appointment management. The project is built with a focus on Clean Architecture, Scalability, and Maintainability, adhering to modern software engineering standards.

## 🚀 Architecture & Design Patterns

The project follows a **Feature-First** organizational structure combined with **Clean Architecture** principles:

*   **Layered Separation**: Each feature is divided into `Data`, `Logic`, and `UI` layers to ensure clear separation of concerns.
*   **Feature-Driven**: Organized by business modules such as `Auth`, `Home`, and `Booking`.
*   **Dependency Injection**: Managed via **Get_it** to promote loose coupling between components.

## 🛠️ Tech Stack

*   **State Management**: **Flutter BLoC/Cubit** for reactive UI updates and state logic.
*   **Networking**: **Dio** client integrated with **Retrofit** for type-safe API requests.
*   **Data Parsing**: **Freezed** & **JSON Annotation** for immutable models and efficient data mapping.
*   **Routing**: Custom central routing system for navigation management.
*   **UI/UX**: **Flutter ScreenUtil** for responsive design across all devices.

## ✨ Key Features

*   **Authentication Flow**: Secure Login and Sign-up modules with real-time validation and error handling via `BlocListener`.
*   **Specialization Browser**: Dynamic home screen where users can browse doctors based on their specializations (e.g., Cardiology, Dermatology).
*   **Booking System**: Intuitive appointment scheduling integrated with a backend API.
*   **Modular Components**: High-reusability UI components (custom buttons, text fields) stored in the `core` folder for consistency.

## 📂 Project Structure

```text
lib/
├── core/               # Shared logic: networking, routing, theming, DI
├── features/           # Feature-based modules
│   ├── login/          # Auth logic & UI
│   ├── home/           # Specialized doctors list & dashboard
│   └── booking/        # Appointment scheduling logic
└── main_production.dart # Production entry point
