import 'dart:convert';
import 'dart:io';
import 'package:foodieng/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentUtil {
  final String baseUrl = "http://192.168.56.1/foodie/api/";

  Future<CommentModel> getAllComments(String commentId) async {
    String url = "${baseUrl}Comment/GetContentComments/$commentId";
    final response = await http.get(url);
    return CommentModel.fromParsedJson(json.decode(response.body));
  }

  Future<PostComment> addComment(PostComment comment) async {
    String url = "${baseUrl}Comment/AddComment";

    final http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(comment.toDatabaseJson()));

    if (response.statusCode == 200) {
      return PostComment.fromJson(json.decode(response.body));
    }
    PostComment postComment = PostComment();
    return postComment;
  }
}
