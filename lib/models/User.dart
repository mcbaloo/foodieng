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

class RegisterUser {
  var userName;
  var password;
  var confirmPassword;
  var firstName;
  var lastName;
  var emailAddress;
  var city;
  var state;
  var country;
  var address;
  RegisterUser(
      this.userName,
      this.password,
      this.confirmPassword,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.city,
      this.state,
      this.country,
      this.address);

  Map<String, dynamic> toEndPoint() => {
        "UserName": this.userName,
        "Password": this.password,
        "ConfirmPassword": this.confirmPassword,
        "FirstName": this.firstName,
        "LastName": this.lastName,
        "EmailAddress": this.emailAddress,
        "City": this.city,
        "State": this.state,
        "Country": this.country,
        "Address": this.address
      };
}
