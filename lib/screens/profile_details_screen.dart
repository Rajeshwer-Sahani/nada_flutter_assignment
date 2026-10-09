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
    return Scaffold(
      appBar: AppBar(
        title: Text(profile.name),
      ),
      body: const Center(
        child: Text('Profile details coming next'),
      ),
    );
  }
}