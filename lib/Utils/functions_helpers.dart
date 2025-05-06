import 'package:uuid/v4.dart';

class Global {
  static DateTime getDate() {
    final currentDate = DateTime.now();
    return currentDate;
  }

  static String defineMonth(int value) {
    switch (value) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        return "Valor inválido";
    }
  }

  static String getHash() {
    UuidV4 uuid = const UuidV4();
    return uuid.generate();
  }
}
