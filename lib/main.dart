import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';
import 'view/cadastro_screen.dart';
import 'view/preferencias_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final tema = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/preferencias",
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        CadastroScreen.route: (context) => CadastroScreen(),
        PreferenciasScreen.route: (context) => PreferenciasScreen(),
      },
      title: 'Flutter Demo',
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
        primary: Colors.deepPurpleAccent,
        secondary: Colors.white,
        tertiary: Colors.grey,
      )),
    );
  }
}
