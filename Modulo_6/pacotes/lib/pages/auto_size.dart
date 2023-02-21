import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AutoSizePage extends StatefulWidget {
  const AutoSizePage({super.key});

  @override
  State<AutoSizePage> createState() => _AutoSizePageState();
}

class _AutoSizePageState extends State<AutoSizePage> {
  TextEditingController autoTextController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("AutoSize Page")),
      body: Column(
        children: [
          TextField(
            onChanged: ((value) => setState(() {})),
            controller: autoTextController,
            maxLines: 5,
          ),
          Container(
              margin: const EdgeInsets.all(8),
              child: AutoSizeText(
                autoTextController.text,
                maxLines: 2,
                minFontSize: 16,
              )),
              const SizedBox(height: 50,),
          Container(
            height: 50,
            margin: const EdgeInsets.all(8),
            child: const Text(
                "Mussum Ipsum, cacilds vidis litro abertis. Copo furadis é disculpa de bebadis, arcu quam euismod magna.Detraxit consequat et quo num tendi nada.Manduma pindureta quium dia nois paga.Pra lá , depois divoltis porris, paradis."),
          ),
          const Card(
            margin: EdgeInsets.all(8),
            child: AutoSizeText(
                "Mussum Ipsum, cacilds vidis litro abertis. Copo furadis é disculpa de bebadis, arcu quam euismod magna.Detraxit consequat et quo num tendi nada.Manduma pindureta quium dia nois paga.Pra lá , depois divoltis porris, paradis."),
          ),
        ],
      ),
    ));
  }
}
