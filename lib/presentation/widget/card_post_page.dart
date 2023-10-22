import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class CardPostPage extends StatelessWidget {
  const CardPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(0),
      child: Column(children: [
        const Row(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(NbImageEmpty),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Anonimo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(NbLogoPost,
                height: 200, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hola, soy nuevo en la comunidad',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '13',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '19',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(NbImageEmpty),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: NbSecondSecondaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        ' Bienvenido a la comunidad dsfsduiohfsuoidf sduhfsiudfhsuidf sudfhsduifsdfbsdufb sdasdbisbdfsd jshdfsdhfjsvdfhgs sdhfhjsdgf sassdfsd sdfjhsdhfjsd sdfshdfjsdfg'),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('Ver todo los 19 comentarios',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark.withOpacity(0.5),
              )),
        ),
      ]),
    );
  }
}
