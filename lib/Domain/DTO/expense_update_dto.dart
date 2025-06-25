

class ExpenseUpdateDTO {
  final String hash;
  final String descricao;
  final double valorGasto;

  ExpenseUpdateDTO({
    required this.hash,
    required this.descricao,
    required this.valorGasto,
  });

  factory ExpenseUpdateDTO.fromJson(Map<String, dynamic> json) {
    return ExpenseUpdateDTO(
      hash: json['hash'] as String,
      descricao: json['descricao'] as String,
      valorGasto: (json['valor_gasto'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hash": hash,
      "descricao": descricao,
      "valor_gasto": valorGasto,
    };
  }
}
