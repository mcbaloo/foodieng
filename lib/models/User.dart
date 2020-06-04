class User {
  String username;
  String password;

  User({this.username, this.password});

  User.map(dynamic obj) {
    this.username = obj['username'];
    this.password = obj['password'];
  }
  // String get username => _username;
  // String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = this.username;
    map["password"] = this.password;
    return map;
  }

  Map<String, dynamic> toDatabaseJson() =>
      {"username": this.username, "password": this.password};

  Map<String, dynamic> toDatabaseApi() =>
      {"UserName": this.username, "Password": this.password};

  factory User.fromJson(Map<String, dynamic> json) => (new User(
      username: json["userName"] as String, password: json["email"] as String));
}
