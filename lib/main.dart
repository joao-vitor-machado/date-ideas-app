import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';

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
      initialRoute: "/",
      routes: {
        LoginScreen.route : (context) => const LoginScreen(),
      },
      title: 'Flutter Demo',
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.white,
          tertiary: Colors.grey,
        )
      ),
    );
  }
}


