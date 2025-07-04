import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Widgets/alert/custom_alert_edit_expense.dart';
import 'package:scaffold_project/Presentation/store/expense_store.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

ExpenseStore _expenseStore = GetIt.I<ExpenseStore>();

class ItemListWidget extends StatelessWidget {
  final Color? color;
  final String
      waySpent; //qual foi a forma do gasto. Cartão nubank, Registro do app
  final String descriptionSpent;
  final double valueSpent;
  final int? id;
  final String hash;

  const ItemListWidget({
    super.key,
    required this.waySpent,
    required this.descriptionSpent,
    required this.valueSpent,
    this.id,
    required this.hash,
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
                    onPressed: () => alert(context, hash, item: descriptionSpent),
                    icon: Icon(
                      Icons.edit,
                      color: quartaryColro,
                    )),
                IconButton(
                    onPressed: () => _expenseStore.deleteExpense(hash),
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
