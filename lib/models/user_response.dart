class UserResponse {
  String _username;
  String _password;
  String _status;

  UserResponse(this._username, this._password, this._status);

  // User.map(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }
  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

  Map<String, dynamic> toDatabaseJson() =>
      {"username": _username, "password": _password};
}
