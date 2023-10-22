import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/chat_card.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [ChatCard(), ChatCard(), ChatCard()]),
    );
  }
}
