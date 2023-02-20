import 'package:shared_preferences/shared_preferences.dart';

enum CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_DADOS_CADASTRAIS_LINGUAGENS,
  CHAVE_USUARIO,
  CHAVE_ALTURA,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_TEMA_ESCURO
}

class AppStorage {
  void _setString({required String chave, required String valor}) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, valor);
  }

  Future<String> _getString({required String chave}) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  void _setDouble({required String chave, required double valor}) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, valor);
  }

  Future<double> _getDouble({required String chave}) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  void _setBool({required String chave, required bool valor}) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, valor);
  }

  Future<bool> _getBool({required String chave}) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  void _setStringList(
      {required String chave, required List<String> valor}) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, valor);
  }

  Future<List<String>> _getStringList({required String chave}) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  // Dados cadastrais page
  Future<void> setNome(String nome) async {
    _setString(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), valor: nome);
  }

  Future<String> getNome() async {
    return _getString(
      chave: CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(),
    );
  }

  Future<void> setDataDeNascimento(DateTime data) async {
    _setString(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        valor: data.toString());
  }

  Future<String> getDataDeNascimento() async {
    return _getString(
      chave: CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
    );
  }

  Future<void> setNivelExperiencia(String nivel) async {
    _setString(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        valor: nivel);
  }

  Future<String> getNivelExperiencia() async {
    return _getString(
      chave: CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
    );
  }

  Future<void> setTempoExperiencia(String tempo) async {
    _setString(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        valor: tempo);
  }

  Future<String> getTempoExperiencia() async {
    return _getString(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  Future<void> setLinguagens(List<String> linguagens) async {
    _setStringList(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString(),
        valor: linguagens);
  }

  Future<List<String>> getLinguagens() async {
    return _getStringList(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGENS.toString());
  }

  Future<void> setSalario(double salario) async {
    _setDouble(
        chave: CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(),
        valor: salario);
  }

  Future<double> getSalario() async {
    return _getDouble(chave: CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

  // Configurações page
  Future<void> setUsuario(String usuario) async {
    _setString(chave: CHAVES.CHAVE_USUARIO.toString(), valor: usuario);
  }

  Future<String> getUsuario() async {
    return _getString(
      chave: CHAVES.CHAVE_USUARIO.toString(),
    );
  }

  Future<void> setAltura(double altura) async {
    _setDouble(chave: CHAVES.CHAVE_ALTURA.toString(), valor: altura);
  }

  Future<double> getAltura() async {
    return _getDouble(chave: CHAVES.CHAVE_ALTURA.toString());
  }

  Future<void> setTemaEscuro(bool temaEscuro) async {
    _setBool(chave: CHAVES.CHAVE_TEMA_ESCURO.toString(), valor: temaEscuro);
  }

  Future<bool> getTemaEscuro() async {
    return _getBool(chave: CHAVES.CHAVE_TEMA_ESCURO.toString());
  }

  Future<void> setReceberNotificacao(bool receberNotificacao) async {
    _setBool(
        chave: CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(),
        valor: receberNotificacao);
  }

  Future<bool> getReceberNotificacao() async {
    return _getBool(chave: CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }
}
