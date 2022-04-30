import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset("logo_v1.png")),
              Text("Snacks n' Date"),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Form(child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "username"
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "password"
                ),
              ),


            ],
          ))
        ],
      )
    );
  }
}
