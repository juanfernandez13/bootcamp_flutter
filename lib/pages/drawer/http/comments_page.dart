import 'package:flutter/material.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';
import 'package:trilhaapp/repositories/comments/impl/dio_comments_repository.dart';
import 'package:trilhaapp/repositories/comments/impl/http_comment_repository.dart';

class CommentsPage extends StatefulWidget {
  final int postID;
  const CommentsPage({super.key, required this.postID});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  CommentsRepository commentRepository = CommentsDioRepository();
  var comments = <CommentModel>[];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    comments = await commentRepository.obterComentarios(widget.postID);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Comentários do Post: ${widget.postID}")),
        body: Container(
            child: comments.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (_, int index) {
                      var comment = comments[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(comment.name!.substring(0, 6)),
                                    Text(comment.email!),
                                  ],
                                ),
                                Text(comment.body!),
                              ],
                            )),
                      );
                    })),
      ),
    );
  }
}
