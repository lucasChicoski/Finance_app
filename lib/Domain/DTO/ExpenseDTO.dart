import 'package:scaffold_project/Utils/functions_helpers.dart';

class ExpenseDTO {
  //atritutos
  String hash;
  int month;
  double valorGasto;
  String descricaoDespesa;
  String tipoDespesa;
  double? prestacoes;
  int? parcela;
  DateTime date;
  bool isDivided;
  //metodos

  ExpenseDTO({
    required this.hash,
    required this.descricaoDespesa,
    required this.month,
    required this.tipoDespesa,
    required this.valorGasto,
    required this.date,
    required this.isDivided,
    this.prestacoes,
    this.parcela,
  });

  factory ExpenseDTO.fromJSON(Map<String, dynamic> json) {
    return ExpenseDTO(
        isDivided: json["is_divided"] is bool
            ? json["is_divided"]
            : bool.parse(json["is_divided"]),
        date: json["date"] is DateTime
            ? json["date"]
            : DateTime.parse(json["date"]),
        hash: json["hash"],
        descricaoDespesa: json["descriptionSpent"] ?? json["descricao_despesa"],
        month: json["month"] is int ? json["month"] : int.parse(json["month"]),
        parcela: json["parcela"] is int
            ? json["parcela"]
            : int.parse(json["parcela"]), //pode dar erro
        prestacoes: json["prestacoes"] is double
            ? json["prestacoes"]
            : double.parse(json["prestacoes"]), //possível erro,
        tipoDespesa: json["tipo_despesa"],
        valorGasto: json["valor_gasto"] is double
            ? json["valor_gasto"]
            : double.parse(json["valor_gasto"])); //pode dar erro
  }

  Map<String, dynamic> toJSON() {
    return {
      "hash": hash,
      "descriptionSpent": descricaoDespesa,
      "month": month,
      "parcela": parcela,
      "prestacoes": prestacoes,
      "tipo_despesa": tipoDespesa,
      "valueSpent": valorGasto,
      "is_divided": isDivided,
      "date": Global.getDate()
    };
  }
}
