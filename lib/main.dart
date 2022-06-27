import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/auth_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/auth_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/monitor_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/storage_state.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';
import 'bloc/slider_bloc.dart';
import 'bloc/slider_state.dart';
import 'view/cadastro_screen.dart';
import 'view/preferencias_screen.dart';
import 'view/editar_perfil_screen.dart';
import 'view/editar_preferencias_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<MonitorBloc>(create: (_) => MonitorBloc()),
    BlocProvider<StorageBloc>(create: (_) => StorageBloc()),
    BlocProvider<SliderBloc>(
      create: (_) => SliderBloc(SliderState()),
    ),
    BlocProvider(create: (_) => AuthBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final tema = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          // LoginScreen.route: (context) => const LoginScreen(),
          MainScreen.route: (context) => const MainScreen(),
          CadastroScreen.route: (context) => CadastroScreen(),
          PreferenciasScreen.route: (context) => PreferenciasScreen(),
          EditarPerfilScreen.route: (context) => EditarPerfilScreen(),
          EditarPreferenciasScreen.route: (context) =>
              EditarPreferenciasScreen(),
        },
        title: 'Flutter Demo',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Color.fromRGBO(177, 0, 255, 1),
            secondary: Colors.white,
            tertiary: Colors.grey,
          ),
        ),
        home: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthError) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Erro do Firebase"),
                    content: Text(state.message),
                  );
                });
          }
        }, builder: ((context, state) {
          if (state is Authenticated) {
            return MainScreen();
          } else {
            return LoginScreen();
          }
        })));
  }
}
