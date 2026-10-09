class Profile {
  final int id;
  final String name;
  final int age;
  final String gender;
  final String city;
  final String community;
  final String profession;
  final String? education;
  final int? degree;
  final String? connectedThrough;
  final String? about;

  const Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.city,
    required this.community,
    required this.profession,
    this.education,
    this.degree,
    this.connectedThrough,
    this.about,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as int,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      city: json['city'] as String,
      community: json['community'] as String,
      profession: json['profession'] as String,
      education: json['education'] as String?,
      degree: json['degree'] as int?,
      connectedThrough: json['connected_through'] as String?,
      about: json['about'] as String?,
    );
  }
}