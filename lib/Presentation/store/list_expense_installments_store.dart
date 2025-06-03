


import 'package:flutter/material.dart';
import 'package:scaffold_project/Domain/DTO/expense_installment_dto.dart';

class ListExpenseInstallmentsStore extends ChangeNotifier {

  List<ExpenseInstallmentDTO> listExpenseInstallments = [];

  void setListExpenseInstallments(List<ExpenseInstallmentDTO> value) {
    listExpenseInstallments = value;
    notifyListeners();
  }


  void setOneItemExpenseInstallments(ExpenseInstallmentDTO value) {
    listExpenseInstallments.add(value);
    notifyListeners();
  }
}