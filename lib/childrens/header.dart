import 'package:flutter/material.dart';
import 'package:orion_flutter_exam/defaults.dart';
import 'package:orion_flutter_exam/userdata.dart';

class ProfileHead extends StatefulWidget {
  final Account loggedAccount;
  ProfileHead({required this.loggedAccount, super.key});
  

  @override
  State<ProfileHead> createState() => _ProfileHeadState();
}

class _ProfileHeadState extends State<ProfileHead> {
  
  @override
  Widget build(BuildContext context) {

    styleText() => const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    infoHeader(followers, posts, following) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Followers'),
                Text('Posts'),
                Text('Following'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  followers,
                  style: styleText(),
                ),
                Text(
                  posts,
                  style: styleText(),
                ),
                Text(
                  following,
                  style: styleText(),
                ),
              ],
            )
          ],
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.loggedAccount.img),
          radius: 40,
        ),
        Text(
          widget.loggedAccount.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(
          widget.loggedAccount.email,
        ),
        SizedBox(
          height: 20,
        ),
        infoHeader(widget.loggedAccount.numFollowers, widget.loggedAccount.numPosts, widget.loggedAccount.numFollowing),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
