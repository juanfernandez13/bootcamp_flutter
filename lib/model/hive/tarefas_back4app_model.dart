class TarefasBack4AppModel {
  List<Tarefa> _results = [];

  TarefasBack4AppModel(this._results);

  List<Tarefa> get results => _results;
  set results(List<Tarefa> results) => _results = results;

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    _results = <Tarefa>[];
    json['results'].forEach((v) {
      _results.add(Tarefa.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this._results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Tarefa {
  String _objectId = "";
  String _descricao = "";
  bool _concluido = false;
  String _createdAt = "";
  String _updatedAt = "";

  Tarefa.criar(this._descricao, this._concluido);
  Tarefa(this._objectId, this._descricao, this._concluido, this._createdAt,
      this._updatedAt);

  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;
  String get descricao => _descricao;
  set descricao(String descricao) => _descricao = descricao;
  bool get concluido => _concluido;
  set concluido(bool concluido) => _concluido = concluido;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  Tarefa.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _descricao = json['descricao'];
    _concluido = json['concluido'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['objectId'] = _objectId;
    data['descricao'] = _descricao;
    data['concluido'] = _concluido;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['descricao'] = _descricao;
    data['concluido'] = _concluido;
    return data;
  }
  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['descricao'] = _descricao;
    data['concluido'] = _concluido;
    return data;
  }
}
