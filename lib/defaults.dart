import 'package:flutter/material.dart';
import 'userdata.dart';

TextStyle styleText({double size = 10, bool bold = false}) => TextStyle(
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );

class UserData {
  List<UserPost> userList = [
    UserPost(
      userimg: 'assets/photo_male_1.jpg',
      username: 'Rebandsome Cliff',
      time: '45 Minutes Ago',
      postContent: 'time is Gold',
      postImg: 'assets/products/image_10.jpg',
      numComments: '8.5k Comments',
      numShare: '90 Shares',
      isLiked: false,
    ),
    UserPost(
      userimg: 'assets/photo_male_8.jpg',
      username: 'John Doe',
      time: '1 hour ago',
      postContent: 'A coffee today keeps your worry a day',
      postImg: 'assets/products/image_11.jpg',
      numComments: '900 Comments',
      numShare: '1k Shares',
      isLiked: false,
    ),
    UserPost(
      userimg: 'assets/photo_male_7.jpg',
      username: 'Christian Raye',
      time: '20 Nov at 9:30pm',
      postContent: 'Hi There!',
      postImg: 'assets/products/image_12.jpg',
      numComments: '32 Comments',
      numShare: '1 Shares',
      isLiked: false,
    ),
  ];

  List<Friend> friendList = [
    Friend(
      img: 'assets/photo_male_2.jpg',
      name: 'Mary Shaw',
    ),
    Friend(
      img: 'assets/photo_male_3.jpg',
      name: 'Raye D. Ban',
    ),
    Friend(
      img: 'assets/photo_male_4.jpg',
      name: 'Eliot Anderson',
    ),
    Friend(
      img: 'assets/photo_male_5.jpg',
      name: 'East T. Dante',
    ),
    Friend(
      img: 'assets/photo_male_6.jpg',
      name: 'Corny Toe',
    ),
    Friend(
      img: 'assets/photo_male_7.jpg',
      name: 'Sam Smith',
    ),
  ];

  List<UserComment> commentList = [
    UserComment(
        commentImg: 'commenterImg',
        commentName: 'Mary Shaw',
        commentTime: '3w',
        commentContent: 'What a lovely photo we got there!'),
    UserComment(
        commentImg: 'commenterImg',
        commentName: 'Kim Kardashan',
        commentTime: '5w',
        commentContent: 'Try the latte one!'),
    UserComment(
        commentImg: 'commenterImg',
        commentName: 'Chris Tina',
        commentTime: '7w',
        commentContent: 'Hello There!'),
  ];

  Account myUserAccount = Account(
      name: 'Reban Cliff Fajardo',
      email: 'rebanclifffajardo@gmail.com',
      img: 'assets/photo_male_1.jpg',
      numFollowers: '1.5k',
      numPosts: '100',
      numFollowing: '420',
      numFriends: '4,920');
}


TextStyle postTxtStyle() => const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

void emptyFn(){}

Row buttonsGbl({required UserPost userPost,void Function()?  likeFn=emptyFn, void Function()? commnetFn=emptyFn, void Function()? shareFn=emptyFn}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: likeFn,
            style: TextButton.styleFrom(
              foregroundColor: (userPost.isLiked) ? Colors.blue : Colors.grey,
            ),
            icon: const Icon(Icons.thumb_up),
            label: const Text('like'),
          ),
          TextButton.icon(
            onPressed: commnetFn,
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            icon: const Icon(Icons.message),
            label: const Text('comment'),
          ),
          TextButton.icon(
            onPressed: shareFn,
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            icon: const Icon(Icons.share),
            label: const Text('Share'),
          ),
        ],
      );

Widget postCount(UserPost userPost) => Padding(
  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
  child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${userPost.numComments} • ',
            ),
            Text(userPost.numShare)
          ],
        ),
);

Widget postHeader(UserPost userPost) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(userPost.userimg),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userPost.username,
                style: postTxtStyle(),
              ),
              Row(
                children: [
                  Text('${userPost.time}.'),
                  const Icon(
                    Icons.people,
                    size: 18,
                  )
                ],
              )
            ],
          )
        ],
      );
Widget postImage(UserPost userPost) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(userPost.postImg), fit: BoxFit.fill)),
        ),
      );