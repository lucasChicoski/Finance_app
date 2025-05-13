class ExpenseInstallmentDTO {
  String descricaoDespesa;
  double valorGasto;
  double parcela;
  int qParcela;
  int userId;
  String date;
  int? id;

  ExpenseInstallmentDTO({
    required this.descricaoDespesa,
    required this.parcela,
    required this.qParcela,
    required this.valorGasto,
    required this.userId,
    required this.date,
    this.id,
  });

  factory ExpenseInstallmentDTO.fromJson(Map<String, dynamic> json) {
    return ExpenseInstallmentDTO(
      id: json['id'],
      userId: int.parse(json["id_user"].toString()),
      descricaoDespesa: json["descricao_despesa"],
      parcela: double.parse(json["parcela"].toString()),
      qParcela: int.parse(json["quantidade_parcela"].toString()),
      valorGasto: double.parse(json["valor_gasto"].toString()),
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "descricao_despesa": descricaoDespesa,
      "valor_gasto": valorGasto,
      "quantidade_parcela": qParcela,
      "parcela": parcela,
      "id_user": userId,
      "date": date
    };
  }
}
