class FinanceConfigDTO {
  double? balance;
  double? renda;
  double? saveMoney;

  FinanceConfigDTO({this.balance, this.renda, this.saveMoney});

  factory FinanceConfigDTO.fromJSON(Map<String, dynamic> json) {
    return FinanceConfigDTO(
      balance: double.parse(json['balance'].toString()),
      renda: double.parse(json['renda'].toString()),
      saveMoney: double.parse(json['guarde_dinheiro'].toString()),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      "balance": balance ?? 0,
      "renda": renda ?? 0,
      "guarde_dinheiro": saveMoney ?? 0
    };
  }

  
}
