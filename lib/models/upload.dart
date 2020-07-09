import 'dart:io';

class Upload {
  var title;
  var description;
  var userId;
  var file;
  var category;
  var duration;
  File image;
  Upload(
      {this.file,
      this.description,
      this.userId,
      this.title,
      this.category,
      this.duration});

  factory Upload.fromDatabaseJson(Map<String, dynamic> json) => (new Upload(
      title: json["title"] as String,
      duration: json["duration"] as String,
      description: json["description"] as String,
      category: json["category"] as String,
      file: json["content_url"] as String));

  Map<String, dynamic> toDatabase() {
    var map = new Map<String, dynamic>();
    map["file"] = this.file;
    map["title"] = this.title;
    map["description"] = this.description;
    map["duration"] = this.duration;
    map["UserId"] = this.userId;
    map["category"] = this.duration;
    return map;
  }
}
