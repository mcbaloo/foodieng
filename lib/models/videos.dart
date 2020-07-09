class VideoModel {
  var title;
  var uploader;
  var description;
  var duration;
  var like;
  var comment;
  var views;
  var videoUrl;
  var uploaderImg;
  var uploadedDate;
  var contentId;
  List<VideoModel> videoList;
  VideoModel(
      {this.title,
      this.uploader,
      this.description,
      this.duration,
      this.like,
      this.comment,
      this.videoUrl,
      this.views,
      this.videoList,
      this.uploaderImg,
      this.uploadedDate,
      this.contentId});
  factory VideoModel.fromJson(Map<String, dynamic> json) => (new VideoModel(
      title: json["title"] as String,
      duration: json["duration"] as String,
      description: json["description"] as String,
      contentId: json["id"] as String,
      //videoUrl: json["unsecured_ur"] as String,
      videoUrl: json["content_url"] as String,
      uploader: json["first_name"] as String,
      uploadedDate: json["uploaded_time"] as String));

  VideoModel.fromParsedJson(List<dynamic> parsedJson) {
    videoList = new List<VideoModel>();
    parsedJson.forEach((v) {
      videoList.add(VideoModel.fromJson(v));
    });
  }
  VideoModel.fromParsedDatabaseJson(List<dynamic> parsedJson) {
    videoList = new List<VideoModel>();
    parsedJson.forEach((v) {
      videoList.add(VideoModel.fromDatabaseJson(v));
    });
  }
  factory VideoModel.fromDatabaseJson(Map<String, dynamic> json) =>
      (new VideoModel(
          title: json["title"] as String,
          duration: json["duration"] as String,
          description: json["description"] as String,
          contentId: json["contentId"] as String,
          //videoUrl: json["unsecured_ur"] as String,
          videoUrl: json["content_url"] as String,
          uploader: json["first_name"] as String,
          uploadedDate: json["uploaded_time"] as String));
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["first_name"] = this.uploader;
    map["content_url"] = this.videoUrl;
    map["duration"] = this.duration;
    map["title"] = this.title;
    map["contentId"] = this.contentId;
    return map;
  }
}
