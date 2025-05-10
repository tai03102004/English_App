# Triopybara - English Learning Application
 <!-- Replace with actual logo -->
![image](https://github.com/user-attachments/assets/3d289f4e-967e-41e0-af25-8f597b6fda02)

A mobile application designed to make learning English fun and interactive through games, flashcards, pronunciation exercises, and short stories. Built with Flutter and Firebase.

## Features ✨

- **Multi-mode Learning**:
  - 📚 Vocabulary flashcards by topic (Animals, Transportation, Family, etc.)
  - 🎮 4 interactive mini-games for grammar/spelling practice
  - 🎧 IPA pronunciation guide with 44 phonetic sounds
  - 📖 Collection of meaningful short stories

- **User-Friendly Tools**:
  - 🔍 Floating dictionary accessible from any screen
  - 📊 Progress tracking and weekly leaderboards
  - 👤 Personalized profiles with achievement system
  - ⚙️ Customizable notification/audio settings

- **Engagement Features**:
  - � Level-based learning system
  - 🏆 Competitive ranking among users
  - 🛟 Help Center & feedback system

## Screenshots 🖼️

![image](https://github.com/user-attachments/assets/b12924d5-1ece-43ae-9cdc-a98bd5b6a548)


## Technology Stack 💻

- **Frontend**: Flutter (Dart)
- **Backend**: 
  - Firebase (Authentication, Realtime Database)
  - SQLite (Local dictionary storage)
- **Design**: 
  - Consistent color palette (brown/white/purple)
  - Capybara-themed UI
  - Responsive grid layout

## Installation ⚙️

1. Ensure Flutter SDK is installed (v3.0+)
2. Clone repository:
   ```bash
   git clone https://github.com/your-repo/triopybara.git
   Install dependencies:

  ```bash
    flutter pub get
    
  ```
Configure Firebase:
  - Add your google-services.json to android/app

Run the app:

```bash
flutter run
```
Project Structure 📂
```bash
lib/
├── assets/               # Media files
├── models/               # Data models
├── screens/              # Main app screens
│   ├── auth/             # Login/Signup
│   ├── home/             # Dashboard
│   ├── games/            # Learning games
│   ├── pronunciation/    # IPA exercises
│   └── profile/          # User settings
├── services/             # Firebase handlers
├── utils/                # Helper functions
└── widgets/              # Reusable components
```
Key Improvements 🔧
Based on user testing feedback:

- Simplified authentication flow (Google login)

- Enhanced touch interactions

- Added pronunciation accuracy evaluation

- Improved story content for different levels

- Larger buttons for elderly users

Contributors 👥
Member	Role	Contribution
- Đinh Đức Tài (Leader)	UI/UX	App framework, Game interfaces, Demo video
- Đinh Thị Phương Thanh	Backend	Firebase integration, User profiles
- Triệu Minh Nhật	Content	Vocabulary sets, Dictionary, Flashcards

University of Engineering and Technology
Vietnam National University, Hanoi
Human-Computer Interaction Course - INT31157
Instructor: Dr. Ngô Thị Duyên
December 2024
