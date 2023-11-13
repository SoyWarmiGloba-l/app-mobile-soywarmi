import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;
  final String date;
  final String author;
  final String category;

  const PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.date,
    required this.author,
    required this.category,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      date: json['date'] as String,
      category: json['category'] as String,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
