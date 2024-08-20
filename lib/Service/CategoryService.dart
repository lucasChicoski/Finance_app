import 'package:scaffold_project/Domain/DTO/CategoryDTO.dart';
import 'package:scaffold_project/Infra/Repositories/category/CategoryRepository.dart';
import 'package:scaffold_project/Utils/IOC.dart';

class CategoryService {
  late Categoryrepository categoryRepo;

  CategoryService() {
    categoryRepo =
        RepositoryFactory.getRepository(RepositoryType.categoryRepository);
  }

  Future<List<CategoryDTO>> getCategory() async {
    List result = await categoryRepo.getCategory();
    List<CategoryDTO> categories = [];
    for (var element in result) {
      categories.add(CategoryDTO.fromJSON(element));
    }

    return categories;
  }
}
