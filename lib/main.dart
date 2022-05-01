import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final tema = ThemeData(
    brightness: Brightness.light
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.route,
      routes: {
        LoginScreen.route : (context) => const LoginScreen(),
        MainScreen.route  : (context) => const MainScreen(),
      },
      title: 'Flutter Demo',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Color.fromRGBO(177, 0, 255, 1),
          secondary: Colors.white,
          tertiary: Colors.grey,
        )
      ),
    );
  }
}


