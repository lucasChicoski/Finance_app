import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/AuthDTO.dart';
import 'package:scaffold_project/Global/dio_response.dart';
import 'package:scaffold_project/Global/interfaces/auth_intefaces.dart';

class Authrepository implements IAuthInterface {
  late Dio _dio;
  Authrepository(Dio dio) {
    _dio = dio;
  }

  @override
  Future<DioResponse> login(AuthDTO value) async {
    final response = await _dio.post('/auth', data: value.toJson());
    return DioResponse(
      data: response.data['data'],
      message: response.data['message'],
      statusCode: response.data['status'], //response.statusCode!,
      statusText: response.data['statusText'],
    );
  }
}
