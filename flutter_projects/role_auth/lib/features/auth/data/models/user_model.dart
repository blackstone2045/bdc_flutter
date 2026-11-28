import '../../domain/entities/user.dart';

class UserModel extends User{
  new({
required super.id,
required super.name,
required super.email,
required super.role,
  super.adminKey,
    super.createdAt
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,

      role: json['role'] ?? '',
      adminKey: json[''] ?? '',

    );
  }
}