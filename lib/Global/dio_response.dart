class DioResponse {
  dynamic data;
  String message;
  String statusText;
  int  statusCode;

  DioResponse(
      {required this.data,
      required this.message,
      required this.statusText,
      required this.statusCode});

  factory DioResponse.fromJson(Map<String, dynamic> json) {
    return DioResponse(
      data: json['data'],
      message: json['message'],
      statusText: json['statusText'],
      statusCode: json['status'],
    );
  }
}
