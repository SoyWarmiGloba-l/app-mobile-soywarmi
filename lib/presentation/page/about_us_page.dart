import 'package:flutter/material.dart';

import '../../utilities/nb_colors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<Item> _listaItems=[
    Item(title: "Mision",expanded: "Empoderamos a individuos para vivir vidas auténticas y plenas al proporcionar orientación sexual inclusiva, recursos educativos y apoyo emocional. Nos esforzamos por crear un mundo donde todas las personas puedan explorar, entender y celebrar su identidad sexual de manera segura y libre de discriminación. Trabajamos para fomentar la aceptación, la comprensión y el respeto mutuo, promoviendo así comunidades más equitativas y compasivas",isExpanded: false),
    Item(title: "Valores",expanded: ["Inclusividad: Creemos en la diversidad de las experiencias sexuales y de género y nos esforzamos por ser una organización inclusiva que acoge a todas las personas, independientemente de su identidad o orientación sexual.", "Respeto: Valoramos y respetamos la autonomía y la dignidad de cada individuo. Buscamos crear un entorno donde todos se sientan seguros para expresar su identidad y orientación sexual sin temor al juicio o la discriminación.", "Educación: Abogamos por la educación como herramienta fundamental para la comprensión y la aceptación. Proporcionamos recursos educativos basados en evidencia para aumentar la conciencia y desafiar los estigmas asociados con diversas orientaciones sexuales."],isExpanded: false),
    Item(title: "Equipo",expanded: [Miembro(nombre: "Sujeto 1",ocupacion: "Administrador de empresas",responsabilidad: "Administrador",foto: "assets/images/miembro.jpg"),Miembro(nombre: "Sujeto 1",ocupacion: "Administrador de empresas",responsabilidad: "Abogado",foto: "assets/images/miembro.jpg")],isExpanded: false),
    Item(title: "Aliados",expanded: [Aliado(nombre: "Organizacion 1", foto: "assets/images/aliado.jpg"),Aliado(nombre: "Organizacion 1", foto: "assets/images/aliado.jpg")],isExpanded: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Quienes somos',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*(0.05)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset("assets/images/logo.png"),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text("Soy Warmi es una organizacion dedicada a promover la Educacion en Sexualidad Integral (ESI) en jóvenes en Bolivia",style:TextStyle(                                        fontSize: 14,
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.5)),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: _aboutUsExpasionPanel(),
              ),
              Container(
                child: Column(children: [
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
                ]),
              )
            ],
          ),
        ),
      )
    );
  }
  Widget _aboutUsExpasionPanel(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState((){
          _listaItems[index].isExpanded = isExpanded;
        });
      },
      children: _listaItems.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded){
              return ListTile(
                title: Text(item.title,style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColorDark.withOpacity(0.5)),),
              );
            },
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
              child: (item.expanded is List<String>)
                  ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0,right: 20,left: 20),
                    child: Column(
                children: (item.expanded as List<String>).map((value) {
                    return ListTile(
                      minLeadingWidth : 10,
                      leading: const Icon(Icons.fiber_manual_record,size: 12),
                      title: Text(
                        value, style: TextStyle(fontSize:14,color: Theme.of(context)
                          .primaryColorDark
                          .withOpacity(0.5))
                      ),
                    );
                }).toList(),
              ),
                  )
                  :(item.expanded is List<Miembro>)
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: (item.expanded as List<Miembro>).map((value) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(value.foto),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(value.nombre,style: TextStyle(fontSize:14,color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.5)),),
                                Text(value.ocupacion,style: TextStyle(fontSize:14,color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.5))),
                                Text(value.responsabilidad,style: TextStyle(fontSize:14,color: Theme.of(context)
                                    .primaryColorDark
                                    .withOpacity(0.5)))
                              ],
                            ),
                          )

                        ],
                      ),
                    );
                  }).toList(),
                ),
              ):(item.expanded is List<Aliado>)
                  ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: (item.expanded as List<Aliado>).map((value) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(value.foto),
                            ),
                            Text(value.nombre,style: TextStyle(color: Theme.of(context)
                                .primaryColorDark
                                .withOpacity(0.5)),),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ): Padding(
                padding: const EdgeInsets.only(bottom: 10.0,right: 20,left: 20),
                child: ListTile(
                  title: Center(
                    child: Text(
                      item.expanded,
                      style: TextStyle(fontSize: 14,color: Theme.of(context)
                          .primaryColorDark
                          .withOpacity(0.5)),
                    ),
                  ),
                ),
              ),
            ),
            isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }
}
class Item{
  dynamic expanded;
  String title;
  bool isExpanded;
  Item({required this.expanded,required this.title,required this.isExpanded});
}
class Miembro{
  String nombre;
  String responsabilidad;
  String ocupacion;
  String foto;
  Miembro({required this.nombre,required this.responsabilidad,required this.ocupacion,required this.foto});
}
class Aliado{
  String nombre;
  String foto;
  Aliado({required this.nombre,required this.foto});
}
