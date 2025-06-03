import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/store/financial_divided_store.dart';
import 'package:scaffold_project/Presentation/store/list_expense_installments_store.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

FinancialDividedViewModel _financialDividedViewModel =
    GetIt.I<FinancialDividedViewModel>();

ListExpenseInstallmentsStore _listExpenseInstallmentsStore =
    GetIt.I<ListExpenseInstallmentsStore>();

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  void initState() {
    _financialDividedViewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secundaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 15,
          ),
          Text('Lista de Despesas',
              style: TextStyle(
                  color: quartaryColro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: terciaryColor, borderRadius: BorderRadius.circular(5)),
            child: Table(
              children: [RowHeader.header()],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Table(
            children: _listExpenseInstallmentsStore.listExpenseInstallments
                .asMap()
                .entries
                .map((e) => RowOfTable(
                        e.value.descricaoDespesa,
                        e.value.qParcela,
                        e.value.valorGasto, e.value.parcela, 'hash1', e.key )
                    .row())
                .toList(),
            
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class RowHeader {
  static TableRow header() {
    return TableRow(
      children: [
        Center(
            child: Text(
          'Item',
          style: TextStyle(
              color: secundaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        )),
        Center(
            child: Text(
          'Valor Total',
          style: TextStyle(
              color: secundaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        )),
        Center(
            child: Text(
          'Prestações',
          style: TextStyle(
              color: secundaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        )),
        Center(
            child: Text(
          'Parcela',
          style: TextStyle(
              color: secundaryColor, fontWeight: FontWeight.bold, fontSize: 15),
        )),
      ],
    );
  }
}

class RowOfTable {
  String description;
  double valueSpent;
  int qParcela;
  double valueParcela;
  String hash;
  int? indexItem;

  RowOfTable(this.description, this.qParcela, this.valueParcela,
      this.valueSpent, this.hash, this.indexItem);

  TableRow row() {
    return TableRow(
      // decoration:BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, ))),
      children: [
        GestureDetector(
          onTap: () {
            print('Item Cliclado: ${indexItem.toString()}');
          },
          child: Center(
              child: Text(description,
                  style: TextStyle(
                      color: quartaryColro, overflow: TextOverflow.ellipsis))),
        ),
        GestureDetector(
          child: Center(
              child: Text('R\$ ${valueSpent.toString()}',
                  style: TextStyle(color: quartaryColro))),
        ),
        GestureDetector(
          child: Center(
              child: Text('${qParcela.toString()}X',
                  style: TextStyle(color: quartaryColro))),
        ),
        GestureDetector(
          child: Center(
              child: Text('R\$ ${valueParcela.toString()}',
                  style: TextStyle(color: quartaryColro))),
        ),
      ],
    );
  }
}
