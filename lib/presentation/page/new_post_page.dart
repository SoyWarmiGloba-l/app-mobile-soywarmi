import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.cancel, color: Theme.of(context).primaryColor),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: NbSecondSecondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Postear',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Column(children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(NbImageEmpty),
                ),
              ),
              DropdownButton<String>(
                iconSize: 42,
                items: const [
                  DropdownMenuItem<String>(
                    child: Text('Publico'),
                    value: 'Anonimo',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('Privado'),
                    value: 'Publico',
                  ),
                ],
                icon: Icon(Icons.arrow_drop_down,
                    color: Theme.of(context).primaryColor),
                underline: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (String? value) {},
                hint: const Text('Anonimo'),
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cual es tu pregunta?',
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
                maxLines: 10,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: NbSecondSecondaryColor.withOpacity(0.1),
              border: const Border(
                  top: BorderSide(color: NbSecondSecondaryColor, width: 1.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
