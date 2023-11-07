import 'package:soywarmi_app/data/model/member_model.dart';
import 'package:soywarmi_app/domain/entity/person_entity.dart';

class MemberEntity extends PersonEntity {
  final String description;
  final String role;
  final SocialNetwoork socialNetworks;

  const MemberEntity({
    required int id,
    required String name,
    required String lastName,
    required String motherLastname,
    required String birthday,
    required String gender,
    required String email,
    required String photo,
    required String phone,
    required String createdAt,
    required String updatedAt,
    required bool deletedAt,
    required this.description,
    required this.role,
    required this.socialNetworks,
  }) : super(
          id: id,
          name: name,
          lastName: lastName,
          motherLastname: motherLastname,
          birthday: birthday,
          gender: gender,
          phone: phone,
          email: email,
          photo: photo,
          createdAt: createdAt,
          updatedAt: updatedAt,
          deletedAt: deletedAt,
        );
}