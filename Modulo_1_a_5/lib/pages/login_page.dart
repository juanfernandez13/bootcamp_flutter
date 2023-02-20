import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.network(
                          'https://hermes.digitalinnovation.one/assets/diome/logo.png',
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Já tem cadastro?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Faça seu login e make the change_",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person, color: Colors.purple)),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      controller: senhaController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(bottom: 0),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.purple),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      obscureText: isObscureText,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 9,
                        child: TextButton(
                            onPressed: () {
                              if (emailController.text.trim() ==
                                      "admin" &&
                                  senhaController.text.trim() == "1234") {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainPage()
                                        ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Erro ao efetuar o login")));
                              }
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.purple)),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            )),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  const SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.amber),
                    )),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      "Criar conta",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          )),
    );
  }
}
