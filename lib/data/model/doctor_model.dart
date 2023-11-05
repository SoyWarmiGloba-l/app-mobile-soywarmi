import 'package:soywarmi_app/data/model/person_model.dart';

class DoctorModel extends PersonModel {
  final String specialty;
  final String university;

  const DoctorModel({
    required String id,
    required String name,
    required String lastName,
    required String secondLastName,
    required String birthDate,
    required String gender,
    required String email,
    required String phoneNumber,
    required this.specialty,
    required this.university,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          secondLastName: secondLastName,
          birthDate: birthDate,
          gender: gender,
          phoneNumber: phoneNumber,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      secondLastName: json['secondLastName'] as String,
      birthDate: json['birthDate'] as String,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      specialty: json['specialty'] as String,
      university: json['university'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
