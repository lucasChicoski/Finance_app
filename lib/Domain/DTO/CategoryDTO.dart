import 'package:scaffold_project/Domain/Models/DropMenuItensModel.dart';

class CategoryDTO {
  int id = 0;
  String category = '';

  CategoryDTO({required this.category, required this.id});

  factory CategoryDTO.fromJSON(Map<String, dynamic> json) {
    return CategoryDTO(
      id: json["id"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'category': category,
    };
  }

  static List<DropDownItensModel> toListDropMenu(List<CategoryDTO> list) {
    List<DropDownItensModel> listItens = [];
    for (var element in list) {
      listItens.add(DropDownItensModel(element.category, element.id));
    }

    return listItens;
  }
}
