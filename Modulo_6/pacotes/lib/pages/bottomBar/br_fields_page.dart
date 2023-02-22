import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrFieldsPage extends StatefulWidget {
  const BrFieldsPage({super.key});

  @override
  State<BrFieldsPage> createState() => _BrFieldsPageState();
}

class _BrFieldsPageState extends State<BrFieldsPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            const Text("Cep"),
            TextFormField(
              controller: cepController,
              decoration: const InputDecoration(hintText: "Cep"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
            ),
            const SizedBox(height: 15),
            const Text("Cpf"),
            TextFormField(
              controller: cpfController,
              decoration: const InputDecoration(hintText: "Cpf"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
            ),
            const SizedBox(height: 15),
            const Text("Telefone"),
            TextFormField(
              controller: telefoneController,
              decoration: const InputDecoration(hintText: "Telefone"),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
            ),
            TextButton(
              child: const Text("Validar"),
              onPressed: () {
                print(CPFValidator.isValid(cpfController.text));
                print(CPFValidator.generate());

              },
            ),
          ],
        ),
      ),
    );
  }
}
