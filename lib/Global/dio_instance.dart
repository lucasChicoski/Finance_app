import 'package:dio/dio.dart';
import 'package:scaffold_project/Global/global_variables.dart';

class DioInstance {
  static Dio dio() {
    final options = BaseOptions(
      baseUrl: GlobalVariables.URL_API_DEV,
      // connectTimeout: Duration(seconds: 5),
      // receiveTimeout: Duration(seconds: 3),
    );

    return Dio(options);
  }
}
