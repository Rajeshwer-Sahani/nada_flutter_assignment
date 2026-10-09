import 'package:flutter/material.dart';

class ProfileEmptyState extends StatelessWidget {
  const ProfileEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No profiles match',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}