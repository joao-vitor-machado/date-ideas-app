import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_fibal_mob_2022/view/new_date_dialog.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_card.dart';
import 'package:trabalho_fibal_mob_2022/model/mock/dates_mock.dart';
import 'package:trabalho_fibal_mob_2022/widgets/date_tile.dart';
import 'package:trabalho_fibal_mob_2022/widgets/drawer_widget.dart';

class MainScreen extends StatelessWidget {
  static const route = "/mainScreen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context).colorScheme;
    final screen = MediaQuery.of(context).size;

    Widget renderDateCards() {
      List<int> indexes = [];
      for (int i = 0; i < DateMock.dates.length; i++) {
        if (DateMock.dates[i].data.month == DateTime.now().month &&
            DateMock.dates[i].data.day == DateTime.now().day) {
          indexes.add(i);
        }
      }
      if (indexes.length > 0) {
        return CarouselSlider(
            options: CarouselOptions(autoPlay: false),
            items: indexes
                .map((index) => DateCard(dateApp: DateMock.dates[index]))
                .toList());
      } else {
        return Container(
          // height: screen.height * 0.3,
          child: const Center(
            child: Text("Nenhum date hoje ;-;"),
          ),
        );
      }
    }

    newDateDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return NewDateDialog();
          });
    }

    return Scaffold(
      drawer: DrawerWidget(),
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
              child: Text(
                "Olá, Fulano!",
                style: TextStyle(
                    color: tema.primary,
                    fontFamily: "Roboto",
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Dates de hoje:",
                style: TextStyle(
                    color: tema.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: screen.height * 0.35, child: renderDateCards()),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Próximos Dates:",
                    style: TextStyle(
                        color: tema.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () => newDateDialog(),
                    child: Text(
                      "Novo Date +",
                      style: TextStyle(color: tema.secondary),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: tema.primary,
                        minimumSize: Size(60, 40)),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: screen.width * 0.9,
                height: screen.height * 0.35,
                child: ListView(
                  children: DateMock.dates
                      .map((element) => DateTile(dataApp: element))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
