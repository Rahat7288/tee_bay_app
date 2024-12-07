Teebay - Mobile Application Documentation
1. Project Description
   Teebay is a Flutter-based mobile application that allows users to buy, sell, or rent products seamlessly. The app provides a user-friendly platform for individuals to register, login, and manage their product listings. Below is a breakdown of its core functionalities:

User Registration and Login:
Individual users can register and log in to their accounts. Biometric authentication is supported for enhanced security and ease of access.

Product Browsing and Viewing:
Users can view all products listed by others or filter to view their own products.

Product Uploading:
From the My Products screen, users can tap on the "+" button to navigate to the Create Product screen. Here, users need to fill out all required steps and submit the product. Upon successful submission, the product is uploaded to the backend server.

Product Updating:
Users can update product details by selecting a product card on the My Products screen. This action redirects them to the product update form, where changes can be made and resubmitted.

Product Deletion:
Users can delete their products via the delete button on the My Products screen.

Buying and Renting Products:
Users can explore products listed by others on the All Products screen. Selecting a product redirects them to the Product Details screen, where they can proceed to buy or rent the product.

Push Notifications:
Users receive push notifications whenever one of their products is sold or rented. Notifications include product details and a link to view the product.

My Cart Section:
Users can navigate to the My Cart screen via a dedicated button in the navigation drawer. The My Cart section allows users to view products they have sold, rented, or purchased, categorized into respective tabs.

2. Corner Cases
   Design Challenges
   The absence of proper navigation for accessing the My Cart screen caused confusion. To resolve this, a My Cart button was added to the navigation drawer, providing users with a clear path to access their cart.

Backend Server Issues
While running the backend server, it defaulted to the 127.0.0.1:8000 port, which conflicted with Flutter’s default communication for rendering widgets. This issue was resolved by changing the server port to ensure seamless communication.

Network Communication Challenges
The application uses the dio package for network communication. However, socket exceptions occasionally occurred. As a fallback, the http package was integrated, providing more robust communication.

Flutter Version Management
The latest Flutter build system (Gradle) introduced complexities in the build process. The fvm (Flutter Version Management) system was adopted to simplify version handling and reduce future issues.

State Management Simplification
The Home Screen was optimized to display both My Products and All Products screens using state management, eliminating the need for multiple screens and redundant navigation.

3. Product Architecture
   The application architecture follows the Clean Code principles by clearly separating concerns across three layers: Domain, Data, and Presentation.

3.1 Features
Each feature module is housed under the features directory, containing the necessary screens, widgets, and business logic.

3.2 Domain Layer
Repository Implementation: Manages data interactions from the Data Layer.
Models: Defines API response models.
Cubits: Handles business logic using Cubit State Management.
3.3 Data Layer
Repository & APIs: Manages backend communication, including network requests (GET, POST, PUT, DELETE).
Local Storage: Handles data storage using GetStorage.
3.4 Presentation Layer
Screens: Each feature has a dedicated screen.
Widgets: Contains reusable UI elements for the screens.
3.5 Core
AppTheme: Maintains themes (light/dark mode).
AppColor Class: Defines consistent color palettes.
TextStyle Class: Manages text styles.
4. Folder Structure
   The application maintains an organized folder structure as follows:

# Folder Structure (lib)

lib
├── core
│   ├── app_theme.dart
│   ├── text_style.dart
├── features
│   ├── auth
│   │   ├── data
│   │   │   ├── models
│   │   │   │   ├── login_model.dart
│   │   │   │   ├── signup_model.dart
│   │   ├── repository_impl
│   │   │   ├── auth_repository_impl.dart
│   │   ├── domain
│   │   │   ├── repositories
│   │   │   ├── view_models
│   │   ├── presentation
│   │       ├── login_screen.dart
│   │       ├── signup_screen.dart
│   ├── create_product
│   ├── edit_product
│   ├── home_screen
│   ├── my_cart
│   ├── product_details
├── resources
│   ├── alert_dialogs
│   ├── drawer
│   ├── reusable_widgets
│   ├── app_urls.dart
├── services
│   ├── device_utils
│   ├── utils
│   ├── folder_structure.txt
├── main.dart
├── test
│   ├── auth
│   │   ├── login_test.dart
│   │   ├── register_test.dart
│   ├── network_service_test.dart

5. Setup Instructions
   To run the application, follow these steps:

Clone the repository using the following command:
bash
Copy code
git clone <repository_url>
Navigate to the project directory:
bash
Copy code
cd teebay
Fetch dependencies:
bash
Copy code
flutter pub get
Run the project:
bash
Copy code
flutter run
For physical devices:
Ensure the device is connected to your computer.
For iOS devices, use Xcode to register and run the application.
6. Dependencies
   flutter_bloc: State management using Cubit.
   dio: Network communication.
   http: Backup network communication.
   image_picker: Capturing images via device camera or gallery.
   path_provider: Device storage access.
   get_storage: Local storage for persistence.
   bloc_test: State management testing.
   mockito: Mocking data for unit tests.
7. API Documentation
   API endpoints are defined in resources/api_urls.dart.
   The ApiUrl class contains the base URL and endpoint paths. Update the base URL as needed for different environments (local, staging, production).

8. Testing
   Testing ensures the reliability of API interactions and business logic. Test cases are structured by feature and include:

GET, POST, PUT, DELETE API calls
State management logic
To run tests:

bash
Copy code
flutter test test/<test_file_name>.dart
9. Deployment
   For Android
   Production Release:
   bash
   Copy code
   flutter build apk --release
   Debug Build:
   bash
   Copy code
   flutter build apk --debug
   For iOS
   Use Xcode to build and deploy the application:

bash
Copy code
flutter build ios
10. Maintenance
    For seamless maintenance:

Follow the Clean Code Architecture outlined in the Features section.
Regularly update dependencies and resolve deprecations.
Use fvm for version management to avoid Flutter version conflicts.
