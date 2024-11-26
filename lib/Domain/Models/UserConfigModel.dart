class UserConfigmodel {
  int? id;
  String? name;
  String? lastName;
  String? birthDate;
  String? email;
  String? phoneNumber;
  String? cpf;
  String? passwd;


  UserConfigmodel(Map<String, dynamic> data) {
    name = data['nome'];
    lastName = data['sobrenome'];
    birthDate = data['data_nascimento'];
    email = data['email'];
    phoneNumber = data['telefone'];
    cpf = data['cpf'];
    passwd = data['passwd'];
  }
}
