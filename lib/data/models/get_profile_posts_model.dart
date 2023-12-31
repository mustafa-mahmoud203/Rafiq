class GetProfilePostsModel {
  List<Posts>? posts;

  GetProfilePostsModel({this.posts});

  GetProfilePostsModel.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(Posts.fromJson(v));
      });
    }
  }
}

class Posts {
  AuthorInfo? authorInfo;
  String? sId;
  Content? content;
  bool? isLiked;
  int? numberOfLikes;
  int? numberOfComments;
  List<String>? shares;
  bool? isShared;
  SharedSource? sharedSource;
  int? iV;
  bool isMore = false;

  Posts(
      {this.authorInfo,
      this.sId,
      this.content,
      this.isLiked,
      this.numberOfLikes,
      this.numberOfComments,
      this.shares,
      this.isShared,
      this.sharedSource,
      this.iV});

  Posts.fromJson(Map<String, dynamic> json) {
    authorInfo = json['authorInfo'] != null
        ? AuthorInfo.fromJson(json['authorInfo'])
        : null;
    sId = json['_id'];
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    isLiked = json['isLiked'];
    numberOfLikes = json['numberOfLikes'];
    numberOfComments = json['numberOfComments'];
    shares = json['shares'].cast<String>();
    isShared = json['isShared'];
    sharedSource = json['sharedSource'] != null
        ? SharedSource.fromJson(json['sharedSource'])
        : null;
    iV = json['__v'];
  }
}

class AuthorInfo {
  String? userName;
  String? firstName;
  String? lastName;
  String? avatar;

  AuthorInfo({this.userName, this.firstName, this.lastName, this.avatar});

  AuthorInfo.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    avatar = json['avatar'];
  }
}

class Content {
  String? text;
  List<String>? files;
  String? sId;

  Content({this.text, this.files, this.sId});

  Content.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    files = json['files'].cast<String>();
    sId = json['_id'];
  }
}

class SharedSource {
  AuthorInfo? authorInfo;
  String? postId;
  String? sId;

  SharedSource({this.authorInfo, this.postId, this.sId});

  SharedSource.fromJson(Map<String, dynamic> json) {
    authorInfo = json['authorInfo'] != null
        ? AuthorInfo.fromJson(json['authorInfo'])
        : null;
    postId = json['postId'];
    sId = json['_id'];
  }
}
