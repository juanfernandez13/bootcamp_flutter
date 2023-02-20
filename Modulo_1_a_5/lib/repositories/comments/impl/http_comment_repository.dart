import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trilhaapp/repositories/comments/comments_repository.dart';
import '../../../model/comment_model.dart';

class CommentHttpRepository implements CommentsRepository{
  @override
  Future<List<CommentModel>> obterComentarios(int idPost) async {
    var response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$idPost/comments'));
    if (response.statusCode == 200) {
      var jsonComments = jsonDecode(response.body);
      return (jsonComments as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
