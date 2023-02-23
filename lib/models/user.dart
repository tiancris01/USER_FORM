// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String lastName;
  final int age;
  final List<String> address;
  User({
    required this.name,
    required this.lastName,
    required this.age,
    required this.address,
  });

  User copyWith({
    String? name,
    String? lastName,
    int? age,
    List<String>? address,
  }) {
    return User(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      address: address ?? this.address,
    );
  }
}
