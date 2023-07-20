import 'package:cloud_firestore/cloud_firestore.dart';

class TextModel {
  DateTime dataHora = DateTime.now();
  String texto = "";
  String userId = "";
  String nickname = "";

  TextModel({required this.texto,required this.userId,required this.nickname});

  TextModel.fromJson(Map<String, dynamic> json) {
    dataHora = (json['data_hora'] as Timestamp).toDate();
    texto = json['texto'];
    userId = json['user_id'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_hora'] = Timestamp.fromDate(this.dataHora);
    data['texto'] = this.texto;
    data['user_id'] = this.userId;
    data['nickname'] = this.nickname;
    return data;
  }
}
