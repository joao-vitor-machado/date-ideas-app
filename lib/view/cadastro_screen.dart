import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_bloc.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_event.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_state.dart';
import 'package:trabalho_fibal_mob_2022/bloc/manage_submission.dart';
import 'package:trabalho_fibal_mob_2022/model/login.dart';
import 'package:trabalho_fibal_mob_2022/view/preferencias_screen.dart';
import 'package:trabalho_fibal_mob_2022/widgets/slider_bar_widget.dart';

class CadastroScreen extends StatelessWidget {
  static const route = "/cadastro";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final LoginData loginData = LoginData();

  final SliderBar sliderBar = const SliderBar();

  CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: ListView(
              children: [
                cabecalho(context, "Bora para um"),
                cabecalho(context, "DATE?"),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        titulo(context, "Nome"),
                        nameFormField(context),
                        titulo(context, "Idade"),
                        sliderBar,
                        const SizedBox(
                          height: 20,
                        ),
                        titulo(context, "Username"),
                        usernameFormField(context),
                        titulo(context, "Senha"),
                        passwordFormField(context),
                        submitButton(context),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget nameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    return Column(
      children: [
        BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) =>
                state.isValidName ? null : 'Insira um nome válido',
            onChanged: (value) =>
                context.read<LoginBloc>().add(LoginNameChanged(name: value)),
            // onSaved: (String? inValue) {
            //   loginData.name = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "Example Name",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget usernameFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) =>
                state.isValidUsername ? null : 'Insira um username válido',
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginUsernameChanged(username: value)),
            // onSaved: (String? inValue) {
            //   loginData.username = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "Username",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget passwordFormField(BuildContext context) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return TextFormField(
            obscureText: true,
            validator: (value) => state.isValidPassword
                ? null
                : 'Sua senha deve ter no mínimo 6 caracteres',
            onChanged: (value) => context
                .read<LoginBloc>()
                .add(LoginPasswordChanged(password: value)),
            // onSaved: (String? inValue) {
            //   loginData.password = inValue ?? "";
            // },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: tema.primary,
              )),
              hintText: "******",
            ),
          );
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              child: Container(
                width: 100,
                height: 40,
                child: Row(
                  children: const [
                    Text("Próximo"),
                    SizedBox(
                      width: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                  Navigator.pushNamed(context, PreferenciasScreen.route);
                }
              },
            );
    });
  }

  Widget cabecalho(BuildContext context, String cabecalho) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cabecalho,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: tema.primary)),
      ],
    );
  }

  Widget titulo(BuildContext context, String titulo) {
    final tema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            titulo,
            style: TextStyle(fontSize: 20, color: tema.primary),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
