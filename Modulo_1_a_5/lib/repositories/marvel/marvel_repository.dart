import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("MARVELPUBLICKEY");
    var privateKey = dotenv.get("MARVELAPIKEY");
    var hash = generateMd5(ts + privateKey + publicKey);
    var query = '?offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash';
    var result =
        await dio.get('http://gateway.marvel.com/v1/public/characters$query');
    if (result.statusCode == 200) {
      var charactersModel = CharactersModel.fromJson(result.data);
      return charactersModel;
    }
    return CharactersModel();
  }

  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
