import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/childrens/friendslist.dart';
import 'package:orion_flutter_exam/childrens/header.dart';
import 'package:orion_flutter_exam/childrens/posts.dart';
import 'package:orion_flutter_exam/defaults.dart';

class Socmed_page extends StatefulWidget {
  const Socmed_page({super.key});

  @override
  State<Socmed_page> createState() => _Socmed_page();
}

class _Socmed_page extends State<Socmed_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ProfileHead(loggedAccount: UserData().myUserAccount,),
          SizedBox(
            height: 10,
          ),
          FriendsList(),
          SizedBox(height: 10,),
          PostList(posts: UserData())
          
        ],
      ),
    );
  }
}
