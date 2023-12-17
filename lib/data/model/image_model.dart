import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final int id;
  final int imageableId;
  final String imageableType;
  final String name;
  final String type;
  final String url;

  const ImageModel({
    required this.id,
    required this.imageableId,
    required this.imageableType,
    required this.name,
    required this.type,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      imageableId: json['imageable_id'] as int,
      imageableType: json['imageable_type'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageable_id': imageableId,
      'imageable_type': imageableType,
      'name': name,
      'type': type,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [
        id,
        imageableId,
        imageableType,
        name,
        type,
        url,
      ];
}
