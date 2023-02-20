import 'package:dio/dio.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';

import '../../../model/comment_model.dart';
import '../../dio_base_url_jsonplaceholder.dart';

class CommentsDioRepository implements CommentsRepository {
  @override
  Future<List<CommentModel>> obterComentarios(int idPost) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get('/posts/$idPost/comments');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((e) => CommentModel.fromJson(e))
          .toList();
    }
    return [];
  }
}
