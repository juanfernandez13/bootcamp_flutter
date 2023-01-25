import 'package:flutter/material.dart';

class TextLabelCadastro extends StatelessWidget {
  final String texto;
  const TextLabelCadastro({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text(texto,
      style:const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
