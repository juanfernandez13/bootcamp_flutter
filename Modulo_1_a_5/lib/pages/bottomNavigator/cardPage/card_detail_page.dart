import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(title: Text(cardDetail.title),),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(cardDetail.url, height: 20,),
                    Text(cardDetail.title)
                  ],
                ),
                const SizedBox(height: 15,),
                Expanded(
                  child: Text(cardDetail.text),
                ),
              ],
            ),
            ),
        ),
      ),
    );
  }
}
