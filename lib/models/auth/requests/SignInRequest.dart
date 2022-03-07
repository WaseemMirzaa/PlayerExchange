class SignInRequest {
  String? email;
  String? password;
  String? fcmToken;

  SignInRequest({this.email, this.password, this.fcmToken});

  SignInRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['fcmToken'] = this.fcmToken;
    return data;
  }
}