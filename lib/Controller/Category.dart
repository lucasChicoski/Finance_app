import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';
import 'package:scaffold_project/Service/CategoryService.dart';

class CategoryAplication {
  Future<List<CategoryDTO>> getCategory() async {
    CategoryService categoryService = CategoryService();
    List<CategoryDTO> result = await categoryService.getCategory();
    return result;
  }
}
