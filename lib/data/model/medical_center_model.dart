import 'package:equatable/equatable.dart';

class MedicalCenterModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String latitude;
  final String longitude;
  final String openingDate;
  final String closingDate;
  final String phones;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final List<dynamic> medicalServices;

  const MedicalCenterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.openingDate,
    required this.closingDate,
    required this.phones,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.medicalServices,
  });

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      openingDate: json['opening_datetime'] as String,
      closingDate: json['closing_datetime'] as String,
      phones: json['phones'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      deletedAt: (json['deleted_at'] ?? '') as String,
     medicalServices: (json['medical_services'] as List) ?? [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        latitude,
        longitude,
        openingDate,
        closingDate,
        phones,
        createdAt,
        updatedAt,
        deletedAt,
        medicalServices,
      ];
}
