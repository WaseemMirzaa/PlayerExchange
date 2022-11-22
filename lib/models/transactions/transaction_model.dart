import 'dart:convert';
/// id : "string"
/// userId : "string"
/// type : "string"
/// paymentType : "string"
/// amount : 0
/// shares : 0
/// playerId : "string"
/// playerName : "string"
/// createdAt : "2022-06-21T11:19:50.508Z"

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));
String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

List<TransactionModel> transactionModelListFromJson(String str) =>
    List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelListToJson(List<TransactionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  TransactionModel({
      String? id, 
      String? userId, 
      String? userEmail,
      String? type,
      String? paymentType, 
      num? amount,
      num? shares,
      String? playerId, 
      String? playerName,
      String? createdAt,}){
    _id = id;
    _userId = userId;
    _userEmail = userEmail;
    _type = type;
    _paymentType = paymentType;
    _amount = amount;
    _shares = shares;
    _playerId = playerId;
    _playerName = playerName;
    _createdAt = createdAt;
}

  TransactionModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _userEmail = json['userEmail'];
    _type = json['type'];
    _paymentType = json['paymentType'];
    _amount = json['amount'];
    _shares = json['shares'];
    _playerId = json['playerId'];
    _playerName = json['playerName'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _userId;
  String? _userEmail;
  String? _type;
  String? _paymentType;
  num? _amount;
  num? _shares;
  String? _playerId;
  String? _playerName;
  String? _createdAt;
TransactionModel copyWith({  String? id,
  String? userId,
  String? userEmail,
  String? type,
  String? paymentType,
  num? amount,
  num? shares,
  String? playerId,
  String? playerName,
  String? createdAt,
}) => TransactionModel(  id: id ?? _id,
  userId: userId ?? _userId,
  userEmail: userEmail ?? _userEmail,
  type: type ?? _type,
  paymentType: paymentType ?? _paymentType,
  amount: amount ?? _amount,
  shares: shares ?? _shares,
  playerId: playerId ?? _playerId,
  playerName: playerName ?? _playerName,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get userEmail => _userEmail;
  String? get type => _type;
  String? get paymentType => _paymentType;
  num? get amount => _amount;
  num? get shares => _shares;
  String? get playerId => _playerId;
  String? get playerName => _playerName;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['userEmail'] = _userEmail;
    map['type'] = _type;
    map['paymentType'] = _paymentType;
    map['amount'] = _amount;
    map['shares'] = _shares;
    map['playerId'] = _playerId;
    map['playerName'] = _playerName;
    map['createdAt'] = _createdAt;
    return map;
  }

}