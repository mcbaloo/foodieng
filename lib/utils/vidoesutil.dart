import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodieng/models/videos.dart';

class VideoUtils {
  Future<VideoModel> getAllVideos() async {
    String url = "http://192.168.56.1/foodie/api/Content/GetAllContents";
    final response = await http.get(url);
    print(response.body);
    return VideoModel.fromParsedJson(json.decode(response.body));
  }
}
