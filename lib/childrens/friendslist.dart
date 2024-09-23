import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/defaults.dart';
import 'package:orion_flutter_exam/userdata.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({super.key});

  @override
  State<FriendsList> createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  friendCard(Friend friend) => Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(friend.img),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(friend.name),
            )
          ],
        ),
      );
  friendListGrid() => GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 180,
        ),
        itemCount: UserData().friendList.length,
        itemBuilder: (BuildContext context, int index) {
          return friendCard(UserData().friendList[index]);
        },
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friends',
            style: styleText(size: 20.0, bold: true),
          ),
          Text(
            '${UserData().myUserAccount.numFriends} Friends',
            style: styleText(size: 15),
          ),
          SizedBox(
            height: 10,
          ),
          friendListGrid(),
        ],
      ),
    );
  }
}
