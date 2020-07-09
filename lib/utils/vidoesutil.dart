import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:foodieng/models/upload.dart';
import 'package:http/http.dart' as http;
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/data/database_helper.dart';

class VideoUtils {
  final String baseUrl = "https://foodieng.herokuapp.com/api";
  //"http://192.168.56.1/foodie/api/";
  Future<VideoModel> getAllVideos() async {
    String url = "${baseUrl}Content/GetAllContents";
    final response = await http.get(url);
    // print(response.body);
    return VideoModel.fromParsedJson(json.decode(response.body));
  }

  Future<VideoModel> getTrendingContent({String type}) async {
    String url = "${baseUrl}Content/GetTrendingContents/$type";
    final response = await http.get(url);
    return VideoModel.fromParsedJson(json.decode(response.body));
  }

  Future<VideoModel> getReceipeContent({String type}) async {
    String url = "${baseUrl}Content/GetContentsbyReceipe/$type";
    final response = await http.get(url);
    return VideoModel.fromParsedJson(json.decode(response.body));
  }

  Future<VideoModel> getTrendingReceipeContent() async {
    String url = "${baseUrl}Content/GetAllRecipes";
    final response = await http.get(url);
    return VideoModel.fromParsedJson(json.decode(response.body));
  }

  Future<void> persistRecent(VideoModel video) async {
    await DatabaseHelper.internal().saveRecent(video);
  }

  Future<VideoModel> getRecentVideos() async {
    var recent = await DatabaseHelper.internal().getRecentVideos();
    return VideoModel.fromParsedDatabaseJson(recent);
  }

  Future<VideoModel> getUserVideos(String userId) async {
    String url = "${baseUrl}Content/GetContentByUser/$userId";
    final response = await http.get(url);
    return VideoModel.fromParsedDatabaseJson(json.decode(response.body));
  }

  Future<Upload> uploadVideo(Upload content) async {
    Dio dio = Dio();
    String url = "${baseUrl}Content/CreateContent";
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(content.file),
      "title": content.title,
      "description": content.description,
      "UserId": content.userId,
      "duration": content.duration,
      "category": content.category
    });
    var result = await dio.post(url, data: data);
    if (result.statusCode == 200) {
      print(result.data);
      return Upload.fromDatabaseJson(result.data);
    } else {
      Upload upload = Upload();
      return upload;
    }
  }
}
