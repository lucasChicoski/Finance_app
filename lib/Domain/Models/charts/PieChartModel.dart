class PieChartModel {
  String value;
  String title;
  String color;

  PieChartModel(
      {required this.value, required this.title, required this.color});

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return PieChartModel(
      value: json['value'].toString(),
      title: json['title'],
      color: json['color'],
    );
  }
}
