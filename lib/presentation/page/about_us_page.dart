import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

import '../../utilities/nb_colors.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<Item> _listaItems=[
    Item(title: "Mision",expanded: "Somos Soy Warmi, una organización juvenil sin fines de lucro conformada dedicada a promover la educación sexual integral. Desarrolladores del proyecto Warmi Ambassadors. Nuestra misión es romper tabúes y prevenir enfermedades de transmisión sexual, así como embarazos no deseados. Trabajamos para empoderar a las comunidades vulnerables, especialmente en zonas rurales de América Latina.",isExpanded: false),
    Item(title: "Valores",expanded: ["Inclusividad: Creemos en la diversidad de las experiencias sexuales y de género y nos esforzamos por ser una organización inclusiva que acoge a todas las personas, independientemente de su identidad o orientación sexual.", "Respeto: Valoramos y respetamos la autonomía y la dignidad de cada individuo. Buscamos crear un entorno donde todos se sientan seguros para expresar su identidad y orientación sexual sin temor al juicio o la discriminación.", "Educación: Abogamos por la educación como herramienta fundamental para la comprensión y la aceptación. Proporcionamos recursos educativos basados en evidencia para aumentar la conciencia y desafiar los estigmas asociados con diversas orientaciones sexuales."],isExpanded: false),
    Item(
        title: "Equipo",
        expanded: [
          Miembro(nombre: "Valentina Wiñay Quispe",ocupacion: "¡Hola! Soy Vale de Bolivia, Aymara, activista por la equidad de género y promotora de la ESI.",foto: Images.NBWarmiLogo),
          Miembro(nombre: "Arly Carrillo Plasencia",ocupacion: "¡Hola! Soy Arly de Lima, Perú. Una líder altruista y perspicaz que le apasiona la justicia social y el activismo por la educación de calidad en todas las áreas de conocimiento.",foto: Images.imgMemberArlyCarrillo),
          Miembro(nombre: "Fernanda",ocupacion: "¡Hola! Soy Fernanda de La Paz, Bolivia. Apasionada por la lectura y los negocios, busco impulsar el empoderamiento económico y la expansión de oportunidades comerciales para las mujeres.",foto: Images.imgMemberFernanda),
          Miembro(nombre: "Nicole Nahomi Yañez Vasquez",ocupacion: " ¡Hola! Soy Nicole, de La Paz, Bolivia. Soy una activista enamorada del ambientalismo y de la justicia climática pero en especial del reciclaje.",foto: Images.imgMemberNicoleYaniez),
          Miembro(nombre: "Hilary",ocupacion: "Hola, soy Hilary! Soy una estudiante de Lima, Perú, me apasiona formar parte de voluntariados y crear lazos con los que lo conforman.",foto: Images.imgMemberHilary),
          Miembro(nombre: "Diego",ocupacion: "Hola, soy Diego! Soy una persona apasionada por la música y el voluntariado, sueño con que el mundo sea un lugar mejor para las siguientes generaciones.",foto: Images.imgMemberDiego),
          Miembro(nombre: "Alan Sandi",ocupacion: "Soy Alan Sandi, tengo 19 años y soy estudiante de Derecho, orientando mis esfuerzos para la deconstrucción hacia una sociedad más tolerante y diversa.",foto: Images.imgMemberAlanSandi),
          Miembro(nombre: "Mari",ocupacion: "Hola a todes, soy Mari, soy una acuariana que ama compartir un pedacito de alma, vida y corazón con sus personas especiales y a causas que valen la pena.",foto: Images.imgMemberMary),
        ],
        isExpanded: false),

    Item(
        title: "Aliados",
        expanded: [
          Aliado(nombre: "Embajada USA",descripcion: "Reconocidos como uno de los proyectos impulsados por la Embajada de USA.", foto: Images.img_usa_allie),
          Aliado(nombre: "Pollination Project",descripcion: "Ganadores del premio de The Pollination Project.", foto: Images.img_pollination_p_allie),
          Aliado(nombre: "World learning",descripcion: "Impulsados por World Learning.", foto: Images.img_world_l_allie)
        ],isExpanded: false),
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
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(Images.logo),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text("Soy Warmi es una organizacion dedicada a promover la Educacion en Sexualidad Integral (ESI) en jóvenes en Bolivia",style:TextStyle(                                        fontSize: 14,
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.5)),),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: _aboutUsExpasionPanel(),
              ),
             const SizedBox(height: 100,),
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
                          Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),child: Image.asset(value.foto,height: 150),),
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
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(padding:const EdgeInsets.only(bottom: 10),decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),child: Image.asset(value.foto,height: 150),),
                            Text(value.descripcion,style: TextStyle(color: Theme.of(context)
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
  String ocupacion;
  String foto;
  Miembro({required this.nombre,required this.ocupacion,required this.foto});
}
class Aliado{
  String nombre;
  String descripcion;
  String foto;
  Aliado({required this.nombre,required this.descripcion,required this.foto});
}
