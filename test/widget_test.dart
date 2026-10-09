import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nada_flutter_assignment/models/profile.dart';
import 'package:nada_flutter_assignment/screens/profiles_screen.dart';
import 'package:nada_flutter_assignment/services/profile_service.dart';

class FakeProfileService extends ProfileService {
  const FakeProfileService();

  @override
  Future<List<Profile>> fetchProfiles() async {
    return [
      Profile.fromJson({
        'id': 1,
        'name': 'Ananya Sharma',
        'age': 27,
        'gender': 'F',
        'city': 'Noida',
        'community': 'Brahmin',
        'profession': 'Product designer at a fintech',
        'education': 'B.Des, NIFT Delhi',
        'degree': 1,
        'connected_through': 'Your cousin Nikhil knows her brother.',
        'about': 'Reads a book a week.',
      }),
      Profile.fromJson({
        'id': 2,
        'name': 'Rohan Agarwal',
        'age': 29,
        'gender': 'M',
        'city': 'Delhi',
        'community': 'Agarwal',
        'profession': 'Chartered accountant',
        'education': 'CA',
        'degree': 2,
        'connected_through': 'Your uncle knows his father.',
        'about': 'Plays badminton.',
      }),
    ];
  }
}

void main() {
  testWidgets('search filters profiles by city', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfilesScreen(profileService: FakeProfileService()),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Ananya Sharma'), findsOneWidget);
    expect(find.text('Rohan Agarwal'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Delhi');

    await tester.pump();

    expect(find.text('Rohan Agarwal'), findsOneWidget);
    expect(find.text('Ananya Sharma'), findsNothing);
  });

  testWidgets('shows empty state when no profile matches', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfilesScreen(profileService: FakeProfileService()),
      ),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Mumbai');

    await tester.pump();

    expect(find.text('No profiles match'), findsOneWidget);
  });
}
