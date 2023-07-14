import 'package:mobx/mobx.dart';
import 'package:state_management/services/mobx/mobx_tarefa_store.dart';

part 'lista_tarefa_mobx.g.dart';

class ListaTarefasStore = _ListaTarefasStore with _$ListaTarefasStore;

abstract class _ListaTarefasStore with Store {
  ObservableList<TarefaMobxStore> _listaTarefas =
      ObservableList<TarefaMobxStore>();

  @computed
  List<TarefaMobxStore> get listaTarefas => _apenasNaoConcluidos
      ? _listaTarefas.where((element) => !element.concluido).toList()
      : _listaTarefas.toList();

  @observable
  var _apenasNaoConcluidos = false;

  bool get apenasNaoConcluidos => _apenasNaoConcluidos;
  
  set naoConcluido(bool value) => _apenasNaoConcluidos = value;

  @action
  void add(String description) {
    _listaTarefas.add(TarefaMobxStore(description, false));
  }

  @action
  void alterar(String id, String descricao, bool concluido) {
    var tarefa = _listaTarefas.firstWhere((element) => element.id == id);
    tarefa.alterar(descricao, concluido);
  }

  @action
  void excluir(String id) {
    _listaTarefas.removeWhere((element) => element.id == id);
  }
}
