class CommentModel {
  var comment;
  var dateCreated;
  var commenter;
  var commenterImage;
  var id;
  var commentId;
  List<CommentModel> commentList;
  CommentModel(
      {this.comment,
      this.dateCreated,
      this.commenter,
      this.commenterImage,
      this.commentList,
      this.id,
      this.commentId});

  factory CommentModel.fromJson(Map<String, dynamic> json) => (new CommentModel(
      comment: json["comment"] as String,
      dateCreated: json["date_created"] as String,
      commenter: json["commenter"] as String,
      commenterImage: json["commneter_image"] as String));

  CommentModel.fromParsedJson(List<dynamic> parsedJson) {
    commentList = new List<CommentModel>();
    parsedJson.forEach((v) {
      commentList.add(CommentModel.fromJson(v));
    });
  }
}

class PostComment {
  var userId;
  var comment;
  var contentId;
  PostComment({this.userId, this.comment, this.contentId});

  Map<String, dynamic> toDatabaseJson() => {
        "UserId": this.userId,
        "comment": this.comment,
        "ContentId": this.contentId
      };

  factory PostComment.fromJson(Map<String, dynamic> json) => (new PostComment(
      comment: json["comment"] as String,
      contentId: json["ContentId"] as String,
      userId: json["UserId"] as String));
}
