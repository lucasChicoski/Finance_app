class Expensev2DTO {
  late int idCategory;
  late int idUser;
  late String data;
  late String tipoDespesa;
  late String descricao;
  late double valorGasto;
  late bool isDivided;
  late int quantidadeParcela;
  late double parcela;
  late int month;
  late int year;

  Expensev2DTO(
      {required this.idCategory,
      required this.idUser,
      required this.data,
      required this.tipoDespesa,
      required this.descricao,
      required this.valorGasto,
      required this.isDivided,
      required this.quantidadeParcela,
      required this.parcela,
      required this.month,
      required this.year});

  factory Expensev2DTO.fromJSON(Map<String, dynamic> json) {
    return Expensev2DTO(
        idUser: json['id_user'],
        idCategory: json['id_category'],
        data: json['date'],
        tipoDespesa: json['tipo_despesa'],
        descricao: json['descricao_despesa'],
        valorGasto: double.parse(json['valor_gasto'].toString()), // json['valor_gasto'],
        isDivided: json['is_divided'],
        quantidadeParcela: json['quantidade_parcela'],
        parcela: double.parse(json['parcela'].toString()), // json['parcela'],
        month: json['month'],
        year: json['year']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id_user": idUser,
      "id_category": idCategory,
      "data": data,
      "tipoDespesa": tipoDespesa,
      "descricao": descricao,
      "valorGasto": valorGasto,
      "isDivided": isDivided,
      "quantidade_parcela": quantidadeParcela,
      "parcela": parcela,
      "month": month,
      "year": year
    };
  }
}
