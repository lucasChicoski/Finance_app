import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';

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
  List<ExpenseDTO> itens = [];


  ItensMeses(dynamic value){
      mes = value["mes"];

      for (var element in value["itens"]) {
        itens.add(ExpenseDTO.fromJSON(element));
      }
  }

}
