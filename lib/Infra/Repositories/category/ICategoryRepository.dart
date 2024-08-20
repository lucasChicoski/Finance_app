import 'package:dio/dio.dart';

abstract class ICategoryRepository {
  Dio? dio;
  Future getCategory();
}
