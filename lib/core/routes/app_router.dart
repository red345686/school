import 'package:go_router/go_router.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/student/screens/student_dashboard.dart';
import '../../features/teacher/screens/teacher_dashboard.dart';
import '../../features/admin/screens/admin_dashboard.dart';
import '../../features/doubts/screens/ai_doubt_solver_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/student',
      builder: (context, state) => const StudentDashboard(),
    ),
    GoRoute(
      path: '/teacher',
      builder: (context, state) => const TeacherDashboard(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminDashboard(),
    ),
    GoRoute(
      path: '/doubts',
      builder: (context, state) => const AIDoubtSolverScreen(),
    ),
  ],
  initialLocation: '/',
);
