import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/page/home_page.dart';
import 'package:soywarmi_app/presentation/widget/custom_app_bar.dart';
import 'package:soywarmi_app/presentation/widget/custom_bottom_navigator_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomePage(),
            Text('Hospitales'),
            Text('Medicos'),
            Text('Blog'),
            Text('Chat'),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
