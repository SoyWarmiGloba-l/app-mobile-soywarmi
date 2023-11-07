import 'package:soywarmi_app/data/model/person_model.dart';

class MemberModel extends PersonModel {
  final String description;
  final String rolEquipo;
  final SocialNetwoork socialNetworks;

  const MemberModel({
    required int id,
    required String name,
    required String lastName,
    required String motherLastname,
    required String birthday,
    required String gender,
    required String phoneNumber,
    required String email,
    required String photo,
    required String phone,
    required String createdAt,
    required String updatedAt,
    required bool deletedAt,
    required this.description,
    required this.rolEquipo,
    required this.socialNetworks,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          motherLastname: motherLastname,
          birthday: birthday,
          gender: gender,
          email: email,
          photo: photo,
          phone: phone,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
        id: json['person']['id'] as int,
        name: (json['person']['name'] ?? '') as String,
        lastName: (json['person']['lastname'] ?? '') as String,
        motherLastname: (json['person']['mother_lastname'] ?? '') as String,
        birthday: (json['person']['birthday'] ?? '') as String,
        gender: (json['person']['gender'] ?? '') as String,
        phoneNumber: (json['person']['phoneNumber'] ?? '') as String,
        email: (json['person']['email'] ?? '') as String,
        photo: (json['person']['photo'] ?? '') as String,
        phone: (json['person']['phone'] ?? '') as String,
        createdAt: (json['person']['created_at'] ?? '') as String,
        updatedAt: (json['person']['update_at'] ?? '') as String,
        deletedAt: (json['person']['deleted_at'] ?? false) as bool,
        description: json['description'] as String,
        rolEquipo: (json['rol_equipo'] ?? '') as String,
        socialNetworks: SocialNetwoork(
          twitter: (json['social_networks']['twitter'] ?? '') as String,
          facebook: (json['social_networks']['facebook'] ?? '') as String,
          instagram: (json['social_networks']['instagram'] ?? '') as String,
        )
        
        
        );
        
  }
}

class SocialNetwoork {
  final String twitter;
  final String facebook;
  final String instagram;

  const SocialNetwoork({
    required this.twitter,
    required this.facebook,
    required this.instagram,
  });

  
}
