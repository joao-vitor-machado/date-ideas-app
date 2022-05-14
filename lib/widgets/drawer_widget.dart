import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/editar_perfil_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/editar_preferencias_screen.dart';
import 'package:trabalho_fibal_mob_2022/view/login_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    var itemsMenu = [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, EditarPreferenciasScreen.route),
        child: ListTile(
          title: Text("Editar Preferências", style: TextStyle(color: tema.primary, fontSize: 20),),
          leading: Icon(
            Icons.favorite,
            color: tema.primary,
          ),

        ),
      ),
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, EditarPerfilScreen.route),
        child: ListTile(
            title: Text("Editar Perfil", style: TextStyle(color: tema.primary, fontSize: 20)),
            leading: Icon(Icons.person, color: tema.primary,)

        ),
      ),
      ListTile(
        title: Text("Modo Escuro", style: TextStyle(color: tema.primary, fontSize: 20)),
        leading: Icon(
          Icons.dark_mode,
          color: tema.primary,
        ),
        trailing: Switch(
          value: false,
          onChanged: (value){},
        ),
      ),
    ];

    return Container(
      width: screen.width * 0.8,
      color: tema.secondary,
      child: Column(
        children: [
          Container(
            color: tema.primary,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Icon(
                        Icons.arrow_back,
                        color: tema.secondary,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Settings",
                          style: TextStyle(
                              color: tema.secondary,
                              fontSize: 32,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(width: 5,),
                        Icon(Icons.settings, color: tema.secondary, size:40,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView(
              children: ListTile.divideTiles(
                  color: tema.tertiary,
                  context: context,
                  tiles: itemsMenu.map((e) => ListTile(
                      title: e
                  )
                  )).toList(),
            ),
          ),
          SizedBox(
            height: screen.height * 0.18  ,
          ),
          Container(
            width: screen.width * 0.7,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, LoginScreen.route),
              child: ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Logout", style: TextStyle(color: Colors.red, fontSize: 20)),
                    SizedBox(width: 5,),
                    Icon(Icons.logout, color: Colors.red,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
