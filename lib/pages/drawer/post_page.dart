import 'package:flutter/material.dart';
import 'package:trilhaapp/model/post_model.dart';
import 'package:trilhaapp/pages/drawer/comments_page.dart';
import 'package:trilhaapp/repositories/post_repository.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostRepository postRepository = PostRepository();
  var posts = <PostModel>[];
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    posts = await postRepository.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: posts.isEmpty? const Center(child: LinearProgressIndicator(),) : 
        Scrollbar(
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              var post = posts[index];
              return InkWell(
                onTap:() => Navigator.push(context, MaterialPageRoute(builder: ((_) => CommentsPage(postID: post.id!)))),
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(post.title!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        Text(post.body!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
