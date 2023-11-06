import 'package:flutter/material.dart';

class FrequentAskedQuestionsPage extends StatefulWidget {
  const FrequentAskedQuestionsPage({super.key});

  @override
  State<FrequentAskedQuestionsPage> createState() => _FrequentAskedQuestionsPageState();
}

class _FrequentAskedQuestionsPageState extends State<FrequentAskedQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Preguntas frecuentes',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}