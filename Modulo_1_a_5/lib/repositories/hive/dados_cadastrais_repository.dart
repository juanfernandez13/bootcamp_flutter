import 'package:hive/hive.dart';
import 'package:trilhaapp/model/hive/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  static late Box _box;

  DadosCadastraisRepository._criar();

  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen('dadosCadastrais')) {
      _box = Hive.box('dadosCadastrais');
    } else {
      _box = await Hive.openBox('dadosCadastrais');
    }
    return DadosCadastraisRepository._criar();
  }

  salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put('dadosCadastrais', dadosCadastraisModel);
  }

  obterDados() {
    var dadosCadastraisModel = _box.get('dadosCadastrais');
    if (dadosCadastraisModel == null) {
      return DadosCadastraisModel.vazio();
    }
    return dadosCadastraisModel;
  }
}
