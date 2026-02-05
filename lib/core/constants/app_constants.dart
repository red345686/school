class AppConstants {
  // App Info
  static const String appName = 'Schoolify';
  static const String appVersion = '1.0.0';

  // User Roles
  static const String roleStudent = 'student';
  static const String roleParent = 'parent';
  static const String roleTeacher = 'teacher';
  static const String roleAdmin = 'admin';
  static const String roleAccounts = 'accounts';

  // Storage Keys
  static const String keyUser = 'user';
  static const String keyToken = 'token';
  static const String keyRole = 'role';
  static const String keyIsLoggedIn = 'isLoggedIn';

  // API Endpoints (Update with your backend URLs)
  static const String baseUrl = 'https://your-api-url.com/api/v1';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String studentsCollection = 'students';
  static const String teachersCollection = 'teachers';
  static const String adminsCollection = 'admins';
  static const String classesCollection = 'classes';
  static const String attendanceCollection = 'attendance';
  static const String examsCollection = 'exams';
  static const String syllabusCollection = 'syllabus';
  static const String feesCollection = 'fees';
  static const String doubtsCollection = 'doubts';
  static const String announcementsCollection = 'announcements';
  static const String timetableCollection = 'timetable';

  // AI Configuration
  // Get your free API key from: https://aistudio.google.com/app/apikey
  // Instructions:
  // 1. Visit the link above and sign in with Google
  // 2. Click "Create API Key" button
  // 3. Copy the complete key (starts with AIza...)
  // 4. Replace 'YOUR_GEMINI_API_KEY_HERE' below with your key
  // 5. Save and RESTART the app (hot reload won't work)
  static const String geminiApiKey = 'AIzaSyDnIKd9DfrmV6QzAr8dCwWs5cz-eRIuZnY';

  // Payment Configuration
  static const String razorpayKey = 'YOUR_RAZORPAY_KEY_HERE';

  // Date Formats
  static const String dateFormat = 'dd MMM yyyy';
  static const String timeFormat = 'hh:mm a';
  static const String dateTimeFormat = 'dd MMM yyyy, hh:mm a';

  // Pagination
  static const int itemsPerPage = 20;

  // File Upload
  static const int maxFileSizeMB = 10;
  static const List<String> allowedFileTypes = [
    'pdf',
    'jpg',
    'jpeg',
    'png',
    'doc',
    'docx',
  ];
}
