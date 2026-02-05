import 'package:flutter/material.dart';

class CommunicationScreen extends StatelessWidget {
  const CommunicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Communication'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Announcements'),
              Tab(text: 'Messages'),
              Tab(text: 'Feedback'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [AnnouncementsTab(), MessagesTab(), FeedbackTab()],
        ),
      ),
    );
  }
}

class AnnouncementsTab extends StatelessWidget {
  const AnnouncementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final announcements = [
      {
        'title': 'Annual Sports Day',
        'message':
            'Annual Sports Day will be held on February 20, 2026. All students are requested to participate.',
        'date': '2 hours ago',
        'priority': 'high',
        'category': 'Event',
      },
      {
        'title': 'Parent-Teacher Meeting',
        'message':
            'Parent-Teacher meeting is scheduled for February 15, 2026. Parents are requested to attend.',
        'date': '1 day ago',
        'priority': 'high',
        'category': 'Meeting',
      },
      {
        'title': 'Library Books Due',
        'message':
            'Please return all borrowed library books by February 10, 2026 to avoid late fees.',
        'date': '2 days ago',
        'priority': 'medium',
        'category': 'Library',
      },
      {
        'title': 'Science Exhibition',
        'message':
            'Science exhibition will be conducted on March 5, 2026. Students interested in participating should register by February 20.',
        'date': '3 days ago',
        'priority': 'medium',
        'category': 'Event',
      },
      {
        'title': 'Winter Break Schedule',
        'message':
            'School will be closed for winter break from December 20-31. Regular classes will resume on January 2.',
        'date': '1 week ago',
        'priority': 'low',
        'category': 'Holiday',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        final announcement = announcements[index];
        final priority = announcement['priority'] as String;
        final color = priority == 'high'
            ? Colors.red
            : priority == 'medium'
            ? Colors.orange
            : Colors.blue;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) =>
                    _buildAnnouncementDialog(context, announcement),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          announcement['category'] as String,
                          style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        announcement['date'] as String,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (priority == 'high')
                        Icon(Icons.priority_high, color: color, size: 20),
                      if (priority == 'high') const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          announcement['title'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    announcement['message'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnnouncementDialog(
    BuildContext context,
    Map<String, dynamic> announcement,
  ) {
    return AlertDialog(
      title: Text(announcement['title'] as String),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(announcement['category'] as String),
                  backgroundColor: Colors.blue.withOpacity(0.1),
                ),
                const Spacer(),
                Text(
                  announcement['date'] as String,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(announcement['message'] as String),
          ],
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

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = [
      {
        'sender': 'Mr. Sharma (Mathematics)',
        'message': 'Please complete Assignment 5 by tomorrow.',
        'time': '10:30 AM',
        'unread': true,
      },
      {
        'sender': 'Dr. Patel (Physics)',
        'message': 'Lab report for Experiment 3 is due on Friday.',
        'time': '9:15 AM',
        'unread': true,
      },
      {
        'sender': 'Ms. Kumar (Chemistry)',
        'message': 'Great job on your last test! Keep it up.',
        'time': 'Yesterday',
        'unread': false,
      },
      {
        'sender': 'School Office',
        'message': 'Your new ID card is ready for collection.',
        'time': 'Yesterday',
        'unread': false,
      },
      {
        'sender': 'Mrs. Singh (English)',
        'message': 'Book review submission deadline extended to next Monday.',
        'time': '2 days ago',
        'unread': false,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final unread = message['unread'] as bool;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          color: unread ? Colors.blue.withOpacity(0.05) : null,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: unread ? Colors.blue : Colors.grey,
              child: Text(
                (message['sender'] as String).substring(0, 1),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              message['sender'] as String,
              style: TextStyle(
                fontWeight: unread ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              message['message'] as String,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message['time'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: unread ? Colors.blue : Colors.grey[600],
                  ),
                ),
                if (unread)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Open message detail
            },
          ),
        );
      },
    );
  }
}

class FeedbackTab extends StatelessWidget {
  const FeedbackTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Send Feedback Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Send Feedback',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Subject',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.subject),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Your Feedback',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.send),
                      label: const Text('Submit Feedback'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Previous Feedback
          Text(
            'Your Previous Feedback',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          _buildFeedbackItem(
            context,
            'Request for Extra Classes',
            'Would like to request extra classes for Mathematics...',
            'Resolved',
            'Jan 28, 2026',
            Colors.green,
          ),
          _buildFeedbackItem(
            context,
            'Library Book Suggestion',
            'Please add more books on Quantum Physics...',
            'In Progress',
            'Jan 25, 2026',
            Colors.orange,
          ),
          _buildFeedbackItem(
            context,
            'Cafeteria Feedback',
            'Suggestion for healthier food options...',
            'Resolved',
            'Jan 20, 2026',
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackItem(
    BuildContext context,
    String subject,
    String content,
    String status,
    String date,
    Color statusColor,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: Icon(
          status == 'Resolved' ? Icons.check_circle : Icons.schedule,
          color: statusColor,
        ),
        title: Text(subject),
        subtitle: Text(date),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Feedback:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(content),
                if (status == 'Resolved') ...[
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Response:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Thank you for your feedback. We have implemented your suggestion.',
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
