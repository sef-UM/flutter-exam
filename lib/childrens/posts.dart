import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/defaults.dart';
import 'package:orion_flutter_exam/pages/postpage.dart';
import 'package:orion_flutter_exam/userdata.dart';

class PostList extends StatefulWidget {
  UserData posts;
  PostList({required this.posts, super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  gotoPage(dynamic page) => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page))
      };
    showPost(UserPost userPost)=> Column(
    children: [
      postHeader(userPost),
      Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              userPost.postContent,
              style: postTxtStyle(),
            ),
          ],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttonsGbl(
        userPost: userPost, 
        likeFn: (){
        setState(() {
          userPost.isLiked  = userPost.isLiked? false : true;
        });
      },
      commnetFn: (){
        setState(() {
          gotoPage(PostPage(post: userPost));
        });
      }
      ),
      SizedBox(
        height: 10,
        child: Container(
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ],

  );


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        children: widget.posts.userList.map((userPost){
            return InkWell(
              onTap: (){
                gotoPage(PostPage(post: userPost));
              },
              child: showPost(userPost),
            );
          }).toList(),
      ),
    );
  }
}
