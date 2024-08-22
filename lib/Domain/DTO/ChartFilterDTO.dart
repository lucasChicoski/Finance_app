class ChartFilterDTO {
  late int userId;
  int? month;

  ChartFilterDTO({
    required this.userId,
    this.month,
  });

  factory ChartFilterDTO.fromJson(Map<String, dynamic> json) {
    return ChartFilterDTO(
      userId: json['user_id'],
      month: json['month'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'month': month,
    };
  }
}
