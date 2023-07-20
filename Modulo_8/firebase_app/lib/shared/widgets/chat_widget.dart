import 'package:flutter/material.dart';

import '../../models/text_model.dart';

class ChatWidget extends StatelessWidget {
  final TextModel textModel;
  final bool myMassage;
  const ChatWidget({super.key, required this.textModel, required this.myMassage});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: myMassage
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: myMassage ? Colors.amber : Colors.blue,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          textModel.texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
