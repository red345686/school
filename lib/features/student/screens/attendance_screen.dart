import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Dummy attendance data
  final Map<DateTime, bool> _attendanceData = {
    DateTime(2026, 2, 1): true,
    DateTime(2026, 2, 2): false,
    DateTime(2026, 2, 3): true,
    DateTime(2026, 2, 4): true,
    DateTime(2026, 1, 31): true,
    DateTime(2026, 1, 30): true,
    DateTime(2026, 1, 29): false,
    DateTime(2026, 1, 28): true,
    DateTime(2026, 1, 27): true,
    DateTime(2026, 1, 26): false,
  };

  bool _isPresent(DateTime day) {
    return _attendanceData[DateTime(day.year, day.month, day.day)] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final presentDays = _attendanceData.values.where((v) => v).length;
    final totalDays = _attendanceData.length;
    final percentage = (presentDays / totalDays * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Cards
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Days',
                    totalDays.toString(),
                    Icons.calendar_today,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Present',
                    presentDays.toString(),
                    Icons.check_circle,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Absent',
                    (totalDays - presentDays).toString(),
                    Icons.cancel,
                    Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Percentage Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Attendance Percentage',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$percentage%',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                color: double.parse(percentage) >= 75
                                    ? Colors.green
                                    : Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    Icon(
                      double.parse(percentage) >= 75
                          ? Icons.sentiment_satisfied
                          : Icons.sentiment_dissatisfied,
                      size: 48,
                      color: double.parse(percentage) >= 75
                          ? Colors.green
                          : Colors.orange,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Calendar
            Card(
              child: TableCalendar(
                firstDay: DateTime.utc(2026, 1, 1),
                lastDay: DateTime.utc(2026, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final hasData = _attendanceData.containsKey(
                      DateTime(day.year, day.month, day.day),
                    );
                    if (hasData) {
                      final isPresent = _isPresent(day);
                      return Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isPresent
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isPresent ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Legend
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem('Present', Colors.green),
                    _buildLegendItem('Absent', Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Recent Records
            Text(
              'Recent Records',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ..._attendanceData.entries
                .take(5)
                .map((entry) => _buildAttendanceRecord(entry.key, entry.value)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String label,
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
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }

  Widget _buildAttendanceRecord(DateTime date, bool isPresent) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isPresent
              ? Colors.green.withOpacity(0.1)
              : Colors.red.withOpacity(0.1),
          child: Icon(
            isPresent ? Icons.check : Icons.close,
            color: isPresent ? Colors.green : Colors.red,
          ),
        ),
        title: Text(
          '${date.day}/${date.month}/${date.year}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(isPresent ? 'Present' : 'Absent'),
        trailing: Chip(
          label: Text(
            isPresent ? 'P' : 'A',
            style: TextStyle(
              color: isPresent ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: isPresent
              ? Colors.green.withOpacity(0.1)
              : Colors.red.withOpacity(0.1),
        ),
      ),
    );
  }
}
