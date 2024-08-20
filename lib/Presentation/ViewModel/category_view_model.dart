import 'package:flutter/material.dart';
import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';

class CategoryViewModel extends ChangeNotifier {
  List<CategoryDTO> listCategories = [];
  int selectedCategory = 0;

  setListCategories(List<CategoryDTO> value) {
    listCategories = value;
  }

  setSelectedCategory(int value) {
    selectedCategory = value;
  }
}
