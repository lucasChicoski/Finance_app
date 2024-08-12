class UserDTO {
  int? id;
  String? name;
  String? lastName;
  String? birthDate;
  String? email;
  String? phoneNumber;

  UserDTO({
    this.id,
    this.name,
    this.lastName,
    this.birthDate,
    this.email,
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
    };
  }
}
