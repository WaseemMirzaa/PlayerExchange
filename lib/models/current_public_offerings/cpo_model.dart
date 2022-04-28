import 'dart:convert';
/// id : "58d12700-dbfd-4598-9359-89b432d3eff5"
/// playerName : "Kyle Fuller"
/// profilePicture : ""
/// playerId : "054f4c09-6bc9-49c9-a466-80abd2a39e74"
/// video : "https://playerexchange.s3.amazonaws.com/attachments/333e8e71-2a0e-4a52-b9df-e0a535f3b132.mp4"
/// currentPricePerShare : 10
/// sharePurchased : 0
/// sharesAvailable : 1000000
/// position : "QB"
/// tiersId : "dc2f3556-fdfc-42e7-93a3-d93c3a5b58bb"
/// tiers : {"id":"dc2f3556-fdfc-42e7-93a3-d93c3a5b58bb","name":"Tier 2","pricePerShare":10,"availableShare":1000000,"position":"QB","createdAt":"2022-02-13T14:56:10.000Z","isActive":true}

CpoModel cpoModelFromJson(String str) => CpoModel.fromJson(json.decode(str));
String cpoModelToJson(CpoModel data) => json.encode(data.toJson());

List<CpoModel> cpoModelListFromJson(String str) =>
    List<CpoModel>.from(json.decode(str).map((x) => CpoModel.fromJson(x)));

String cpoModelListToJson(List<CpoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class CpoModel {
  CpoModel({
      String? id, 
      String? playerName, 
      String? profilePicture, 
      String? playerId, 
      String? video, 
      num? currentPricePerShare,
      int? sharePurchased, 
      int? sharesAvailable, 
      int? totalShares,
      String? position,
      String? tiersId, 
      Tiers? tiers,}){
    _id = id;
    _playerName = playerName;
    _profilePicture = profilePicture;
    _playerId = playerId;
    _video = video;
    _currentPricePerShare = currentPricePerShare;
    _sharePurchased = sharePurchased;
    _sharesAvailable = sharesAvailable;
    _totalShares = totalShares;
    _position = position;
    _tiersId = tiersId;
    _tiers = tiers;
}

  CpoModel.fromJson(dynamic json) {
    _id = json['id'];
    _playerName = json['playerName'] ?? "";
    _profilePicture = json['profilePicture'] ?? "";
    _playerId = json['playerId'] ?? "";
    _video = json['video'] ?? "";
    _currentPricePerShare = json['currentPricePerShare'] ?? 0.0;
    _sharePurchased = json['sharePurchased'] ?? 0.0;
    _sharesAvailable = json['sharesAvailable'] ?? 0.0;
    _totalShares = json['totalShares'] ?? 0.0;
    _position = json['position'] ?? "";
    _tiersId = json['tiersId']?? "";
    _tiers = json['tiers'] != null ? Tiers.fromJson(json['tiers']) : null;
  }
  String? _id;
  String? _playerName;
  String? _profilePicture;
  String? _playerId;
  String? _video;
  num? _currentPricePerShare;
  int? _sharePurchased;
  int? _sharesAvailable;
  int? _totalShares;
  String? _position;
  String? _tiersId;
  Tiers? _tiers;

  String? get id => _id;
  String? get playerName => _playerName;
  String? get profilePicture => _profilePicture;
  String? get playerId => _playerId;
  String? get video => _video;
  num? get currentPricePerShare => _currentPricePerShare;
  int? get sharePurchased => _sharePurchased;
  int? get sharesAvailable => _sharesAvailable;
  int? get totalShares => _totalShares;
  String? get position => _position;
  String? get tiersId => _tiersId;
  Tiers? get tiers => _tiers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['playerName'] = _playerName;
    map['profilePicture'] = _profilePicture;
    map['playerId'] = _playerId;
    map['video'] = _video;
    map['currentPricePerShare'] = _currentPricePerShare;
    map['sharePurchased'] = _sharePurchased;
    map['sharesAvailable'] = _sharesAvailable;
    map['totalShares'] = _totalShares;
    map['position'] = _position;
    map['tiersId'] = _tiersId;
    if (_tiers != null) {
      map['tiers'] = _tiers?.toJson();
    }
    return map;
  }

}

/// id : "dc2f3556-fdfc-42e7-93a3-d93c3a5b58bb"
/// name : "Tier 2"
/// pricePerShare : 10
/// availableShare : 1000000
/// position : "QB"
/// createdAt : "2022-02-13T14:56:10.000Z"
/// isActive : true

Tiers tiersFromJson(String str) => Tiers.fromJson(json.decode(str));
String tiersToJson(Tiers data) => json.encode(data.toJson());
class Tiers {
  Tiers({
      String? id, 
      String? name, 
      int? pricePerShare, 
      int? availableShare, 
      String? position, 
      String? createdAt, 
      bool? isActive,}){
    _id = id;
    _name = name;
    _pricePerShare = pricePerShare;
    _availableShare = availableShare;
    _position = position;
    _createdAt = createdAt;
    _isActive = isActive;
}

  Tiers.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _pricePerShare = json['pricePerShare'];
    _availableShare = json['availableShare'];
    _position = json['position'];
    _createdAt = json['createdAt'];
    _isActive = json['isActive'];
  }
  String? _id;
  String? _name;
  int? _pricePerShare;
  int? _availableShare;
  String? _position;
  String? _createdAt;
  bool? _isActive;

  String? get id => _id;
  String? get name => _name;
  int? get pricePerShare => _pricePerShare;
  int? get availableShare => _availableShare;
  String? get position => _position;
  String? get createdAt => _createdAt;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['pricePerShare'] = _pricePerShare;
    map['availableShare'] = _availableShare;
    map['position'] = _position;
    map['createdAt'] = _createdAt;
    map['isActive'] = _isActive;
    return map;
  }

}