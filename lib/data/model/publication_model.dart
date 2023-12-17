import 'package:equatable/equatable.dart';

class PublicationModel extends Equatable {
  final int id;
  final int userId;
  final String title;
  final String description;
  final bool type;
  final List<String> images;

  const PublicationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.type,
    required this.images,
  });

  factory PublicationModel.fromJson(Map<String, dynamic> json) {
    return PublicationModel(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as bool,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'type': type,
      'images': images,
    };
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        description,
        type,
        images,
      ];
}
