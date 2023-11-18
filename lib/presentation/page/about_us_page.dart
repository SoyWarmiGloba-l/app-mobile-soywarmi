import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<Item> _listaItems=[
    Item(title: "Mision",expanded: "Valor 1, Valor 2, Valor 3",isExpanded: false),
    Item(title: "Valores",expanded: "Valor 1, Valor 2, Valor 3",isExpanded: false),
    Item(title: "Equipo",expanded: "Valor 1, Valor 2, Valor 3",isExpanded: false),
    Item(title: "Aliados",expanded: "Valor 1, Valor 2, Valor 3",isExpanded: false),
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
                child: _aboutUsExpasionPanel(),
              ),
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
                title: Text(item.title,style: TextStyle(                                        fontSize: 14,
                    color: Theme.of(context)
                        .primaryColorDark
                        .withOpacity(0.5)),),
              );
            },
            body: ListTile(
              title: (item.expanded.runtimeType == List<String>) ?
              ListView.builder(
                itemCount: item.expanded.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.fiber_manual_record),
                    title: Text(item.expanded[index],style: TextStyle(                                        fontSize: 14,
                    ),),
                  );
                },
              ):
              Text(item.expanded,style: TextStyle(                                        fontSize: 14,
                  color: Theme.of(context)
                      .primaryColorDark
                      .withOpacity(0.5)),),
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
