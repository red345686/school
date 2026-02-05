import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exams & Results')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Performance Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overall Performance',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatItem(
                          context,
                          'Average',
                          '82.5%',
                          Icons.trending_up,
                          Colors.blue,
                        ),
                        _buildStatItem(
                          context,
                          'Rank',
                          '5/45',
                          Icons.emoji_events,
                          Colors.orange,
                        ),
                        _buildStatItem(
                          context,
                          'Grade',
                          'A',
                          Icons.grade,
                          Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Performance Chart
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subject-wise Performance',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 200,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barGroups: [
                            _buildBarGroup(0, 85, Colors.blue),
                            _buildBarGroup(1, 78, Colors.purple),
                            _buildBarGroup(2, 92, Colors.teal),
                            _buildBarGroup(3, 88, Colors.green),
                            _buildBarGroup(4, 95, Colors.orange),
                            _buildBarGroup(5, 80, Colors.indigo),
                          ],
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const subjects = [
                                    'Math',
                                    'Phy',
                                    'Chem',
                                    'Bio',
                                    'Eng',
                                    'CS',
                                  ];
                                  return Text(
                                    subjects[value.toInt()],
                                    style: const TextStyle(fontSize: 12),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Upcoming Exams
            Text(
              'Upcoming Exams',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildExamCard(
              context,
              'Mathematics - Unit Test 3',
              'Chapter 5: Quadratic Equations',
              'Feb 10, 2026',
              '10:00 AM',
              Colors.blue,
              true,
            ),
            _buildExamCard(
              context,
              'Physics - Mid Term',
              'Chapters 1-5',
              'Feb 15, 2026',
              '9:00 AM',
              Colors.purple,
              true,
            ),
            const SizedBox(height: 24),

            // Past Results
            Text(
              'Past Results',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildResultCard(
              context,
              'Final Examination - Semester 1',
              'Dec 2025',
              85,
              'A Grade',
              3,
              [
                {'subject': 'Mathematics', 'marks': 85, 'total': 100},
                {'subject': 'Physics', 'marks': 78, 'total': 100},
                {'subject': 'Chemistry', 'marks': 92, 'total': 100},
                {'subject': 'Biology', 'marks': 88, 'total': 100},
                {'subject': 'English', 'marks': 95, 'total': 100},
                {'subject': 'Computer Science', 'marks': 80, 'total': 100},
              ],
            ),
            _buildResultCard(
              context,
              'Mid Term - Semester 1',
              'Oct 2025',
              82,
              'A Grade',
              5,
              [
                {'subject': 'Mathematics', 'marks': 80, 'total': 100},
                {'subject': 'Physics', 'marks': 75, 'total': 100},
                {'subject': 'Chemistry', 'marks': 88, 'total': 100},
                {'subject': 'Biology', 'marks': 85, 'total': 100},
                {'subject': 'English', 'marks': 92, 'total': 100},
                {'subject': 'Computer Science', 'marks': 78, 'total': 100},
              ],
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildExamCard(
    BuildContext context,
    String title,
    String syllabus,
    String date,
    String time,
    Color color,
    bool isUpcoming,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.assignment, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    syllabus,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(
    BuildContext context,
    String examName,
    String date,
    int percentage,
    String grade,
    int rank,
    List<Map<String, dynamic>> subjects,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.1),
            child: const Icon(Icons.check_circle, color: Colors.green),
          ),
          title: Text(
            examName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(date),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              Text(
                'Rank: $rank',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ...subjects.map((subject) {
                    final marks = subject['marks'] as int;
                    final total = subject['total'] as int;
                    final percentage = (marks / total * 100).toInt();
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(subject['subject'] as String),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('$marks/$total'),
                                    Text('$percentage%'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: marks / total,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    percentage >= 75
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text('Download Report Card'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
