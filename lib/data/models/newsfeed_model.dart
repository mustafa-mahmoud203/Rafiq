class NewsfeedModel {
  List<NewsFeed>? newsFeed;

  NewsfeedModel({this.newsFeed});

  NewsfeedModel.fromJson(Map<String, dynamic> json) {
    if (json['newsFeed'] != null) {
      newsFeed = <NewsFeed>[];
      for (int i = 0; i < json['newsFeed'].length; i++) {
        newsFeed!.add(NewsFeed.fromJson(json['newsFeed'][i]));
      }
    }
  }
}

class NewsFeed {
  AuthorInfo? authorInfo;
  Content? content;
  bool? isLiked;
  int? numberOfLikes;
  int? numberOfComments;
  List<String>? shares;
  bool? isShared;
  SharedSource? sharedSource;
  String? sId;
  bool isMore = false;

  NewsFeed(
      {this.authorInfo,
      this.content,
      this.isLiked,
      this.numberOfLikes,
      this.numberOfComments,
      this.shares,
      this.isShared,
      this.sharedSource,
      this.sId});

  NewsFeed.fromJson(Map<String, dynamic> json) {
    authorInfo = json['authorInfo'] != null
        ? AuthorInfo.fromJson(json['authorInfo'])
        : null;
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
    sId = json['_id'];
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
