class FinanceConfigDTO {
  double? balance;
  double? renda;
  double? saveMoney;

  FinanceConfigDTO({this.balance, this.renda, this.saveMoney});

  factory FinanceConfigDTO.fromJSON(Map<String, dynamic> json) {
    return FinanceConfigDTO(
      balance: double.tryParse(json['balance'].toString()),
      renda: double.tryParse(json['renda'].toString()),
      saveMoney: double.tryParse(
          json['save_money']?.toString() ?? json['guarde_dinheiro'].toString()),
    );
  }

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> value = {
      "userId": 1, //Trazer dinamico
    };

    balance != null ? value.addAll({"balance": balance}) : null;
    renda != null ? value.addAll({"renda": renda}) : null;
    saveMoney != null ? value.addAll({"save_money": saveMoney}) : null;

    return value;
  }
}
