class UserDTO {
  int? id;
  String? name;
  String? lastName;
  String? birthDate;
  String? email;
  String? phoneNumber;
  String? cpf;
  String? passwd;

  UserDTO({
    this.id,
    this.name,
    this.lastName,
    this.cpf,
    this.email,
    this.passwd,
    this.birthDate,
    this.phoneNumber,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json["id"],
      name: json["nome"],
      lastName: json["lastName"],
      birthDate: json["birthDate"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      cpf: json["cpf"],
      passwd: json["passwd"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'birthDate': birthDate,
      'email': email,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'passwd': passwd
    };
  }
}
