import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/card_post_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CardPostPage(),
          SizedBox(height: 10),
          CardPostPage(),
          SizedBox(height: 10),
          CardPostPage()
        ],
      ),
    );
  }
}
