class UserResponse {
String? message;
User? user;

UserResponse({this.message, this.user});

UserResponse.fromJson(Map<String, dynamic> json) {
message = json['message'];
user = json['user'] != null ? new User.fromJson(json['user']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['message'] = this.message;
  if (this.user != null) {
    data['user'] = this.user!.toJson();
  }
  return data;
}
}

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? userType;
  String? fcmToken;
  String? createdAt;
  String? uniqueKey;
  bool? isBlocked;
  bool? isActive;

  User(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.userType,
        this.fcmToken,
        this.createdAt,
        this.uniqueKey,
        this.isBlocked,
        this.isActive});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    userType = json['userType'];
    fcmToken = json['fcmToken'];
    createdAt = json['createdAt'];
    uniqueKey = json['uniqueKey'];
    isBlocked = json['isBlocked'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['userType'] = this.userType;
    data['fcmToken'] = this.fcmToken;
    data['createdAt'] = this.createdAt;
    data['uniqueKey'] = this.uniqueKey;
    data['isBlocked'] = this.isBlocked;
    data['isActive'] = this.isActive;
    return data;
  }
}