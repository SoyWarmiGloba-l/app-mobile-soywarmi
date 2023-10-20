import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/page/home_page.dart';
import 'package:soywarmi_app/presentation/page/posts_page.dart';
import 'package:soywarmi_app/presentation/page/specialists_page.dart';
import 'package:soywarmi_app/presentation/widget/custom_app_bar.dart';
import 'package:soywarmi_app/presentation/widget/custom_bottom_navigator_bar.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List<String> _titles = [
  'SoyWarmi',
  'Hospitales',
  'Especialistas',
  'Posts',
  'Chats',
];

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: _titles[_selectedIndex],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomePage(),
            Text('Hospitales'),
            SpecialistsPage(),
            PostPage(),
            Text('Chat'),
          ],
        ),
        floatingActionButton: _selectedIndex == 3 ? _newPosy : null,
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

final Widget _newPosy = FloatingActionButton(
  backgroundColor: NBPrimaryColor,
  onPressed: () {},
  child: const Icon(
    Icons.add,
    color: NBColorWhite,
  ),
);
