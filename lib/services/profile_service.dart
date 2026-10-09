import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/profile.dart';

class ProfileService {
  static const String profilesUrl =
      'https://gist.githubusercontent.com/jordandivyansh/c96fa18f141e0abb904e394eb91fbabb/raw/d235446f37cd51aad4cfffa2b76483498c27a7b9/take-home-profiles.json';

  Future<List<Profile>> fetchProfiles() async {
    final response = await http.get(Uri.parse(profilesUrl));

    if (response.statusCode != 200) {
      throw Exception('Failed to load profiles');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);

    final profilesJson = data['profiles'];

    if (profilesJson is! List) {
      throw Exception('Invalid profiles data');
    }

    return profilesJson
        .map((profile) => Profile.fromJson(profile as Map<String, dynamic>))
        .toList();
  }
}
