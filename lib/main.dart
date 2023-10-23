import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soywarmi_app/presentation/page/edit_profile_page.dart';
import 'package:soywarmi_app/presentation/page/main_page.dart';
import 'package:soywarmi_app/presentation/page/login_page.dart';
import 'package:soywarmi_app/presentation/page/new_post_page.dart';
import 'package:soywarmi_app/presentation/page/notifications_page.dart';
import 'package:soywarmi_app/presentation/page/password_reset_page.dart';
import 'package:soywarmi_app/presentation/page/profile_user_page.dart';
import 'package:soywarmi_app/presentation/page/register_page.dart';
import 'package:soywarmi_app/utilities/app_theme_data.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => AnimatedSplashScreen(
              duration: 1500,
              splash: NBWarmiLogo,
              splashIconSize: 100,
              splashTransition: SplashTransition.slideTransition,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              nextScreen: const _FirstPage(),
            ),
        '/register': (context) => const RegisterPage(),
        '/forgot_password': (context) => const PasswordResetPage(),
        '/home': (context) => const MainPage(),
        '/profile': (context) => const ProfileUserPage(),
        '/edit_profile': (context) => const EditProfilePage(),
        '/new_post': (context) => const NewPostPage(),
        '/notifications': (context) => const NotificationsPage(),
      },
    );
  }
}

class _FirstPage extends StatelessWidget {
  const _FirstPage();

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
