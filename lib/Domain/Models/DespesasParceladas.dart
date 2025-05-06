import 'package:scaffold_project/Domain/DTO/expense_v2.dart';

class DespesasAgrupadas {
  int ano = 0;
  List<ItensMeses> month = [];


  DespesasAgrupadas(dynamic value) {
    ano = value["ano"];   

    for (var element in value["meses"]) {
      setItensMese(element);
    }
  }

  setItensMese(dynamic value) {
    ItensMeses itensMese = ItensMeses(value);
    month.add(itensMese);
  }
}

class ItensMeses {
  int mes = 0;
  List<Expensev2DTO> itens = [];


  ItensMeses(dynamic value){
      mes = value["mes"];

      for (var element in value["itens"]) {
        itens.add(Expensev2DTO.fromJSON(element));
      }
  }

}
