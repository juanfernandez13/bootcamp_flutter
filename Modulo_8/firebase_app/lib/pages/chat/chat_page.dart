import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/text_model.dart';
import 'package:firebase_app/shared/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final String nickName;
  const ChatPage({super.key, required this.nickName});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final db = FirebaseFirestore.instance;
  TextEditingController textController = TextEditingController(text: '');
  String userID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarUsuario();
  }

  carregarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString('user_id')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
        ),
        body: Container(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: db.collection("chats").snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: ListView(
                                children: snapshot.data!.docs.map((e) {
                              var textStream = TextModel.fromJson(
                                  (e.data() as Map<String, dynamic>));
                              return ChatWidget(
                                  textModel: textStream,
                                  myMassage: textStream.userId == userID);
                            }).toList()),
                          );
                  }),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          var text = TextModel(
                              texto: textController.text,
                              userId: userID,
                              nickname: widget.nickName);

                          await db.collection("chats").add(text.toJson());
                          textController.clear();
                        },
                        icon: const Icon(Icons.send))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
