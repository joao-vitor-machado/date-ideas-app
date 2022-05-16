import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/switch_bloc/switch_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/switch_bloc/switch_state.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';
import 'view/cadastro_screen.dart';
import 'view/preferencias_screen.dart';
import 'view/editar_perfil_screen.dart';
import 'view/editar_preferencias_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => SwitchBloc(SwitchState())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(builder: ((context, state) {
      return MaterialApp(
        initialRoute: LoginScreen.route,
        routes: {
          LoginScreen.route: (context) => const LoginScreen(),
          MainScreen.route: (context) => const MainScreen(),
          CadastroScreen.route: (context) => CadastroScreen(),
          PreferenciasScreen.route: (context) => PreferenciasScreen(),
          EditarPerfilScreen.route: (context) => EditarPerfilScreen(),
          EditarPreferenciasScreen.route: (context) =>
              EditarPreferenciasScreen(),
        },
        title: 'Flutter Demo',
        theme: tema.copyWith(
            brightness: Brightness.light,
            colorScheme: tema.colorScheme.copyWith(
              primary: Color.fromRGBO(177, 0, 255, 1),
              secondary: Colors.white,
              tertiary: Colors.grey,
              background: Colors.white,
            )),
        themeMode: BlocProvider.of<SwitchBloc>(context).state.selected == true
            ? ThemeMode.dark
            : ThemeMode.light,
        darkTheme: tema.copyWith(
          brightness: Brightness.dark,
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.blueAccent,
            secondary: Colors.white,
            tertiary: Colors.white,
            background: Colors.black,
          ),
        ),
        //themeMode: ThemeMode.dark,
      );
    }));
  }
}
