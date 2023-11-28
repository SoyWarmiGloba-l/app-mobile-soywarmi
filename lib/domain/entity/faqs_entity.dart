import 'package:equatable/equatable.dart';

class FaqsEntity extends Equatable {
  final String id;
  final String question;
  final String answer;

  const FaqsEntity({
    required this.id,
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
      ];
}
