import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(context),
            const SizedBox(height: 24),

            _buildStatsGrid(context),
            const SizedBox(height: 24),

            Text(
              'Management',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildManagementOptions(context),
            const SizedBox(height: 24),

            Text(
              'Recent Activities',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildRecentActivities(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.red.withOpacity(0.7)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.admin_panel_settings, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin Panel',
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'School Management System',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: [
        _buildStatCard(context, 'Students', '1,245', Icons.people, Colors.blue),
        _buildStatCard(context, 'Teachers', '85', Icons.school, Colors.purple),
        _buildStatCard(context, 'Classes', '32', Icons.class_, Colors.orange),
        _buildStatCard(
          context,
          'Revenue',
          '₹45L',
          Icons.attach_money,
          Colors.green,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 32),
                Text(
                  value,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }

  Widget _buildManagementOptions(BuildContext context) {
    final options = [
      {
        'title': 'Student Management',
        'icon': Icons.person_add,
        'route': '/admin/students',
      },
      {
        'title': 'Teacher Management',
        'icon': Icons.group_add,
        'route': '/admin/teachers',
      },
      {
        'title': 'Class Management',
        'icon': Icons.class_,
        'route': '/admin/classes',
      },
      {'title': 'Fee Structure', 'icon': Icons.payment, 'route': '/admin/fees'},
      {
        'title': 'Exam Management',
        'icon': Icons.assignment,
        'route': '/admin/exams',
      },
      {
        'title': 'Analytics',
        'icon': Icons.analytics,
        'route': '/admin/analytics',
      },
    ];

    return Column(
      children: options.map((option) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(
                option['icon'] as IconData,
                color: Theme.of(context).primaryColor,
              ),
            ),
            title: Text(option['title'] as String),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecentActivities(BuildContext context) {
    return Column(
      children: [
        _buildActivityItem(
          context,
          'New Student Admission',
          'John Doe admitted to Class 10-A',
          Icons.person_add,
          Colors.green,
        ),
        _buildActivityItem(
          context,
          'Fee Payment',
          'Jane Smith paid ₹15,000',
          Icons.payment,
          Colors.blue,
        ),
        _buildActivityItem(
          context,
          'Exam Scheduled',
          'Mid-term exams scheduled for next week',
          Icons.event,
          Colors.orange,
        ),
      ],
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    String title,
    String description,
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
        subtitle: Text(description),
        trailing: Text('2h ago', style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
