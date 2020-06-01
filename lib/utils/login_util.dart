import 'dart:async';
import 'dart:convert';
import 'package:foodieng/data/database_helper.dart';
import 'package:foodieng/models/User.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User> validateUser(User user) async {
    final http.Response response = await http.post(
      "",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toDatabaseJson()),
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      print(json.decode(response.body).toString());
    } else {
      print(json.decode(response.body).toString());
    }
    return user;
  }

  Future<void> persitUser(User user) async {
    //insert to local storage
    await DatabaseHelper.internal().saveUser(user);
  }

  Future<void> deleteToken({int id}) async {
    //await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    bool result = await DatabaseHelper.internal().checkUser(0);
    return result;
  }
}
