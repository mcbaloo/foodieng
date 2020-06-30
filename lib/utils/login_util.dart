import 'dart:async';
import 'dart:convert';
import 'package:foodieng/data/database_helper.dart';
import 'package:foodieng/models/User.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserResponse> validateUser(User user) async {
    final http.Response response = await http.post(
      "http://192.168.56.1/foodie/api/Account/LoginUser",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toDatabaseJson()),
    );
    if (response.statusCode == 200) {
      //print(json.decode(response.body).toString());
    } else {
      //print(json.decode(response.body).toString());
    }
    return UserResponse.fromJson(json.decode(response.body));
  }

  Future<void> persitUser(UserResponse user) async {
    //var use = User(username: user.username, password: "pass");
    //insert to local storage
    await DatabaseHelper.internal().saveUser(user);
  }

  Future<void> deleteToken({int id}) async {
    //await userDao.deleteUser(id);
    print("deleted");
  }

  Future<bool> hasToken() async {
    bool result = await DatabaseHelper.internal().checkUser(1);
    print(result);
    return result;
  }

  Future<UserResponse> getDetails() async {
    return await DatabaseHelper.internal().getUser(1);
  }
}
