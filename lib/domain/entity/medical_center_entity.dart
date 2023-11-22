import 'package:equatable/equatable.dart';

class MedicalCenterEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String openingDate;
  final String closingDate;
  final String phones;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final List<String> medicalServices;

  const MedicalCenterEntity({
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
