import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String password;
  final String rol;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.rol,
  });

  @override
  List<Object?> get props => [id, email, password, rol];

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        rol: json['rol'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'rol': rol,
      };
}
