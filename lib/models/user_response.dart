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
}

class RegisterResponse {
  var firstName;
  var lastName;
  var email;
  var profileImage;
  RegisterResponse(
      {this.firstName, this.lastName, this.email, this.profileImage});
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      (new RegisterResponse(
          firstName: json["firstname"] as String,
          email: json["email"] as String,
          profileImage: json["profileimage"] as String,
          lastName: json["lastname"] as String));
}

class AppResponse {
  var status;
  AppResponse({this.status});
  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      (new AppResponse(status: json["status"] as String));
}
