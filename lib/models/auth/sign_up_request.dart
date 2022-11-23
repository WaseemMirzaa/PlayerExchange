class SignUpRequest {
  String? name;
  String? email;
  String? password;
  String? fcmToken;
  String? stripeCustomerId;
  String? referCode_My;
  String? referCode_Used;

  SignUpRequest({this.name, this.email, this.password, this.fcmToken, this.stripeCustomerId, this.referCode_My, this. referCode_Used});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    fcmToken = json['fcmToken'];
    stripeCustomerId = json['stripeCustomerId'];
    referCode_My = json['referCode_My'];
    referCode_Used = json['referCode_Used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['fcmToken'] = this.fcmToken;
    data['stripeCustomerId'] = this.stripeCustomerId;
    data['referCode_My'] = this.referCode_My;
    data['referCode_Used'] = this.referCode_Used;
    return data;
  }
}