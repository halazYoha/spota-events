import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF2563EB),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildSettingsSection(
            title: 'App Settings',
            items: [
              _buildSettingsTile(
                icon: Icons.language,
                title: 'Language',
                trailing: const Text('English'),
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.dark_mode,
                title: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
                onTap: () {},
              ),
            ],
          ),
          _buildSettingsSection(
            title: 'Account',
            items: [
              _buildSettingsTile(
                icon: Icons.lock,
                title: 'Privacy Policy',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.description,
                title: 'Terms of Service',
                onTap: () {},
              ),
            ],
          ),
          _buildSettingsSection(
            title: 'About',
            items: [
              _buildSettingsTile(
                icon: Icons.info,
                title: 'App Version',
                trailing: const Text('1.0.0'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
