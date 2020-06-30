import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodieng/models/videos.dart';
import 'package:foodieng/data/database_helper.dart';

class VideoUtils {
  final String baseUrl = "http://192.168.56.1/foodie/api/";
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
    await DatabaseHelper.internal().checkUser(1);
  }
}
