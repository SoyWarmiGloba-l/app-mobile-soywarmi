import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Image.asset(NbLogoAppBar,
            height: 50, width: 50, fit: BoxFit.contain),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: NBSecondPrimaryColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Stack(alignment: Alignment.center, children: [
          IconButton(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.notifications,
                  color: Theme.of(context).primaryColor,
                  size: 42,
                ),
                Positioned(
                    top: 0,
                    right: 3,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 13,
                        minHeight: 13,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
            iconSize: 40,
            onPressed: () {},
          ),
        ]),
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(NbImageEmpty),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
