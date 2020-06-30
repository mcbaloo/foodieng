import 'package:foodieng/models/User.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:foodieng/models/videos.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, "foodiengDb");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "Create Table User(id INTEGER PRIMARY KEY, username TEXT, password TEXT, profileimage TEXT, firstname TEXT, Lastname TEXT, email TEXT, userId TEXT)");
    await db.execute(
        "Create Table RecentVideo(id INTEGER PRIMARY KEY, videoUrl TEXT, duration TEXT, firstname TEXT, title TEXT)");
  }

//insertion
  Future<int> saveUser(UserResponse user) async {
    var oldUser = User(password: "pass", username: user.username);
    await DeleteUser(oldUser);
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    await checkUser(0);
    return res;
  }

  Future<int> saveRecent(VideoModel videoModel) async {
    var currentVideos = await getRecentVideos(0);
    if (currentVideos.length >= 5) {
      await deleteVideo(4);
    }
    var dbClient = await db;
    int res = await dbClient.insert("RecentVideo", videoModel.toMap());
    return res;
  }

  //deletion
  Future<int> DeleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
  //check user

  Future<bool> checkUser(int id) async {
    var dbClient = await db;
    try {
      List<Map> users =
          await dbClient.query("User", where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<UserResponse> getUser(int id) async {
    var dbClient = await db;
    var user = await dbClient.query("User", where: 'id = ?', whereArgs: [id]);
    return UserResponse.fromJson(user[0]);
  }

  Future<int> deleteVideo(id) async {
    var dbClient = await db;
    int res =
        await dbClient.delete("RecentVideo", where: 'id=?', whereArgs: id);
    return res;
  }

  Future<List> getRecentVideos(int id) async {
    var dbClient = await db;
    var videos =
        await dbClient.query("RecentVideo", where: 'id=?', whereArgs: [id]);
    return videos;
  }
}
