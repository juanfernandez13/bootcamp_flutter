import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async{
    await Future.delayed(const Duration(milliseconds:600 ));
    return CardDetail(
        1,
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.Cevadis im ampola pa arma uma pindureta.Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget.Quem num gosta di mim que vai caçá sua turmis! Atirei o pau no gatis, per gatis num morreus.Leite de capivaris, leite de mula manquis sem cabeça.Interagi no mé, cursus quis, vehicula ac nisi.Copo furadis é disculpa de bebadis, arcu quam euismod magna. Copo furadis é disculpa de bebadis, arcu quam euismod magna.Viva Forevis aptent taciti sociosqu ad litora torquent.Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.Si u mundo tá muito paradis? Toma um mé que o mundo vai girarzis!");
  }
}
