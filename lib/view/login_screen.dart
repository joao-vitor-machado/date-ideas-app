import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const route = "/";
  const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final tema = Theme.of(context).colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset("logo_v1.png")),
                Text("Snacks n' Date",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 40,
                  color: tema.primary,
                ),),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: screen.size.width * 0.8,
              child: Form(child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tema.primary),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      prefixIcon: Icon(Icons.account_circle),
                      labelText: "username",
                      border: OutlineInputBorder()

                    ),
                  ),
                  SizedBox(
                    height: screen.size.height * 0.02,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:  BorderSide(color: tema.primary, width: 0.0),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      labelText: "password",
                      border: OutlineInputBorder()
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("Não possui cadastro ainda?",
                          style: TextStyle(color: Colors.lightBlue),),
                        )),
                  ),
                ],
              )),
            ),


          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: tema.primary,
                    minimumSize: const Size(
                        200, 50
                    )
                ),
                child: Text("Login",
                  style: TextStyle(
                      color: tema.secondary
                  ),),
                onPressed: (){}),
          ],
        ),
      ),
    );
  }
}
