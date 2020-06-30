class UserResponse {
  var username;
  var email;
  var status;
  var profileImage;
  var firstName;
  var lastName;
  var userId;
  List<UserResponse> userList;
  UserResponse(
      {this.username,
      this.email,
      this.status,
      this.profileImage,
      this.firstName,
      this.lastName,
      this.userId});

  // User.map(dynamic obj) {
  //   this._username = obj['username'];
  //   this._password = obj['password'];
  // }
  //String get username => _username;
  //String get password => _password;

  factory UserResponse.fromJson(Map<String, dynamic> json) => (new UserResponse(
      username: json["username"] as String,
      email: json["email"] as String,
      status: json["status"] as String,
      userId: json["userId"] as String,
      //videoUrl: json["unsecured_ur"] as String,
      profileImage: json["profileimage"] as String,
      lastName: json["lastname"] as String,
      firstName: json["firstname"] as String));

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = this.username;
    map["password"] = "password";
    map["profileimage"] = this.profileImage;
    map["firstname"] = this.firstName;
    map["Lastname"] = this.lastName;
    map["email"] = this.email;
    map["userId"] = this.userId;
    return map;
  }

  UserResponse.fromParsedJson(List<dynamic> parsedJson) {
    userList = new List<UserResponse>();
    parsedJson.forEach((v) {
      userList.add(UserResponse.fromJson(v));
    });
  }

  // Map<String, dynamic> toDatabaseJson() =>
  //     {"username": _username, "password": _password};
}
