# Schoolify - Development Notes

## Setup Instructions

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Configure Firebase

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project named "Schoolify"
3. Add Android app:
   - Package name: `com.example.schoolify` (or your package name)
   - Download `google-services.json`
   - Place it in `android/app/`
4. Add iOS app:
   - Bundle ID: `com.example.schoolify`
   - Download `GoogleService-Info.plist`
   - Place it in `ios/Runner/`

### 3. Enable Firebase Services

In Firebase Console:
- **Authentication**: Enable Email/Password provider
- **Firestore Database**: Create database in production mode
- **Storage**: Enable Firebase Storage

### 4. Firestore Database Structure

Create these collections:

#### users
```
users/
  {userId}/
    - id: string
    - email: string
    - name: string
    - role: string (student, teacher, admin, accounts)
    - phone: string
    - profileImage: string
    - createdAt: timestamp
```

#### students
```
students/
  {studentId}/
    - id: string
    - userId: string
    - name: string
    - email: string
    - rollNumber: string
    - classId: string
    - className: string
    - section: string
    - parentIds: array
    - admissionDate: timestamp
    - dateOfBirth: timestamp
```

#### attendance
```
attendance/
  {attendanceId}/
    - id: string
    - studentId: string
    - classId: string
    - date: timestamp
    - isPresent: boolean
    - reason: string
    - remarks: string
```

#### exams
```
exams/
  {examId}/
    - id: string
    - name: string
    - classId: string
    - subjectId: string
    - subjectName: string
    - date: timestamp
    - totalMarks: number
    - passingMarks: number
    - examType: string
```

#### doubts
```
doubts/
  {doubtId}/
    - id: string
    - studentId: string
    - studentName: string
    - subject: string
    - question: string
    - imageUrl: string
    - answer: string
    - isResolved: boolean
    - createdAt: timestamp
    - resolvedAt: timestamp
    - teacherId: string
```

#### fees
```
fees/
  {feeId}/
    - id: string
    - studentId: string
    - classId: string
    - totalAmount: number
    - paidAmount: number
    - dueAmount: number
    - dueDate: timestamp
    - status: string (paid, pending, overdue)
    - installments: array
```

### 5. Get Google Gemini API Key

1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create new API key
3. Update in `lib/core/constants/app_constants.dart`:
```dart
static const String geminiApiKey = 'YOUR_API_KEY_HERE';
```

### 6. Configure Razorpay (for payments)

1. Sign up at [Razorpay](https://razorpay.com/)
2. Get API keys from Dashboard
3. Update in `lib/core/constants/app_constants.dart`:
```dart
static const String razorpayKey = 'YOUR_RAZORPAY_KEY';
```

## Running the App

### Development
```bash
flutter run
```

### Build APK (Android)
```bash
flutter build apk --release
```

### Build iOS
```bash
flutter build ios --release
```

## Features Implementation Status

### ✅ Completed
- Basic project structure
- Authentication UI
- Role-based routing
- Student dashboard UI
- Teacher dashboard UI
- Admin dashboard UI
- AI Doubt Solver UI
- Data models for all modules
- Theme and styling

### 🚧 In Progress
- Firebase integration
- Authentication logic
- Data persistence

### 📋 Pending
- Attendance management screens
- Exam management screens
- Fee payment integration
- Timetable management
- Syllabus tracking
- Report card generation
- Push notifications
- Offline support
- Analytics dashboard
- Bulk upload features
- File upload/download

## Architecture

### State Management
- Using **Provider** pattern
- AuthProvider handles authentication state
- Add feature-specific providers as needed

### Navigation
- Using **go_router** for declarative routing
- Role-based navigation redirects
- Deep linking support

### Theming
- Material Design 3
- Custom theme with brand colors
- Google Fonts (Poppins, Inter)
- Dark mode support (optional)

## Code Guidelines

### File Naming
- Use snake_case: `student_dashboard.dart`
- Models: `*_model.dart`
- Providers: `*_provider.dart`
- Services: `*_service.dart`
- Screens: `*_screen.dart`

### Code Organization
- Follow feature-first structure
- Keep widgets small and reusable
- Use const constructors where possible
- Add comments for complex logic

### Best Practices
- Use meaningful variable names
- Follow Flutter/Dart style guide
- Add error handling
- Validate user inputs
- Show loading states
- Handle network errors gracefully

## Testing

### Unit Tests
```bash
flutter test
```

### Widget Tests
Create tests in `test/` directory

### Integration Tests
Create tests in `integration_test/` directory

## Common Issues & Solutions

### Issue: Build fails after adding dependencies
**Solution**: Run `flutter clean && flutter pub get`

### Issue: Firebase not working
**Solution**: Check if configuration files are in correct location

### Issue: Hot reload not working
**Solution**: Perform hot restart (Shift + R in terminal)

## Useful Commands

```bash
# Clean build
flutter clean

# Get dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Format code
dart format .

# Analyze code
flutter analyze

# Check for outdated packages
flutter pub outdated
```

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Go Router Package](https://pub.dev/packages/go_router)
- [Google Generative AI](https://pub.dev/packages/google_generative_ai)

## Next Steps

1. Set up Firebase project
2. Implement authentication with Firebase Auth
3. Create Firestore database structure
4. Implement CRUD operations for each module
5. Add real-time data sync
6. Implement payment gateway
7. Add push notifications
8. Create comprehensive testing
9. Deploy to Play Store / App Store

---

**Note**: This is a comprehensive school management system. Implement features incrementally and test thoroughly.
