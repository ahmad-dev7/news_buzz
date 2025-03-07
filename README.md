# ⚠️ Security Note:

## Normally, `.env` files should be added to `.gitignore` to prevent exposing API keys in public repositories. However, for testing purposes, the `.env` file is included in this repo so that the reviewer can run the app without issues.

# 📰 News Buzz - Flutter Coding Assessment

Hey there! 👋
This is my submission for the AiBuzz Flutter Developer Role Coding Assessment. The app is a simple News Feed App that fetches articles from a public API and displays them in a clean and readable format. Users can also open full articles inside the app using WebView.

## Features 🚀

✅ **Login Page**

- Basic email & password fields with validation
- Dummy authentication (just navigates to news feed after login)

✅ **News Feed Page**

- Fetches news articles from NewsAPI
- Displays headline, thumbnail, description, source name & published date
- Clicking an article opens it in a WebView

✅ **Tech Stack**

- **Flutter** (latest stable version 3.29.0)
- **http package** for API calls
- **BLoC (Cubit)** for state management
- **webview_flutter** to open full articles

✅ **Extra Features**

- **Dark Mode** 🌙
- **Pull to Refresh** 🔄
- **Search Bar** to filter news 🔍

---

## How to Run? 🏃‍♂️

1. Clone the repo:
   ```sh
   git clone https://github.com/ahmad-dev7/news_buzz.git
   ```
2. Navigate to the project folder:
   ```sh
   cd news_buzz
   ```
3. Get dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

---

## Screenshots 📸

(Add some screenshots here if you want)

---

## 📝 Notes

This was built as part of the AiBuzz Flutter Developer Role Coding Assessment. Let me know if there's anything that can be improved!
Happy Coding! 🚀
