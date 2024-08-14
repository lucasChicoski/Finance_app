class ExpenseInstallmentDTO {
  String descricaoDespesa;
  double valorGasto;
  double prestacoes;
  int qParcela;
  int userId;
  int? id;

  ExpenseInstallmentDTO({
    required this.descricaoDespesa,
    required this.prestacoes,
    required this.qParcela,
    required this.valorGasto,
    required this.userId,
    this.id,
  });

  factory ExpenseInstallmentDTO.fromJson(Map<String, dynamic> json) {
    return ExpenseInstallmentDTO(
      id: json['id'],
      userId: int.parse(json["user_id"].toString()),
      descricaoDespesa: json["descricao_despesa"],
      prestacoes: double.parse(json["prestacoes"].toString()),
      qParcela: int.parse(json["parcela"].toString()),
      valorGasto: double.parse(json["valor_gasto"].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "description_spent": descricaoDespesa,
      "value_spent": valorGasto,
      "prestacoes": prestacoes,
      "parcela": qParcela,
      "user_id": userId,
    };
  }
}
