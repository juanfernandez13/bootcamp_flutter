import '../../model/comment_model.dart';

abstract class CommentsRepository {
  Future<List<CommentModel>> obterComentarios(int idPost);
}
