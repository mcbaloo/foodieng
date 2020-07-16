import 'dart:async';
import 'dart:convert';
import 'package:foodieng/data/database_helper.dart';
import 'package:foodieng/models/User.dart';
import 'package:foodieng/models/user_response.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  //final String baseUrl = "https://foodieng.herokuapp.com/api";
  final String baseUrl = "http://192.168.56.1/foodie/api";
  Future<UserResponse> validateUser(User user) async {
    final http.Response response = await http.post(
      "$baseUrl/Account/LoginUser",
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

  Future<RegisterResponse> registerUser(RegisterUser model) async {
    print(model.toEndPoint());
    final http.Response response =
        await http.post("$baseUrl/Account/RegisterUser",
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(model.toEndPoint()));
    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    }
    return null;
  }

  Future<void> persitUser(UserResponse user) async {
    //var use = User(username: user.username, password: "pass");
    //insert to local storage
    await DatabaseHelper.internal().saveUser(user);
  }

  Future<void> deleteToken() async {
    await DatabaseHelper.internal().DeleteUser();
  }

  Future<bool> hasToken() async {
    bool result = await DatabaseHelper.internal().checkUser(1);
    return result;
  }

  Future<UserResponse> getDetails() async {
    return await DatabaseHelper.internal().getUser(1);
  }
}
