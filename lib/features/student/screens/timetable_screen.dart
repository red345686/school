import 'package:flutter/material.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  int _selectedDay = DateTime.now().weekday - 1;

  final List<String> _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final Map<String, List<Map<String, dynamic>>> _timetable = {
    'Monday': [
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '8:00 - 9:00',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Physics',
        'teacher': 'Dr. Patel',
        'time': '9:00 - 10:00',
        'room': '205',
        'color': Colors.purple,
      },
      {
        'subject': 'Chemistry',
        'teacher': 'Ms. Kumar',
        'time': '10:00 - 11:00',
        'room': '203',
        'color': Colors.teal,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'English',
        'teacher': 'Mrs. Singh',
        'time': '11:30 - 12:30',
        'room': '102',
        'color': Colors.orange,
      },
      {
        'subject': 'Biology',
        'teacher': 'Dr. Verma',
        'time': '12:30 - 1:30',
        'room': '204',
        'color': Colors.green,
      },
      {
        'subject': 'Lunch',
        'teacher': '',
        'time': '1:30 - 2:00',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Computer Science',
        'teacher': 'Mr. Reddy',
        'time': '2:00 - 3:00',
        'room': 'Lab 1',
        'color': Colors.indigo,
      },
    ],
    'Tuesday': [
      {
        'subject': 'English',
        'teacher': 'Mrs. Singh',
        'time': '8:00 - 9:00',
        'room': '102',
        'color': Colors.orange,
      },
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '9:00 - 10:00',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Biology',
        'teacher': 'Dr. Verma',
        'time': '10:00 - 11:00',
        'room': '204',
        'color': Colors.green,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Physics',
        'teacher': 'Dr. Patel',
        'time': '11:30 - 12:30',
        'room': '205',
        'color': Colors.purple,
      },
      {
        'subject': 'Chemistry',
        'teacher': 'Ms. Kumar',
        'time': '12:30 - 1:30',
        'room': '203',
        'color': Colors.teal,
      },
      {
        'subject': 'Lunch',
        'teacher': '',
        'time': '1:30 - 2:00',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Physical Education',
        'teacher': 'Mr. Joshi',
        'time': '2:00 - 3:00',
        'room': 'Ground',
        'color': Colors.red,
      },
    ],
    'Wednesday': [
      {
        'subject': 'Chemistry',
        'teacher': 'Ms. Kumar',
        'time': '8:00 - 9:00',
        'room': '203',
        'color': Colors.teal,
      },
      {
        'subject': 'Biology',
        'teacher': 'Dr. Verma',
        'time': '9:00 - 10:00',
        'room': '204',
        'color': Colors.green,
      },
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '10:00 - 11:00',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Computer Science',
        'teacher': 'Mr. Reddy',
        'time': '11:30 - 12:30',
        'room': 'Lab 1',
        'color': Colors.indigo,
      },
      {
        'subject': 'English',
        'teacher': 'Mrs. Singh',
        'time': '12:30 - 1:30',
        'room': '102',
        'color': Colors.orange,
      },
      {
        'subject': 'Lunch',
        'teacher': '',
        'time': '1:30 - 2:00',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Physics',
        'teacher': 'Dr. Patel',
        'time': '2:00 - 3:00',
        'room': '205',
        'color': Colors.purple,
      },
    ],
    'Thursday': [
      {
        'subject': 'Biology',
        'teacher': 'Dr. Verma',
        'time': '8:00 - 9:00',
        'room': '204',
        'color': Colors.green,
      },
      {
        'subject': 'English',
        'teacher': 'Mrs. Singh',
        'time': '9:00 - 10:00',
        'room': '102',
        'color': Colors.orange,
      },
      {
        'subject': 'Physics',
        'teacher': 'Dr. Patel',
        'time': '10:00 - 11:00',
        'room': '205',
        'color': Colors.purple,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '11:30 - 12:30',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Chemistry',
        'teacher': 'Ms. Kumar',
        'time': '12:30 - 1:30',
        'room': '203',
        'color': Colors.teal,
      },
      {
        'subject': 'Lunch',
        'teacher': '',
        'time': '1:30 - 2:00',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Art & Craft',
        'teacher': 'Ms. Desai',
        'time': '2:00 - 3:00',
        'room': 'Art Room',
        'color': Colors.pink,
      },
    ],
    'Friday': [
      {
        'subject': 'Physics',
        'teacher': 'Dr. Patel',
        'time': '8:00 - 9:00',
        'room': '205',
        'color': Colors.purple,
      },
      {
        'subject': 'Chemistry',
        'teacher': 'Ms. Kumar',
        'time': '9:00 - 10:00',
        'room': '203',
        'color': Colors.teal,
      },
      {
        'subject': 'English',
        'teacher': 'Mrs. Singh',
        'time': '10:00 - 11:00',
        'room': '102',
        'color': Colors.orange,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Biology',
        'teacher': 'Dr. Verma',
        'time': '11:30 - 12:30',
        'room': '204',
        'color': Colors.green,
      },
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '12:30 - 1:30',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Lunch',
        'teacher': '',
        'time': '1:30 - 2:00',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Computer Science',
        'teacher': 'Mr. Reddy',
        'time': '2:00 - 3:00',
        'room': 'Lab 1',
        'color': Colors.indigo,
      },
    ],
    'Saturday': [
      {
        'subject': 'Mathematics',
        'teacher': 'Mr. Sharma',
        'time': '8:00 - 9:00',
        'room': '101',
        'color': Colors.blue,
      },
      {
        'subject': 'Physics Lab',
        'teacher': 'Dr. Patel',
        'time': '9:00 - 11:00',
        'room': 'Lab 2',
        'color': Colors.purple,
      },
      {
        'subject': 'Break',
        'teacher': '',
        'time': '11:00 - 11:30',
        'room': '',
        'color': Colors.grey,
      },
      {
        'subject': 'Chemistry Lab',
        'teacher': 'Ms. Kumar',
        'time': '11:30 - 1:30',
        'room': 'Lab 3',
        'color': Colors.teal,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              // Show exam schedule
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Day Selector
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _days.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedDay == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(_days[index]),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedDay = index;
                      });
                    },
                    selectedColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : null,
                      fontWeight: isSelected ? FontWeight.bold : null,
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Classes List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _timetable[_days[_selectedDay]]!.length,
              itemBuilder: (context, index) {
                final period = _timetable[_days[_selectedDay]]![index];
                return _buildPeriodCard(period);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => _buildExamScheduleDialog(context),
          );
        },
        icon: const Icon(Icons.event),
        label: const Text('Exam Schedule'),
      ),
    );
  }

  Widget _buildPeriodCard(Map<String, dynamic> period) {
    final isBreak =
        period['subject'] == 'Break' || period['subject'] == 'Lunch';

    if (isBreak) {
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                period['subject'] == 'Lunch'
                    ? Icons.restaurant
                    : Icons.local_cafe,
                color: Colors.grey,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  period['subject'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
              ),
              Text(period['time'], style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      );
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 60,
                decoration: BoxDecoration(
                  color: period['color'],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      period['subject'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      period['teacher'],
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          period['time'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(Icons.room, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          period['room'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamScheduleDialog(BuildContext context) {
    final exams = [
      {
        'subject': 'Mathematics',
        'date': 'Feb 10, 2026',
        'time': '10:00 AM',
        'color': Colors.blue,
      },
      {
        'subject': 'Physics',
        'date': 'Feb 15, 2026',
        'time': '9:00 AM',
        'color': Colors.purple,
      },
      {
        'subject': 'Chemistry',
        'date': 'Feb 18, 2026',
        'time': '10:00 AM',
        'color': Colors.teal,
      },
      {
        'subject': 'Biology',
        'date': 'Feb 20, 2026',
        'time': '9:00 AM',
        'color': Colors.green,
      },
      {
        'subject': 'English',
        'date': 'Feb 22, 2026',
        'time': '10:00 AM',
        'color': Colors.orange,
      },
      {
        'subject': 'Computer Science',
        'date': 'Feb 25, 2026',
        'time': '9:00 AM',
        'color': Colors.indigo,
      },
    ];

    return AlertDialog(
      title: const Text('Upcoming Exam Schedule'),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: exams.length,
          itemBuilder: (context, index) {
            final exam = exams[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: (exam['color'] as Color).withOpacity(0.1),
                child: Icon(Icons.assignment, color: exam['color'] as Color),
              ),
              title: Text(exam['subject'] as String),
              subtitle: Text('${exam['date']} at ${exam['time']}'),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
