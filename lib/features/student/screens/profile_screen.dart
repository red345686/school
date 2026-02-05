import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Rahul Sharma',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Roll No: 2024-CS-101',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Class 12-A | Science Stream',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          'Attendance',
                          '85%',
                          Icons.calendar_today,
                        ),
                        _buildStatItem('Average', '82.5%', Icons.grade),
                        _buildStatItem('Rank', '5/45', Icons.emoji_events),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Personal Information
            _buildSectionTitle(context, 'Personal Information'),
            Card(
              child: Column(
                children: [
                  _buildInfoTile(
                    Icons.email,
                    'Email',
                    'rahul.sharma@schoolify.com',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.phone, 'Phone', '+91 98765 43210'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.cake, 'Date of Birth', 'March 15, 2008'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.male, 'Gender', 'Male'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.bloodtype, 'Blood Group', 'O+'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Academic Information
            _buildSectionTitle(context, 'Academic Information'),
            Card(
              child: Column(
                children: [
                  _buildInfoTile(Icons.school, 'Class', '12-A'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.bookmark, 'Roll Number', '2024-CS-101'),
                  const Divider(height: 1),
                  _buildInfoTile(
                    Icons.date_range,
                    'Admission Date',
                    'April 1, 2022',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.science, 'Stream', 'Science (PCM + CS)'),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.home, 'Section', 'A'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Parent Information
            _buildSectionTitle(context, 'Parent/Guardian Information'),
            Card(
              child: Column(
                children: [
                  _buildInfoTile(
                    Icons.person,
                    "Father's Name",
                    'Mr. Suresh Sharma',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(
                    Icons.phone,
                    "Father's Phone",
                    '+91 98765 11111',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(Icons.work, "Father's Occupation", 'Engineer'),
                  const Divider(height: 1),
                  _buildInfoTile(
                    Icons.person_outline,
                    "Mother's Name",
                    'Mrs. Priya Sharma',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(
                    Icons.phone,
                    "Mother's Phone",
                    '+91 98765 22222',
                  ),
                  const Divider(height: 1),
                  _buildInfoTile(
                    Icons.work_outline,
                    "Mother's Occupation",
                    'Teacher',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Address
            _buildSectionTitle(context, 'Address'),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.home, color: Colors.grey[600]),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Text(
                        '123, Green Park Society,\nModel Town, Sector 5,\nBangalore, Karnataka - 560001',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Documents
            _buildSectionTitle(context, 'Documents'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: const Text('Birth Certificate'),
                    trailing: const Icon(Icons.download),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: const Text('Transfer Certificate'),
                    trailing: const Icon(Icons.download),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(
                      Icons.picture_as_pdf,
                      color: Colors.red,
                    ),
                    title: const Text('Previous Academic Records'),
                    trailing: const Icon(Icons.download),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.badge, color: Colors.blue),
                    title: const Text('Student ID Card'),
                    trailing: const Icon(Icons.download),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Settings
            _buildSectionTitle(context, 'Settings'),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notifications'),
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Change Password'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    subtitle: const Text('English'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
