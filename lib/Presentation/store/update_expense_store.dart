

import 'package:flutter/foundation.dart';
import 'package:scaffold_project/Controller/Financial/ExpensiveApplication.dart';
import 'package:scaffold_project/Domain/DTO/expense_update_DTO.dart';

ExpensiveApplication expensiveApplication = ExpensiveApplication();

class UpdateExpenseStore extends ChangeNotifier {
  String _description = '';
  double _value = 0.0;

  String get description => _description;
  double get value => _value;

  void setDescription(String description) {
    _description = description;
    notifyListeners();
  }

  void setValue(String value) {
    _value = double.parse(value);
    notifyListeners();
  }

  void reset() {
    _description = '';
    _value = 0.0;
    notifyListeners();
  }


  Future<void> submitUpdate(String hash) async {

    if(hash.isEmpty) {
      throw Exception('Hash cannot be empty');
    }

    ExpenseUpdateDTO expenseUpdateDTO = ExpenseUpdateDTO(
      hash: hash,
      descricao: _description,
      valorGasto: _value,
    );

    try {
     final response = await expensiveApplication.updateExpense(expenseUpdateDTO);
      reset(); // Reset after submission
      return response; // Return the response if needed
    } catch (e) {
      print('Error updating expense: $e');
      throw e; // Re-throw the error for further handling if needed
    }
  }
}