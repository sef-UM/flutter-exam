import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/defaults.dart';
import 'package:orion_flutter_exam/userdata.dart';

class PostPage extends StatefulWidget {
  final UserPost post;
  PostPage({required this.post, super.key});
  UserData userData = UserData();

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  gotoPage(dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

  var boldTxtStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  var isVisible = false;
  final _textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final ScrollController  _scrollController = ScrollController();



  void btnComment(data) => {
        setState(() {
          widget.userData.commentList.add(UserComment(
                commentImg: widget.userData.myUserAccount.img,
                commentName: widget.userData.myUserAccount.name,
                commentTime: 'Just Now',
                commentContent: data,
              ));
              isVisible = false;
        }),
        _textController.clear(),
      };
  commentBtn(UserComment userCmt) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(userCmt.commentTime),
            const SizedBox(
              width: 15,
            ),
            const Text('Like'),
            const SizedBox(
              width: 15,
            ),
            const Text('Reply')
          ],
        ),
      );
  commentDesc(UserComment userCmt) => Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userCmt.commentName,
              style: boldTxtStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(userCmt.commentContent),
              ],
            )
          ],
        ),
      );

  commentSpace(UserComment userCmt) => Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(35, 158, 158, 158),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: commentDesc(userCmt),
      );
  commenterPic(UserComment userCmt) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userCmt.commentImg),
        ),
      );
  userCommentLine(UserComment userCmt) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          commenterPic(userCmt),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [commentSpace(userCmt), commentBtn(userCmt)],
          )
        ],
      );
  Widget userPostDetails(UserComment userCmt) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          userCommentLine(userCmt),
        ],
      );
  commenters(UserPost userPost) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey.shade700,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  userPost.numShare,
                  style: boldTxtStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text('All Comments', style: boldTxtStyle),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
  addComment() => Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          controller: _textController,
          focusNode: focusNode,
          enabled: true,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: (){
                  btnComment(_textController.text);
                },
                icon: Icon(Icons.send)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            )),
      ),
      body: ListView(
        
        controller: _scrollController,
        shrinkWrap: true,
        children: [
          postHeader(widget.post),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.post.postContent,
              style: postTxtStyle(),
            ),
          ),
          postImage(widget.post),
          buttonsGbl(
            userPost: widget.post,
            likeFn: () {
              setState(() {
                widget.post.isLiked = widget.post.isLiked ? false : true;
              });
            },
            commnetFn: () {
              setState(() {
                isVisible = isVisible?false:true;
                FocusScope.of(context).requestFocus(focusNode);
                _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.easeOut);
              });
            }
          ),
          commenters(widget.post),
          ListView(
            shrinkWrap: true,
            children: widget.userData.commentList.map((userComment) {
              return userPostDetails(userComment);
            }).toList(),
          ),
          Visibility(
            visible: isVisible,
            child: addComment()
            ),
        ],
      ),
    );
  }
}
