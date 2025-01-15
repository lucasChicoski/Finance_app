
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
  int userId;
  int? expenseInstallmentId;
  int year;
  int idCategory;
  //metodos

  ExpenseDTO({
    required this.year,
    required this.hash,
    required this.descricaoDespesa,
    required this.month,
    required this.tipoDespesa,
    required this.valorGasto,
    required this.date,
    required this.isDivided,
    required this.userId,
    required this.idCategory,
    this.prestacoes,
    this.parcela,
    this.expenseInstallmentId,
  });

  factory ExpenseDTO.fromJSON(Map<String, dynamic> json) {
    return ExpenseDTO(
      year: int.parse(json["year"].toString()),
      expenseInstallmentId:
          int.tryParse(json['id_despesas_parceladas'].toString()),
      userId: int.parse(json['id_user'].toString()),
      isDivided: bool.parse(json["is_divided"].toString()),
      date: DateTime.parse(json["date"].toString()),
      hash: json["hash"],
      descricaoDespesa: json["descriptionSpent"] ?? json["descricao_despesa"],
      month: int.parse(json["month"].toString()),
      parcela: int.parse(json["parcela"].toString()), //pode dar erro
      prestacoes: double.parse(json["prestacoes"].toString()), //possível erro,
      tipoDespesa: json["tipo_despesa"],
      valorGasto: double.parse(json["valor_gasto"].toString()),
      idCategory: int.parse(json["id_category"].toString()),
    ); //pode dar erro
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
      "date": Global.getDate().toString(),
      "id_user": userId,
      "id_despesas_parceladas": expenseInstallmentId,
      "year": year,
      "category_id": idCategory
    };
  }
}
