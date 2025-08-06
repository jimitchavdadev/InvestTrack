# 📈 InvestTrack

InvestTrack is a full-stack investment portfolio management application built with **Flutter** for the frontend and **Node.js with PostgreSQL** for the backend. It's designed to help users track their investments, monitor market trends, and manage transactions in a simple, secure, and intuitive way.

This project demonstrates a complete development lifecycle, from robust backend API design to a responsive and user-friendly mobile interface.

## ✨ Features

### Frontend (Flutter)

  * **Secure Authentication:** Users can securely sign up and log in. The app checks for existing credentials on startup for a seamless experience.
  * **Portfolio Dashboard:** A dynamic and visual overview of the user's total portfolio value, daily gain/loss, and asset breakdown (stocks, ETFs, crypto, etc.).
  * **Holdings Management:** A detailed view of individual holdings, including quantity, price history, and transaction records.
  * **Transaction Management:** A simple interface to add buy and sell transactions, updating the user's portfolio in real-time.
  * **Market Overview:** A dedicated screen to view market indices and the latest financial news.
  * **Customizable Settings:** A settings screen where users can manage their account, toggle the app's theme (light/dark), and log out securely.
  * **Responsive UI:** The app's layout is designed to be responsive and visually consistent across various mobile screen sizes.

### Backend (Node.js & PostgreSQL)

  * **RESTful APIs:** A set of well-defined and secure RESTful APIs to handle all frontend requests.
  * **JWT Authentication:** All protected endpoints require a JSON Web Token (JWT) for authentication, ensuring that only authorized users can access their data.
  * **Secure Data Storage:** User credentials are encrypted using `bcrypt`, and all data is stored securely in a PostgreSQL database.
  * **ORM with Sequelize:** The backend uses Sequelize, a powerful ORM, to interact with the database. This prevents SQL injection attacks and provides a clean, object-oriented way to manage database schema and data.
  * **Database Schema:** The database includes tables for `Users`, `Holdings`, and `Transactions` to store all the necessary application data.

## 🚀 How to Run the Project

### Prerequisites

  * **Flutter SDK** (Version 3.16.0 or newer)
  * **Node.js** (Version 18.x or newer)
  * **PostgreSQL** (Installed and running)

### Backend Setup

1.  **Clone the repository and navigate to the `backend` directory:**
    ```bash
    git clone https://github.com/jimitchavdadev/InvestTrack 
    cd investtrack/backend
    ```
2.  **Install dependencies:**
    ```bash
    npm install
    ```
3.  **Set up your PostgreSQL database:**
      * Log in to your `psql` shell as a superuser.
      * Create a database and a dedicated user with privileges.
        ```sql
        CREATE DATABASE <db_name>;
        CREATE USER <db_user> WITH ENCRYPTED PASSWORD '<db_password>';
        GRANT ALL PRIVILEGES ON DATABASE investtrack_db TO <db_user>;
        ```
      * Grant the user schema-level permissions.
        ```sql
        GRANT ALL ON SCHEMA public TO <db_user>;
        ```
4.  **Create a `.env` file:** In the root of the `backend` directory, refer to the env.example file.

5.  **Run the backend server:** The server will automatically create and sync the database tables.
    ```bash
    npx nodemon server.js
    ```
    You should see a message indicating the server is running on port 3000.

### Frontend Setup

1.  **Navigate to the `flutter` directory:**
    ```bash
    cd ../flutter
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:** Ensure you have an Android emulator, an iOS simulator, or a physical device connected.
    ```bash
    flutter run
    ```
4.  The app will launch, starting with the Login screen. You can use the hardcoded credentials (`testuser@example.com`, password: `123`) to log in and explore the app.

## 🤝 Contributing

This project is a comprehensive example of building a full-stack application. If you have any suggestions or find a bug, please feel free to open an issue or submit a pull request.