import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:soywarmi_app/core/language/locales.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';
import 'package:image_picker/image_picker.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _controller = TextEditingController();

  List<File?> _images = [];

  String? _value = 'Anonimo';
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
                    child: Text(LocaleData.publicar.getString(context),
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
                value: _value,
                dropdownColor: Colors.white,
                items:  [
                  DropdownMenuItem<String>(
                    value: 'Anonimo',
                    child: Text(LocaleData.anonimo.getString(context)),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Publico',
                    child: Text(LocaleData.publico.getString(context)),
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
                onChanged: (String? value) {
                  setState(() {
                    _value = value;
                  });
                },
                hint: const Text('Anonimo'),
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 60, right: 10),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: LocaleData.cualEsTuPregunta.getString(context),
                      hintStyle: TextStyle(
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    maxLength: 100,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _images.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            height: 300,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image:
                                          FileImage(_images[index]!, scale: 3),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: CircleAvatar(
                                    child: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () {
                                        setState(() {
                                          _images.removeAt(index);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
                  onPressed: () {
                    if (_images.length >= 3) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'No puedes agregar mas de 3 imagenes por post'),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );

                      return;
                    }
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      setState(() {
                        _images.add(File(value!.path));
                      });
                    });
                  },
                  icon: CircleAvatar(
                    backgroundColor: NBSecondPrimaryColor.withOpacity(0.1) ,
                    child: Icon(
                      Icons.image,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ]));
  }
}
