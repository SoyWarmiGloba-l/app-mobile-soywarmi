import 'package:equatable/equatable.dart';

class FaqsModel extends Equatable {
  final String id;
  final String question;
  final String answer;

  const FaqsModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) {
    return FaqsModel(
      id: json['id'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );
  }

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
      ];
}
