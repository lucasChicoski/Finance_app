class ExpenseInstallmentDTO {
  String descricaoDespesa;
  double valorGasto;
  double prestacoes;
  int qParcela;

  ExpenseInstallmentDTO({
    required this.descricaoDespesa,
    required this.prestacoes,
    required this.qParcela,
    required this.valorGasto,
  });

  factory ExpenseInstallmentDTO.fromJson(Map<String, dynamic> json) {
    return ExpenseInstallmentDTO(
        descricaoDespesa: json["descricao_despesa"],
        prestacoes: json["prestacoes"] is double
            ? json["prestacoes"]
            : double.parse(json["prestacoes"]),
        qParcela: json["parcela"] is int
            ? json["parcela"]
            : int.parse(json["parcela"]),
        valorGasto: json["valor_gasto"] is double
            ? json["valor_gasto"]
            : double.parse(json["valor_gasto"]));
  }

  toJson() {
    return {};
  }
}
