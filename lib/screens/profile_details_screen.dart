import 'package:flutter/material.dart';

import '../models/profile.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final Profile profile;

  const ProfileDetailsScreen({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final connectedThrough =
        profile.connectedThrough ?? 'No connection yet';

    return Scaffold(
      appBar: AppBar(
        title: Text(profile.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            profile.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '${profile.age} years old',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          _InfoSection(
            title: 'Gender',
            value: profile.gender,
          ),
          _InfoSection(
            title: 'City',
            value: profile.city,
          ),
          _InfoSection(
            title: 'Community',
            value: profile.community,
          ),
          _InfoSection(
            title: 'Profession',
            value: profile.profession,
          ),

          if (profile.education != null)
            _InfoSection(
              title: 'Education',
              value: profile.education!,
            ),

          if (profile.degree != null)
            _InfoSection(
              title: 'Connection degree',
              value: '${profile.degree}',
            ),

          _ConnectionSection(
            connectedThrough: connectedThrough,
          ),

          if (profile.about != null)
            _InfoSection(
              title: 'About',
              value: profile.about!,
            ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String value;

  const _InfoSection({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _ConnectionSection extends StatelessWidget {
  final String connectedThrough;

  const _ConnectionSection({
    required this.connectedThrough,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connected through',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              connectedThrough,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}