import 'dart:convert';
/// message : "Successfully logged in"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjFkMmMyY2YyLTkxZjEtNDRmMC04MDI1LTRmM2EzNTA0ZTc3MCIsInVzZXJUeXBlIjoiVXNlciIsImlhdCI6MTY0OTY3MzcxNiwiZXhwIjo0Nzk0NjczNzE2fQ._-HpoUrm1fc7cCH0FDyJJfPyHSBypn5OTSP47Jteoo8"
/// user : {"id":"1d2c2cf2-91f1-44f0-8025-4f3a3504e770","name":"sibghat","email":"sibghat@gmail.com","age":0.0,"password":"$2a$10$hVHYzuvgEOdqtis.FEpnMOeujvmjyp4YMzqfCRA/4Xs9pmruHJ/bu","userType":"User","fcmToken":"string","createdAt":"2022-04-05T11:59:50.000Z","secretKey":"","uniqueKey":"cc765e9b-3f48-4a4f-ab94-02b34a1a1698","isBlocked":false,"isActive":true,"profilePicture":"","unInvestedValue":0.0,"totalValue":0.0,"lossGainPercentage":0.0}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
    String? message,
    String? token,
    String? fcmToken,

    User? user,}){
    _message = message;
    _token = token;
    _user = user;
    _fcmToken = fcmToken;

  }

  String? get fcmToken => _fcmToken;

  UserModel.fromJson(dynamic json) {
    _message = json['message'];
    _token = json['token'];
    _fcmToken = json['_fcmToken'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _message;
  String? _token;
  User? _user;
  String? _fcmToken;
  UserModel copyWith({  String? message,
    String? token,
    User? user,
  }) => UserModel(  message: message ?? _message,
    token: token ?? _token,
    user: user ?? _user,
  );
  String? get message => _message;
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['token'] = _token;
    map['fcmToken'] = _fcmToken;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : "1d2c2cf2-91f1-44f0-8025-4f3a3504e770"
/// name : "sibghat"
/// email : "sibghat@gmail.com"
/// age : 0.0
/// password : "$2a$10$hVHYzuvgEOdqtis.FEpnMOeujvmjyp4YMzqfCRA/4Xs9pmruHJ/bu"
/// userType : "User"
/// fcmToken : "string"
/// createdAt : "2022-04-05T11:59:50.000Z"
/// secretKey : ""
/// uniqueKey : "cc765e9b-3f48-4a4f-ab94-02b34a1a1698"
/// isBlocked : false
/// isActive : true
/// profilePicture : ""
/// unInvestedValue : 0.0
/// totalValue : 0.0
/// lossGainPercentage : 0.0
/// stripeCustomerId : ""
/// walletAmount : 0.0

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
    String? id,
    String? name,
    String? email,
    num? age,
    String? password,
    String? userType,
    String? fcmToken,
    String? createdAt,
    String? secretKey,
    String? uniqueKey,
    bool? isBlocked,
    bool? isActive,
    String? profilePicture,
    num? unInvestedValue,
    num? totalValue,
    num? lossGainPercentage,
    String? stripeCustomerId,
    num? walletAmount,
    String? accountId,


  }){
    _id = id;
    name = name;
    _email = email;
    _age = age;
    _password = password;
    _userType = userType;
    fcmToken = fcmToken;
    _createdAt = createdAt;
    _secretKey = secretKey;
    _uniqueKey = uniqueKey;
    _isBlocked = isBlocked;
    _isActive = isActive;
    profilePicture = profilePicture;
    _unInvestedValue = unInvestedValue;
    totalValue = totalValue;
    _lossGainPercentage = lossGainPercentage;
    stripeCustomerId = stripeCustomerId;
    walletAmount = walletAmount;
    accountId = accountId;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    name = json['name'] ?? "";
    _email = json['email'] ?? "";
    _age = json['age'] ?? 0.0;
    _password = json['password'] ?? "";
    _userType = json['userType'] ?? "";
    fcmToken = json['fcmToken'] ?? "";
    _createdAt = json['createdAt'] ?? new DateTime.now().toString();
    _secretKey = json['secretKey'] ?? "";
    _uniqueKey = json['uniqueKey'] ?? "";
    _isBlocked = json['isBlocked'] ?? true;
    _isActive = json['isActive'] ?? true;
    profilePicture = json['profilePicture']  ?? "";
    _unInvestedValue = json['unInvestedValue']  ?? 0.0;
    totalValue = json['totalValue'] ?? 0.0;
    _lossGainPercentage = json['lossGainPercentage'] ?? 0.0;
    stripeCustomerId = json['stripeCustomerId'] ?? "";
    walletAmount = json['walletAmount'] ?? 0.0;
    accountId = json['accountId'] ?? "";

  }
  String? _id;
  String? name;
  String? _email;
  num? _age;
  String? _password;
  String? _userType;
  String? fcmToken;
  String? _createdAt;
  String? _secretKey;
  String? _uniqueKey;
  bool? _isBlocked;
  bool? _isActive;
  String? profilePicture;
  num? _unInvestedValue;
  num? totalValue;
  num? _lossGainPercentage;
  String? stripeCustomerId;
  num? walletAmount;
  String? accountId;

  String? get id => _id;
  String? get email => _email;
  num? get age => _age;
  User copyWith({  String? id,
    String? name,
    String? email,
    num? age,
    String? password,
    String? userType,
    String? fcmToken,
    String? createdAt,
    String? secretKey,
    String? uniqueKey,
    bool? isBlocked,
    bool? isActive,
    String? profilePicture,
    num? unInvestedValue,
    num? totalValue,
    num? lossGainPercentage,
    String? stripeCustomerId,
    num? walletAmount,
    String? accountId,
  }) => User(  id: id ?? _id,
    name: name ?? name,
    email: email ?? _email,
    age: age ?? _age,
    password: password ?? _password,
    userType: userType ?? _userType,
    fcmToken: fcmToken ?? fcmToken,
    createdAt: createdAt ?? _createdAt,
    secretKey: secretKey ?? _secretKey,
    uniqueKey: uniqueKey ?? _uniqueKey,
    isBlocked: isBlocked ?? _isBlocked,
    isActive: isActive ?? _isActive,
    profilePicture: profilePicture ?? profilePicture,
    unInvestedValue: unInvestedValue ?? _unInvestedValue,
    totalValue: totalValue ?? totalValue,
    lossGainPercentage: lossGainPercentage ?? _lossGainPercentage,
    stripeCustomerId: stripeCustomerId ?? stripeCustomerId,
    walletAmount: walletAmount ?? walletAmount,
    accountId: accountId ?? accountId,

  );
  // String? get name => name;
  String? get password => _password;
  String? get userType => _userType;
  // String? get fcmToken => _fcmToken;
  String? get createdAt => _createdAt;
  String? get secretKey => _secretKey;
  String? get uniqueKey => _uniqueKey;
  bool? get isBlocked => _isBlocked;
  bool? get isActive => _isActive;
  // String? get profilePicture => profilePicture;
  num? get unInvestedValue => _unInvestedValue;
  // num? get totalValue => totalValue;
  num? get lossGainPercentage => _lossGainPercentage;
  // String? get stripeCustomerId => stripeCustomerId;
  // String? get walletAmount => walletAmount;
  // String? get accountId => accountId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = name;
    map['email'] = _email;
    map['age'] = _age;
    map['password'] = _password;
    map['userType'] = _userType;
    map['fcmToken'] = fcmToken;
    map['createdAt'] = _createdAt;
    map['secretKey'] = _secretKey;
    map['uniqueKey'] = _uniqueKey;
    map['isBlocked'] = _isBlocked;
    map['isActive'] = _isActive;
    map['profilePicture'] = profilePicture;
    map['unInvestedValue'] = _unInvestedValue;
    map['totalValue'] = totalValue;
    map['lossGainPercentage'] = _lossGainPercentage;
    map['stripeCustomerId'] = stripeCustomerId;
    map['walletAmount'] = walletAmount;
    map['accountId'] = accountId;
    return map;
  }

}