import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../services/profile_service.dart';
import '../widgets/profile_card.dart';
import '../widgets/profile_empty_state.dart';
import '../widgets/profile_error_state.dart';
import '../widgets/profile_loading.dart';
import '../widgets/profile_search_bar.dart';
import 'profile_details_screen.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  final ProfileService _profileService = ProfileService();

  List<Profile> _profiles = [];
  String _searchQuery = '';

  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  Future<void> _loadProfiles() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final profiles = await _profileService.fetchProfiles();

      if (!mounted) return;

      setState(() {
        _profiles = profiles;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _errorMessage = 'Unable to load profiles. Please try again.';
      });
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  List<Profile> get _filteredProfiles {
    final query = _searchQuery.trim().toLowerCase();

    if (query.isEmpty) {
      return _profiles;
    }

    return _profiles.where((profile) {
      final name = profile.name.toLowerCase();
      final city = profile.city.toLowerCase();

      return name.contains(query) || city.contains(query);
    }).toList();
  }

  void _openProfile(Profile profile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileDetailsScreen(
          profile: profile,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
      ),
      body: Column(
        children: [
          ProfileSearchBar(
            onChanged: _onSearchChanged,
          ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const ProfileLoading();
    }

    if (_errorMessage != null) {
      return ProfileErrorState(
        message: _errorMessage!,
        onRetry: _loadProfiles,
      );
    }

    final profiles = _filteredProfiles;

    if (profiles.isEmpty) {
      return const ProfileEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        final profile = profiles[index];

        return ProfileCard(
          profile: profile,
          onTap: () => _openProfile(profile),
        );
      },
    );
  }
}