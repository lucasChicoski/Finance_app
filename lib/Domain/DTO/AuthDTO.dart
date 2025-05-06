class AuthDTO {
  final String cpf;
  final String passwd;

  AuthDTO({required this.cpf, required this.passwd});

  factory AuthDTO.fromJson(Map<String, dynamic> json) {
    return AuthDTO(
      cpf: json['cpf'],
      passwd: json['passwd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'passwd': passwd,
    };
  }
}
