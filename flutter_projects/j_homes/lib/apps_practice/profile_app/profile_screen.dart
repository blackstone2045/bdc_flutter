import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: CustomAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.cyan,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 16),

            const Text(
              'MD RAFIQUE',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Flutter Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            const _InfoCard(
              icon: Icons.email,
              title: 'Email',
              value: 'rafique.niet@gmail.com',
            ),
            const _InfoCard(
              icon: Icons.phone,
              title: 'Phone',
              value: '+880 1872367894',
            ),
            const _InfoCard(
              icon: Icons.location_on,
              title: 'Location',
              value: 'Narayanganj, Dhaka',
            ),
            const _InfoCard(
              icon: Icons.work,
              title: 'Experience',
              value: '3+ years building mobile apps',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}


class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.pink, size: 22),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
