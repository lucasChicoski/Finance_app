class ReturnService<T> {
  final T data;
  String message;
  int statusCode = 0;

  ReturnService({required this.data, required this.message, required this.statusCode});
}
