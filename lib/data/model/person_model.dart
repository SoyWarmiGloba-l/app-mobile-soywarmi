import 'package:equatable/equatable.dart';

class PersonModel extends Equatable {
  final String id;
  final String name;
  final String lastName;
  final String secondLastName;
  final String birthDate;
  final String gender;
  final String phoneNumber;

  const PersonModel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.secondLastName,
    required this.birthDate,
    required this.gender,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props =>
      [id, name, lastName, secondLastName, birthDate, gender, phoneNumber];
}
