import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Mock/items_gasto_mock.dart';
import 'package:scaffold_project/Presentation/store/financial_store.dart';
import 'package:scaffold_project/Presentation/Widgets/alert/custom_alert.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

FinancialStore _financialStore = GetIt.I<FinancialStore>();

class ItemListWidget extends StatelessWidget {
  final Color? color;
  final String
      waySpent; //qual foi a forma do gasto. Cartão nubank, Registro do app
  final String descriptionSpent;
  final double valueSpent;
  final String id;

  const ItemListWidget({
    super.key,
    required this.waySpent,
    required this.descriptionSpent,
    required this.valueSpent,
    required this.id,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      // color: Colors.blue,
      height: 70,
      child: Row(
        children: [
          Container(
            width: 10,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              // color: Colors.indigo,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    waySpent,
                    style: TextStyle(
                        color: quartaryColro, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(descriptionSpent,
                      style: TextStyle(
                          color: quartaryColro, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          Container(
            // width: 100,
            padding: const EdgeInsets.all(10),
            // color: Colors.orange,
            child: Text(
              "R\$ $valueSpent",
              style:
                  TextStyle(color: quartaryColro, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 96,
            // color: Colors.lime,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => alert(context, item: descriptionSpent),
                    icon: Icon(
                      Icons.edit,
                      color: quartaryColro,
                    )),
                IconButton(
                    onPressed: () {
                      // _financialStore.deleteExpense(id);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: quartaryColro,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleList extends StatelessWidget {
  final String title;
  const TitleList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, bottom: 15),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: terciaryColor),
      ),
    );
  }
}

//-----------------------------------Construção da lista
//Mover para camada de Seriço

class ItensListFactory {
  String month;
  List<Map<String, dynamic>> itens;

  ItensListFactory({this.month = '', required this.itens});

  factory ItensListFactory.fromJson(Map<String, dynamic> json) {
    return ItensListFactory(itens: json["itens"], month: json["month"]);
  }
}

//Construção da lista (OLD)
List<Widget> constructList() {
  List<Widget> x = [];

  Iterable<ItensListFactory> list =
      itens.map((e) => ItensListFactory.fromJson(e));

  //Primeiro loop - mês.
  for (var element in list) {
    x.add(TitleList(
      title: element.month,
    ));

    //itens do mês
    for (var elements in element.itens) {
      x.add(ItemListWidget(
        descriptionSpent: elements["title"],
        valueSpent: double.parse(elements["value"]),
        id: elements["id"],
        waySpent: elements["waySpent"],
      ));
    }
    x.add(const SizedBox(
      height: 30,
    ));
  }
  return x;
}
