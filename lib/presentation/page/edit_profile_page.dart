import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/custom_button.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_litle.dart';
import 'package:soywarmi_app/presentation/widget/gender_card.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
        title: Text(
          'Edicion de perfil',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: Image.asset(NbImageEmpty).image,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      color: Colors.white,
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
              const CustomTextTitle(
                label: '¿Como te llamas?',
              ),
              SizedBox(
                height: 10,
              ),
              const CustomTextField(label: 'Nombre'),
              const CustomTextField(label: 'Apellido'),
              const CustomTextTitle(label: '¿Cuando naciste?'),
              SizedBox(
                height: 10,
              ),
              const CustomTextField(label: 'Fecha de nacimiento'),
              const CustomTextTitle(
                label: '¿Con que genero te edentificas?',
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GenderCard(
                      label: 'Masculino',
                    ),
                    GenderCard(
                      label: 'Femenino',
                    ),
                    GenderCard(
                      label: 'No binario',
                    ),
                    GenderCard(
                      label: 'Prefiero no decirlo',
                    )
                  ],
                ),
              ),
            ],
          ))),
          Container(
            decoration: BoxDecoration(
              color: NbSecondSecondaryColor.withOpacity(0.1),
              border: const Border(
                  top: BorderSide(color: NbSecondSecondaryColor, width: 1.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: CustomButton(
                label: 'Guardar cambios',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
