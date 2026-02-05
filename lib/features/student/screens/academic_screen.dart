import 'package:flutter/material.dart';

class AcademicScreen extends StatelessWidget {
  const AcademicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Academic Progress')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Overall Progress
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Overall Progress',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildProgressIndicator(
                    context,
                    'Syllabus Completion',
                    68,
                    Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildProgressIndicator(
                    context,
                    'Assignments Completed',
                    85,
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildProgressIndicator(
                    context,
                    'Average Score',
                    78,
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          Text('Subjects', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),

          // Subject Cards
          _buildSubjectCard(
            context,
            'Mathematics',
            Icons.calculate,
            Colors.blue,
            75,
            'Chapter 5: Quadratic Equations',
            'Topics Covered: 15/20',
            ['Algebra', 'Geometry', 'Trigonometry'],
          ),
          _buildSubjectCard(
            context,
            'Physics',
            Icons.science,
            Colors.purple,
            82,
            'Chapter 3: Laws of Motion',
            'Topics Covered: 12/15',
            ['Mechanics', 'Optics', 'Electricity'],
          ),
          _buildSubjectCard(
            context,
            'Chemistry',
            Icons.biotech,
            Colors.teal,
            70,
            'Chapter 4: Chemical Reactions',
            'Topics Covered: 10/18',
            ['Organic', 'Inorganic', 'Physical'],
          ),
          _buildSubjectCard(
            context,
            'Biology',
            Icons.psychology,
            Colors.green,
            88,
            'Chapter 6: Human Physiology',
            'Topics Covered: 14/16',
            ['Botany', 'Zoology', 'Ecology'],
          ),
          _buildSubjectCard(
            context,
            'English',
            Icons.book,
            Colors.orange,
            92,
            'Novel: Pride and Prejudice',
            'Topics Covered: 18/20',
            ['Literature', 'Grammar', 'Writing'],
          ),
          _buildSubjectCard(
            context,
            'Computer Science',
            Icons.computer,
            Colors.indigo,
            85,
            'Chapter 2: Data Structures',
            'Topics Covered: 11/14',
            ['Programming', 'Database', 'Networks'],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator(
    BuildContext context,
    String label,
    int percentage,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(
              '$percentage%',
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: percentage / 100,
          backgroundColor: color.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  Widget _buildSubjectCard(
    BuildContext context,
    String subject,
    IconData icon,
    Color color,
    int progress,
    String currentTopic,
    String topicsInfo,
    List<String> modules,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectDetailScreen(
                subject: subject,
                icon: icon,
                color: color,
                progress: progress,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          topicsInfo,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$progress%',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progress / 100,
                backgroundColor: color.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 6,
                borderRadius: BorderRadius.circular(3),
              ),
              const SizedBox(height: 12),
              Text(
                'Current: $currentTopic',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: modules.map((module) {
                  return Chip(
                    label: Text(module, style: const TextStyle(fontSize: 12)),
                    backgroundColor: color.withOpacity(0.1),
                    padding: EdgeInsets.zero,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubjectDetailScreen extends StatelessWidget {
  final String subject;
  final IconData icon;
  final Color color;
  final int progress;

  const SubjectDetailScreen({
    super.key,
    required this.subject,
    required this.icon,
    required this.color,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final topics = List.generate(
      20,
      (index) => {
        'title': 'Topic ${index + 1}: ${_getTopicName(index)}',
        'completed': index < (progress * 20 / 100).round(),
        'materials': index % 3 == 0 ? 2 : 1,
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text(subject)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(icon, size: 64, color: color),
                  const SizedBox(height: 16),
                  Text(
                    subject,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text('$progress% Complete'),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: progress / 100,
                    backgroundColor: color.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Topics', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          ...topics.map((topic) => _buildTopicItem(context, topic)),
        ],
      ),
    );
  }

  Widget _buildTopicItem(BuildContext context, Map<String, dynamic> topic) {
    final isCompleted = topic['completed'] as bool;
    final materials = topic['materials'] as int;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted
              ? Colors.green.withOpacity(0.1)
              : Colors.grey.withOpacity(0.1),
          child: Icon(
            isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isCompleted ? Colors.green : Colors.grey,
          ),
        ),
        title: Text(topic['title'] as String),
        subtitle: Text(
          isCompleted ? 'Completed' : 'Pending',
          style: TextStyle(color: isCompleted ? Colors.green : Colors.grey),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (materials > 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.file_present, size: 16, color: color),
                    const SizedBox(width: 4),
                    Text('$materials', style: TextStyle(color: color)),
                  ],
                ),
              ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, size: 16, color: color),
          ],
        ),
      ),
    );
  }

  String _getTopicName(int index) {
    final names = [
      'Introduction',
      'Basic Concepts',
      'Advanced Theory',
      'Problem Solving',
      'Practice Questions',
      'Applications',
      'Case Studies',
      'Experiments',
      'Numerical Methods',
      'Real World Examples',
    ];
    return names[index % names.length];
  }
}
