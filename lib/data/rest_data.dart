import 'package:foodieng/models/User.dart';
import 'package:foodieng/utils/network_util.dart';

class RestData {
  NetworkUtil _networkutil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "";

  Future<User> login(String username, String password) {
    return null;
  }
}
