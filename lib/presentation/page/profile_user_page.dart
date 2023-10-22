import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/custom_button_menu.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';
import 'package:soywarmi_app/utilities/screen_size_util.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
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
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: ScreenSizeUtil.scaleWidth(0.9),
                  height: ScreenSizeUtil.scaleHeight(0.28),
                  decoration: const BoxDecoration(
                    color: NbSecondSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(NbImageEmpty),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Maria Gonzales',
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            'juan12@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.7)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/edit_profile');
                              },
                              child: const Text(
                                'Editar perfil',
                                style: TextStyle(fontSize: 12),
                              ))
                        ]),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Container(
                  width: ScreenSizeUtil.scaleWidth(0.9),
                  height: ScreenSizeUtil.scaleHeight(0.43),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(children: [
                    CustomButtonMenu(
                      onPressed: () {},
                      label: 'Inicio',
                      color: Theme.of(context).primaryColor,
                      icon: Icons.home,
                      size: 55,
                      withButton: ScreenSizeUtil.scaleWidth(0.9),
                    ),
                    CustomButtonMenu(
                      onPressed: () {},
                      label: 'Notificaciones',
                      color: Theme.of(context).primaryColor,
                      icon: Icons.notifications,
                      size: 55,
                      withButton: ScreenSizeUtil.scaleWidth(0.9),
                    ),
                    CustomButtonMenu(
                      onPressed: () {},
                      label: 'Noticias SoyWarmi',
                      color: Theme.of(context).primaryColor,
                      icon: Icons.newspaper,
                      size: 55,
                      withButton: ScreenSizeUtil.scaleWidth(0.9),
                    ),
                    CustomButtonMenu(
                      onPressed: () {},
                      label: 'Quienes somos',
                      color: Theme.of(context).primaryColor,
                      icon: Icons.question_mark,
                      size: 55,
                      withButton: ScreenSizeUtil.scaleWidth(0.9),
                    ),
                    CustomButtonMenu(
                      onPressed: () {},
                      label: 'Miembros',
                      color: Theme.of(context).primaryColor,
                      icon: Icons.people,
                      size: 55,
                      withButton: ScreenSizeUtil.scaleWidth(0.9),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              NBSecondPrimaryColor),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Cerrar sesión',
                          style: TextStyle(fontSize: 15),
                        ))
                  ]),
                ),
              ),
              Column(children: [
                Image.asset(
                  NBWarmiLogo,
                  width: ScreenSizeUtil.scaleWidth(0.3),
                  height: ScreenSizeUtil.scaleHeight(0.10),
                ),
                Text(
                  'Version 0.0.1',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  '@ 2023 SoyWarmi',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const Text(
                  'Politicas de privacidad - Terminos y condiciones',
                  style: TextStyle(
                    fontSize: 15,
                    color: NBSecondPrimaryColor,
                  ),
                ),
              ])
            ]),
          ),
        ));
  }
}
