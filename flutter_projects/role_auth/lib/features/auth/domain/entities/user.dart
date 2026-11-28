class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? adminKey;
  final DateTime? createdAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.createdAt,
  required this.role,
    this.adminKey
  }

  );
}
