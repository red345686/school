import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(context),
            const SizedBox(height: 24),

            Text(
              'Today\'s Classes',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildTodaysClasses(context),
            const SizedBox(height: 24),

            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildQuickActions(context),
            const SizedBox(height: 24),

            Text(
              'Recent Doubts',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildRecentDoubts(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Mark attendance
        },
        icon: const Icon(Icons.check_circle),
        label: const Text('Mark Attendance'),
      ),
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
                    'Welcome, Mr. Smith',
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mathematics Teacher',
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

  Widget _buildTodaysClasses(BuildContext context) {
    return Column(
      children: [
        _buildClassCard(
          context,
          'Class 10-A',
          'Mathematics',
          '9:00 AM - 10:00 AM',
        ),
        _buildClassCard(
          context,
          'Class 10-B',
          'Mathematics',
          '11:00 AM - 12:00 PM',
        ),
        _buildClassCard(
          context,
          'Class 9-A',
          'Mathematics',
          '2:00 PM - 3:00 PM',
        ),
      ],
    );
  }

  Widget _buildClassCard(
    BuildContext context,
    String className,
    String subject,
    String time,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
          child: Icon(Icons.class_, color: Theme.of(context).primaryColor),
        ),
        title: Text('$className - $subject'),
        subtitle: Text(time),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios, size: 16),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      {
        'title': 'Mark Attendance',
        'icon': Icons.how_to_reg,
        'color': Colors.green,
      },
      {'title': 'Upload Marks', 'icon': Icons.grade, 'color': Colors.blue},
      {
        'title': 'Create Assignment',
        'icon': Icons.assignment,
        'color': Colors.orange,
      },
      {'title': 'Update Syllabus', 'icon': Icons.book, 'color': Colors.purple},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.5,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return Card(
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  action['icon'] as IconData,
                  size: 36,
                  color: action['color'] as Color,
                ),
                const SizedBox(height: 8),
                Text(
                  action['title'] as String,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentDoubts(BuildContext context) {
    return Column(
      children: [
        _buildDoubtCard(
          context,
          'John Doe',
          'Help with quadratic equations',
          '2 hours ago',
        ),
        _buildDoubtCard(
          context,
          'Jane Smith',
          'Explain integration concept',
          '5 hours ago',
        ),
      ],
    );
  }

  Widget _buildDoubtCard(
    BuildContext context,
    String studentName,
    String question,
    String time,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.help_outline)),
        title: Text(studentName),
        subtitle: Text(question, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Pending',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
