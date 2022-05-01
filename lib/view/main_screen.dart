import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_card.dart';
import 'package:trabalho_fibal_mob_2022/model/mock/dates_mock.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_tile.dart';

class MainScreen extends StatelessWidget {
  static const route = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    var itemsMenu = [
      ListTile(
          title: Text("Editar Preferências", style: TextStyle(color: tema.primary, fontSize: 20),),
          trailing: Icon(
            Icons.toggle_on,
            color: Colors.deepPurple,
          ),

      ),
      ListTile(
        title: Text("Editar Perfil", style: TextStyle(color: tema.primary, fontSize: 20)),
          trailing: Icon(Icons.account_circle_outlined, color: Colors.deepPurple,)

      ),
      ListTile(
        title: Text("Modo Escuro", style: TextStyle(color: tema.primary, fontSize: 20)),
          trailing: Switch(
            value: false,
            onChanged: (value){},
          ),
      ),
    ];


    Widget renderDateCards(){
      List<int> indexes = [];
      for(int i=0; i<DateMock.dates.length; i++){
        if(DateMock.dates[i].data.month == DateTime.now().month && DateMock.dates[i].data.day == DateTime.now().day){
          indexes.add(i);
        }
      }
      if(indexes.length > 0){
        return CarouselSlider(
            options: CarouselOptions(
                autoPlay: false
            ),
            items: indexes.map((index) => DateCard(dateApp: DateMock.dates[index])).toList()
        );

      }else{
        return Container(
          height: screen.height * 0.3,
          child: Center(
            child: Text("Nenhum date hoje ;-;"),
          ),
        );
      }
    }

    return Scaffold(
      drawer: Container(
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
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: tema.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Olá, Fulano!",
              style: TextStyle(
                color: tema.primary,
                fontFamily: "Roboto",
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Dates de hoje:",
              style: TextStyle(
                color: tema.primary,
                fontSize: 24,
                fontWeight: FontWeight.w700
              ),),
            ),
            renderDateCards(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20 ,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Próximos Dates:",
                    style: TextStyle(
                        color: tema.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700
                    ),),
                  TextButton(
                    onPressed: (){},
                    child: Text("Novo Date +",
                        style: TextStyle(color: tema.secondary),),
                    style: TextButton.styleFrom(
                      backgroundColor: tema.primary,
                      minimumSize: Size(60, 40)
                    ),

                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: screen.width * 0.9,
                height: screen.height * 0.35,
                child: ListView(
                  children: DateMock.dates.map((element) => DateTile(nomeDate: element.nome, dataDate: element.data)).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
