# 🎓 Schoolify - Complete School Management System

A comprehensive Flutter-based school management application with role-based access for Students, Parents, Teachers, and Administrators, featuring an AI-powered 24/7 doubt solver.

## ✨ Features

### 👥 Multi-Role Support
- **Student/Parent Module**: Unified academic tracking and communication
- **Teacher Module**: Classroom management and academic execution
- **Admin Module**: Complete school operations control
- **Accounts Module**: Financial management and fee tracking

### 🎯 Key Features

#### For Students & Parents
- 📚 **Academic Tracking**: Subject-wise syllabus progress with visual indicators
- 📝 **Exams & Performance**: Marks, grades, ranks, and downloadable report cards
- 🕒 **Attendance Monitoring**: Daily, monthly, and yearly attendance tracking
- 📅 **Timetable & Schedule**: Class schedules, exam dates, and holiday calendar
- 💬 **Communication**: Teacher feedback, announcements, and messaging
- 🤖 **AI Doubt Solver**: 24/7 instant academic help with step-by-step explanations
- 💰 **Fee Management**: Online payments, payment history, and receipt generation
- 🔔 **Smart Notifications**: Exam reminders, attendance alerts, and updates

#### For Teachers
- ✅ **Attendance Management**: Quick and easy attendance marking
- 📊 **Exam Management**: Create exams and upload marks (bulk upload support)
- 📖 **Syllabus Updates**: Plan and track syllabus progress
- 💭 **Doubt Resolution**: View and respond to student queries
- 📢 **Announcements**: Post updates and clarifications

#### For Administrators
- 🧑‍🎓 **Student Management**: Admissions, profiles, class allocation
- 👨‍🏫 **Staff Management**: Role-based access control, assignments
- 📊 **Analytics Dashboard**: Performance trends, attendance analytics
- 💼 **Financial Overview**: Fee collection and payment tracking
- 📁 **Digital Records**: ID cards, certificates, academic archives

#### AI Doubt Solver Features ⭐
- Text and image-based question support
- Subject-wise doubt solving (Maths, Science, English, etc.)
- Step-by-step explanations with concept clarification
- Syllabus-aligned answers
- Previous doubts history
- Follow-up questions support

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── routes/
│   │   └── app_router.dart
│   └── utils/
│       └── validators.dart
├── features/
│   ├── auth/
│   │   ├── models/
│   │   │   └── user_model.dart
│   │   ├── providers/
│   │   │   └── auth_provider.dart
│   │   └── screens/
│   │       └── login_screen.dart
│   ├── student/
│   │   ├── models/
│   │   │   └── student_model.dart
│   │   └── screens/
│   │       └── student_dashboard.dart
│   ├── teacher/
│   │   └── screens/
│   │       └── teacher_dashboard.dart
│   ├── admin/
│   │   └── screens/
│   │       └── admin_dashboard.dart
│   ├── attendance/
│   │   └── models/
│   │       └── attendance_model.dart
│   ├── exams/
│   │   └── models/
│   │       └── exam_model.dart
│   ├── fees/
│   │   └── models/
│   │       └── fee_model.dart
│   └── doubts/
│       ├── models/
│       │   └── doubt_model.dart
│       ├── services/
│       │   └── ai_doubt_solver_service.dart
│       └── screens/
│           └── ai_doubt_solver_screen.dart
└── main.dart
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.10.8 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase account (for backend services)
- Google AI API key (for Gemini AI integration)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/schoolify.git
   cd schoolify
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download and add configuration files:
     - `google-services.json` (Android) → `android/app/`
     - `GoogleService-Info.plist` (iOS) → `ios/Runner/`
   - Enable Firebase Authentication and Firestore

4. **Configure API Keys**
   
   Update `lib/core/constants/app_constants.dart`:
   ```dart
   static const String geminiApiKey = 'YOUR_GEMINI_API_KEY';
   static const String razorpayKey = 'YOUR_RAZORPAY_KEY';
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🔑 Demo Accounts

The app includes demo accounts for testing:

| Role    | Email              | Password |
|---------|-------------------|----------|
| Student | student@demo.com  | demo123  |
| Teacher | teacher@demo.com  | demo123  |
| Admin   | admin@demo.com    | demo123  |

## 📦 Dependencies

### Core
- `provider`: State management
- `go_router`: Navigation and routing
- `google_fonts`: Typography

### Firebase
- `firebase_core`: Firebase initialization
- `firebase_auth`: Authentication
- `cloud_firestore`: Database
- `firebase_storage`: File storage

### UI/UX
- `flutter_svg`: SVG support
- `animations`: Smooth transitions
- `shimmer`: Loading effects
- `cached_network_image`: Image caching

### Features
- `google_generative_ai`: AI doubt solver (Gemini)
- `razorpay_flutter`: Payment integration
- `pdf` & `printing`: PDF generation
- `image_picker`: Image selection
- `file_picker`: File selection
- `fl_chart`: Charts and graphs
- `table_calendar`: Calendar widget

## 🛠️ Development

### Adding New Features

1. Create feature folder in `lib/features/`
2. Add models, providers, screens, and services
3. Update routing in `app_router.dart`
4. Add navigation from dashboards

### State Management

The app uses Provider for state management:
- `AuthProvider`: User authentication state
- Add more providers as needed for features

### Theming

Customize the app theme in `lib/core/theme/app_theme.dart`:
- Colors
- Typography
- Component styles

## 🔐 Security

- Role-based access control
- Encrypted data transmission
- Secure payment gateway integration
- Firebase security rules (to be configured)

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web (with limitations)

## 🚧 TODO

- [ ] Implement Firebase Authentication
- [ ] Set up Firestore database structure
- [ ] Add offline support with local caching
- [ ] Implement push notifications
- [ ] Add multi-language support
- [ ] Create admin analytics dashboard
- [ ] Implement homework/assignment module
- [ ] Add parent-teacher chat feature
- [ ] Create digital ID cards
- [ ] Add attendance biometric integration

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- Email: your.email@example.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- Google Generative AI for AI capabilities
- All open-source contributors

## 📞 Support

For support, email support@schoolify.com or join our Slack channel.

---

Made with ❤️ using Flutter
