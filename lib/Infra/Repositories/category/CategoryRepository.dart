import 'package:dio/src/dio.dart';
import 'package:scaffold_project/Infra/Repositories/category/ICategoryRepository.dart';

class Categoryrepository implements ICategoryRepository {
  @override
  Dio? dio;

  Categoryrepository(Dio this.dio);

  @override
  Future getCategory() async {
    var response = await dio!.post('/get-categories', data: {});

    return response.data['data'];
  }
}
