# 🚀 Quick Start Guide - Schoolify

## Initial Setup (5 minutes)

### 1. Install Dependencies ✅
Already done! Dependencies have been installed.

### 2. Run the App
```bash
flutter run
```

The app will launch with the login screen showing demo accounts.

## Demo Login Credentials

### Test the different roles:

**Student Account:**
- Email: `student@demo.com`
- Password: `demo123`
- Access: Student Dashboard with academic features

**Teacher Account:**
- Email: `teacher@demo.com`
- Password: `demo123`
- Access: Teacher Dashboard with class management

**Admin Account:**
- Email: `admin@demo.com`
- Password: `demo123`
- Access: Admin Dashboard with full control

## Current Features Available

### ✅ Working Now
- Login system with role-based routing
- Student Dashboard UI
- Teacher Dashboard UI
- Admin Dashboard UI
- AI Doubt Solver Screen (UI ready)
- Responsive layouts
- Beautiful Material Design 3 theme

### 🔧 Needs Configuration
The following features need backend setup:

1. **Firebase Authentication** - See SETUP.md
2. **AI Doubt Solver** - Needs Gemini API key
3. **Payment Gateway** - Needs Razorpay API key
4. **Database** - Needs Firestore setup

## Next Steps

### To Get Full Functionality:

#### 1. Configure Firebase (Required)
See detailed instructions in [SETUP.md](SETUP.md#2-configure-firebase)

Quick steps:
```bash
# 1. Go to Firebase Console: https://console.firebase.google.com/
# 2. Create new project
# 3. Add Android/iOS apps
# 4. Download config files
# 5. Place in correct directories
```

#### 2. Get Gemini API Key (For AI Doubt Solver)
```bash
# 1. Visit: https://makersuite.google.com/app/apikey
# 2. Create API key
# 3. Update in lib/core/constants/app_constants.dart
```

#### 3. Setup Payment Gateway (Optional)
```bash
# 1. Sign up at: https://razorpay.com/
# 2. Get API keys
# 3. Update in lib/core/constants/app_constants.dart
```

## Project Structure Overview

```
schoolify/
├── lib/
│   ├── core/              # App-wide utilities
│   │   ├── constants/     # Constants & config
│   │   ├── theme/         # App theming
│   │   ├── routes/        # Navigation
│   │   └── utils/         # Helper functions
│   │
│   ├── features/          # Feature modules
│   │   ├── auth/          # Authentication
│   │   ├── student/       # Student features
│   │   ├── teacher/       # Teacher features
│   │   ├── admin/         # Admin features
│   │   ├── doubts/        # AI Doubt Solver
│   │   ├── attendance/    # Attendance tracking
│   │   ├── exams/         # Exam management
│   │   └── fees/          # Fee management
│   │
│   └── main.dart          # App entry point
│
├── assets/                # Images, icons, etc.
├── test/                  # Unit tests
└── docs/                  # Documentation
```

## Development Workflow

### 1. Hot Reload
While running the app, press:
- `r` - Hot reload (quick refresh)
- `R` - Hot restart (full restart)
- `q` - Quit

### 2. Making Changes

```bash
# Format code
dart format .

# Analyze code
flutter analyze

# Run tests
flutter test
```

### 3. Build for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release
```

## Common Tasks

### Add New Feature
1. Create folder in `lib/features/your_feature/`
2. Add models, screens, providers
3. Update routing in `app_router.dart`
4. Add navigation from dashboard

### Change Theme Colors
Edit `lib/core/theme/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF6366F1);
static const Color secondaryColor = Color(0xFF8B5CF6);
```

### Add New Screen
1. Create screen file in appropriate feature folder
2. Add route in `lib/core/routes/app_router.dart`
3. Add navigation from relevant dashboard

## Troubleshooting

### Issue: Build fails
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Hot reload not working
Press `R` for hot restart instead of `r`

### Issue: Dependency conflicts
```bash
flutter pub upgrade
```

### Issue: Gradle build fails (Android)
```bash
cd android
./gradlew clean
cd ..
flutter run
```

## Features Roadmap

### Phase 1 (Foundation) ✅
- [x] Project setup
- [x] Authentication UI
- [x] Dashboard UIs
- [x] Core models
- [x] Theme & styling

### Phase 2 (Backend Integration)
- [ ] Firebase setup
- [ ] User authentication
- [ ] Database operations
- [ ] Real-time updates

### Phase 3 (Feature Implementation)
- [ ] Attendance management
- [ ] Exam & marks system
- [ ] Fee payment integration
- [ ] Timetable management
- [ ] File uploads

### Phase 4 (Enhancement)
- [ ] Push notifications
- [ ] Analytics dashboard
- [ ] Offline support
- [ ] Performance optimization
- [ ] Multi-language support

## Resources

- **Full Setup Guide**: See [SETUP.md](SETUP.md)
- **Project Documentation**: See [README.md](README.md)
- **Flutter Docs**: https://docs.flutter.dev/
- **Firebase Docs**: https://firebase.google.com/docs

## Need Help?

1. Check [SETUP.md](SETUP.md) for detailed instructions
2. Review code comments in source files
3. Check Flutter documentation
4. Open an issue on GitHub

---

Happy Coding! 🎉
