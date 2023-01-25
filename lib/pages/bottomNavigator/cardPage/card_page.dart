import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/bottomNavigator/cardPage/card_detail_page.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';
import '../../../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                ))));
                  },
                  child: Hero(
                    tag: cardDetail!.id,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                                    height: 25,
                                  ),
                                  const Text("Meu card"),
                                ],
                              ),
                            ),
                            const Text(
                                "Mussum Ipsum, cacilds vidis litro abertis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.Detraxit consequat et quo num tendi nada.Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis ... "),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => CardDetailPage(
                                              cardDetail: cardDetail!,
                                            )))),
                                child: const Text(
                                  "Ler Mais",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
