# Task Manager App

Task Manager App is a Flutter application designed to help users manage their tasks efficiently.

## Features

- **User Authentication**: Users can sign in securely using their email and password.
- **Task Management**: Users can create, update, delete, and view their tasks.
- **Persistent Data Storage**: User data and tasks are stored locally using SharedPreferences.

## Folder Structure

The project is organized into the following folders:

- **src**: Contains the main application code.
- **src/components**: Contains reusable UI components such as login page and home page.
- **src/models**: Contains data models used throughout the application.
- **src/provider**: Contains provider classes for managing state in the application.
- **src/services**: Contains service classes for handling authentication and task management.
- **src/utils**: Contains utility functions for local storage management.
- **src/widget**: Contains custom widget classes used in the application.

## Getting Started

To run the application locally, follow these steps:

1. Clone the repository: `git clone <https://github.com/fahadish/task_manager_app_fahad.git>`
2. Navigate to the project directory: `cd task_manager_app`
3. Install dependencies: `flutter pub get`
4. Run the application: `flutter run`

## Dependencies

The project utilizes the following dependencies:

- **provider**: For state management using the Provider package.
- **http**: For making HTTP requests to the backend API.
- **shared_preferences**: For local storage management.
- **google_fonts**: For using Google Fonts in the application.

## Contributing

Contributions to the project are welcome! Feel free to open issues or submit pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
