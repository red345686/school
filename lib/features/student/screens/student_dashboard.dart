import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schoolify/features/student/screens/attendance_screen.dart';
import 'package:schoolify/features/student/screens/academic_screen.dart';
import 'package:schoolify/features/student/screens/exams_screen.dart';
import 'package:schoolify/features/student/screens/timetable_screen.dart';
import 'package:schoolify/features/student/screens/fees_screen.dart';
import 'package:schoolify/features/student/screens/communication_screen.dart';
import 'package:schoolify/features/student/screens/profile_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            _buildWelcomeCard(context),
            const SizedBox(height: 24),

            // Quick Stats
            _buildQuickStats(context),
            const SizedBox(height: 24),

            // Features Grid
            Text(
              'Quick Access',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildFeaturesGrid(context),
            const SizedBox(height: 24),

            // Recent Activities
            Text(
              'Recent Activities',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildRecentActivities(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const CircleAvatar(radius: 30, child: Icon(Icons.person, size: 32)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back!',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'John Doe • Class 10-A',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            'Attendance',
            '92.5%',
            Icons.calendar_today,
            Colors.green,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            'Avg Score',
            '85%',
            Icons.grade,
            Colors.blue,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            context,
            'Pending',
            '3',
            Icons.pending_actions,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid(BuildContext context) {
    final features = [
      {
        'title': 'Attendance',
        'icon': Icons.event_available,
        'screen': const AttendanceScreen(),
      },
      {
        'title': 'Exams',
        'icon': Icons.assignment,
        'screen': const ExamsScreen(),
      },
      {
        'title': 'Timetable',
        'icon': Icons.schedule,
        'screen': const TimetableScreen(),
      },
      {
        'title': 'Academic',
        'icon': Icons.book,
        'screen': const AcademicScreen(),
      },
      {
        'title': 'AI Doubt Solver',
        'icon': Icons.psychology,
        'route': '/doubts',
      },
      {'title': 'Fees', 'icon': Icons.payment, 'screen': const FeesScreen()},
      {
        'title': 'Messages',
        'icon': Icons.message,
        'screen': const CommunicationScreen(),
      },
      {
        'title': 'Profile',
        'icon': Icons.person,
        'screen': const ProfileScreen(),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return InkWell(
          onTap: () {
            if (feature['route'] != null) {
              context.go(feature['route'] as String);
            } else if (feature['screen'] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => feature['screen'] as Widget,
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  feature['icon'] as IconData,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                feature['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRecentActivities(BuildContext context) {
    return Column(
      children: [
        _buildActivityItem(
          context,
          'Math Assignment Due',
          'Tomorrow, 5:00 PM',
          Icons.assignment_outlined,
          Colors.red,
        ),
        _buildActivityItem(
          context,
          'Physics Test Scheduled',
          'Friday, 10:00 AM',
          Icons.quiz_outlined,
          Colors.blue,
        ),
        _buildActivityItem(
          context,
          'Fee Payment Due',
          '5 days remaining',
          Icons.payment,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate to detail
        },
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            // Already on home
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AcademicScreen()),
            );
            break;
          case 2:
            context.go('/doubts');
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Academic'),
        BottomNavigationBarItem(
          icon: Icon(Icons.psychology),
          label: 'AI Tutor',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
