class UserPost {
  final String userimg;
  final String username;
  final String time;
  final String postContent;
  final String postImg;
  final String numComments;
  final String numShare;
  bool isLiked;

  UserPost(
      {required this.userimg,
      required this.username,
      required this.time,
      required this.postContent,
      required this.postImg,
      required this.numComments,
      required this.numShare,
      required this.isLiked});
}

class Account {
  final String name;
  final String email;
  final String img;
  final String numFollowers;
  final String numPosts;
  final String numFollowing;
  final String numFriends;

  Account(
      {required this.name,
      required this.email,
      required this.img,
      required this.numFollowers,
      required this.numPosts,
      required this.numFollowing,
      required this.numFriends});
}

class UserComment {
  final String commentImg;
  final String commentName;
  final String commentTime;
  final String commentContent;

  UserComment(
      {required this.commentImg,
      required this.commentName,
      required this.commentTime,
      required this.commentContent});
}

class Friend {
  final String img;
  final String name;

  Friend({required this.img, 
  required this.name});
}
