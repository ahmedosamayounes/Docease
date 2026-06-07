# 🩺 DocEase - Doctor Appointment Booking App

DocEase is a premium, high-performance Flutter application designed for seamless medical appointment management. The project is built to production-grade standards with a strong emphasis on **Clean Architecture**, advanced **State Management**, enterprise **Networking clients**, and **Multi-Environment Flavors**.

---

## 🚀 Key Features

* **🌐 Multi-Environment (Flavors):** Configured with multiple flavors (`development` and `production`) using independent entry points like `main_production.dart`.
* **🔒 Secure Authentication Flow:** Multi-step Login, SignUp, and Onboarding modules with secure token caching via `flutter_secure_storage`.
* **📡 Advanced Type-Safe Networking:** Powered by `dio` and `retrofit` generators, integrated with `pretty_dio_logger` for network interception.
* **🛡️ Global Error Handling:** Custom `api_error_handler` and `api_result` wrappers handling server-side exceptions and dynamic business errors safely.
* **🧩 Dependency Injection (DI):** Service locator injection handled cleanly via `get_it` inside a centralized `dependency_injection.dart` file.
* **🌍 Multi-Lingual Support:** Full internationalization implemented using `easy_localization` for a localized healthcare experience.
* **📱 High-Fidelity UI/UX:** Responsive widget layout configurations via `flutter_screenutil` backed by smooth loading states using `shimmer`.

---

## 🏗️ Architecture & Folder Structure

The project strictly follows a **Feature-First Clean Architecture** design pattern. Global infrastructural tools are kept independent inside the `core` layer, while business capabilities are modularized inside `features`.

```text
lib/
│
├── core/                         # Shared Foundation Layer
│   ├── di/                       # Dependency Injection locator configuration
│   ├── helpers/                  # Extensions and utility handlers
│   ├── networking/               # Type-safe Retrofit clients, Error Handlers, and API contracts
│   ├── routing/                  # Central App Router & Route naming setups
│   ├── shared/                   # Global reusable design atomic components
│   └── theming/                  # Global core color schema and text typography guidelines
│
└── features/                     # Business Domain Encapsulated Layers
    ├── onboarding/               # Application introductions and landing visual guides
    ├── login/                    # Reactive login authentication system via Cubits
    ├── sign_up/                  # Dynamic registration pipelines with backend validation
    ├── home/                     # Specialized doctor feeds, categorization, and tracking
    └── booking/                  # Real-time data-driven appointment scheduling logic
```
### 🔄 Data Flow & State Pipeline

`UI Layer` ➡️ `Bloc/Cubit (State)` ➡️ `Repository Layer` ➡️ `Retrofit Rest Client / Data Source` ➡️ Emits `ApiResult<T>`

---

### 🛠️ Tech Stack & Dependencies
This application leverages modern industry-standard libraries to achieve state-of-the-art performance:

| Dependency | Purpose |
| :--- | :--- |
| **`flutter_bloc`** | State Management via Cubits enforcing clean unidirectional data flow. |
| **`dio` & `retrofit`** | Type-safe REST client generation ensuring highly maintainable API connectivity. |
| **`pretty_dio_logger`** | Network performance logging and network debugging in console. |
| **`get_it`** | Central service locator managing singletons lazily for optimized memory use. |
| **`flutter_secure_storage`** | Secure iOS Keychain and Android KeyStore cache management for user tokens. |
| **`shared_preferences`** | Storing persistent local key-value settings and preferences data. |
| **`easy_localization`** | Managing runtime language swapping, translation loaders, and locale contexts. |
| **`freezed` & `json_annotation`** | Code generation for data models, immutable states, and automated data mapping. |
| **`flutter_screenutil`** | Adapting screen and font sizes dynamically for cross-device responsiveness. |
| **`shimmer`** | Enhancing user experience during loading phases with premium placeholder layouts. |
| **`flutter_native_splash`** | Native infrastructure level splash screen configuration tool. |

---

## 📸 Screenshots & UI Tour

### 🏥 Part 1: App Launch & Patient Authentication
| Splash Screen | Onboarding Journey | Patient SignUp | SignUp Success |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/863f365c-37a7-4546-8648-621e3e956d74" width="200"/> | <img src="https://github.com/user-attachments/assets/db9a950c-4ad6-4e41-ae95-fd19c529b270" width="200"/> | <img src="https://github.com/user-attachments/assets/1adbaace-e8a3-4f51-ab47-ff5355b64caa" width="200"/> | <img src="https://github.com/user-attachments/assets/338a8d4e-2ae1-4307-9527-ff76a00c1504" width="200"/> |

### 📅 Part 2: Doctor Catalog & Intelligent Booking Workflows
| Patient Login | Specialization & Doctors Home | Doctor Selection | Date Validation Error | Appointment Success |
| :---: | :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/35956c28-aa3c-4f19-8723-9b06ac35f5a6" width="180"/> | <img src="https://github.com/user-attachments/assets/c94b9198-5945-446a-b697-5c6340c902fa" width="180"/> | <img src="https://github.com/user-attachments/assets/bd622272-2d0f-4cb8-8df6-165cfb726df6" width="180"/> | <img src="https://github.com/user-attachments/assets/058b527b-2b04-45a4-8e69-92f81aa88dff" width="180"/> | <img src="https://github.com/user-attachments/assets/2cf311f4-384f-4816-a84a-0558d873c7a1" width="180"/> |
