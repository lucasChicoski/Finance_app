import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Domain/DTO/FinanceConfigDTO.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
import 'package:scaffold_project/Domain/Models/DespesasParceladas.dart';

class UserDTO {
  int? id;
  String? name;
  String? lastName;
  String? birthDate;
  String? email;
  String? phoneNumber;
  String? cpf;
  String? passwd;
  List<Expensev2DTO>? despesas;
  List<ExpenseInstallmentDTO>? despesasParceladas;
  FinanceConfigDTO? config;
  List<DespesasAgrupadas>? despesasAgrupadas;

  UserDTO({
    this.id,
    this.name,
    this.lastName,
    this.cpf,
    this.email,
    this.passwd,
    this.birthDate,
    this.phoneNumber,
    this.despesasAgrupadas
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json["id"],
      name: json["nome"],
      lastName: json["lastName"] ?? json["sobrenome"],
      birthDate: json["birthDate"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      cpf: json["cpf"],
      passwd: json["passwd"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'birthDate': birthDate,
      'email': email,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'passwd': passwd
    };
  }

  setExpenses(List<Expensev2DTO> despesas) {
    this.despesas = despesas;
  }

  setInstallments(List<ExpenseInstallmentDTO> despesasParceladas) {
    this.despesasParceladas = despesasParceladas;
  }

  setConfig(FinanceConfigDTO config) {
    this.config = config;
  }

  setDespesasAgrupadas(List<DespesasAgrupadas> despesasAgrupadas) {
    this.despesasAgrupadas = despesasAgrupadas;
  }

}
