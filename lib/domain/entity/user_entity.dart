import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String password;
  final String rol;

  const UserEntity({
    required this.id,
    required this.password,
    required this.rol,
  });

  @override
  List<Object?> get props => [id, password, rol];
}
