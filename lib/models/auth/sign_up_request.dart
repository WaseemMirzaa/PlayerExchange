class SignUpRequest {
  String? name;
  String? email;
  String? password;
  String? fcmToken;
  String? stripeCustomerId;

  SignUpRequest({this.name, this.email, this.password, this.fcmToken, this.stripeCustomerId});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    fcmToken = json['fcmToken'];
    stripeCustomerId = json['stripeCustomerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fcmToken'] = this.fcmToken;
    data['stripeCustomerId'] = this.stripeCustomerId;
    return data;
  }
}