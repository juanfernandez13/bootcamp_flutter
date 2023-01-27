import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:trilhaapp/repositories/marvel/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  ScrollController _scrollController = ScrollController();
  int offset = 0;
  bool carregando = true;
  @override
  void initState() {
    marvelRepository = MarvelRepository();
    _scrollController.addListener(() {
      double posicaoPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels >= posicaoPaginar) {
        print("carregando");
        carregarDados();
      }
    });
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (carregando && !(characters.data == null || characters.data!.results == null) ) return;
    if (characters.data == null || characters.data!.results == null) {
      characters = await marvelRepository.getCharacters(offset);
      setState(() => carregando = false);
    } else {
      setState(() => carregando = true);
      offset += characters.data!.count!;
      var tempList = await marvelRepository.getCharacters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
      setState(() => carregando = false);
    }
  }

  int quantidadeHerois() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int quantidadeHeroisAtual() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:
            Text("Hérois: ${quantidadeHeroisAtual()} de ${quantidadeHerois()}"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount:
                    characters.data == null || characters.data!.results == null
                        ? 0
                        : characters.data!.results!.length,
                itemBuilder: (_, int index) {
                  var character = characters.data!.results![index];
                  String imgCharacter = character.thumbnail!.path! +
                      "." +
                      character.thumbnail!.extension!;
                  return Card(
                    child: Row(
                      children: [
                        Image.network(
                          imgCharacter,
                          height: 150,
                          width: 150,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.name!,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(character.description!)
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          carregando
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () => carregarDados(),
                  child: Text("Carregar mais"))
        ],
      ),
    ));
  }
}
