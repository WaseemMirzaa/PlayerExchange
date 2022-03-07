import 'dart:convert';

List<CpoModel> cpoListFromJson(String str) => List<CpoModel>.from(json.decode(str).map((x) => CpoModel.fromJson(x)));


CpoModel cpoModelFromJson(String str) => CpoModel.fromJson(json.decode(str));
String cpoModelToJson(CpoModel data) => json.encode(data.toJson());
class CpoModel {
  CpoModel({
      String? id, 
      String? playerName, 
      String? profilePicture, 
      String? playerId, 
      String? video, 
      int? currentPricePerShare, 
      int? sharePurchased, 
      int? sharesAvailable, 
      String? position, 
      String? tiersId,}){
    _id = id;
    _playerName = playerName;
    _profilePicture = profilePicture;
    _playerId = playerId;
    _video = video;
    _currentPricePerShare = currentPricePerShare;
    _sharePurchased = sharePurchased;
    _sharesAvailable = sharesAvailable;
    _position = position;
    _tiersId = tiersId;
}

  CpoModel.fromJson(dynamic json) {
    _id = json['id'];
    _playerName = json['playerName'];
    _profilePicture = json['profilePicture'];
    _playerId = json['playerId'];
    _video = json['video'];
    _currentPricePerShare = json['currentPricePerShare'];
    _sharePurchased = json['sharePurchased'];
    _sharesAvailable = json['sharesAvailable'];
    _position = json['position'];
    _tiersId = json['tiersId'];
  }
  String? _id;
  String? _playerName;
  String? _profilePicture;
  String? _playerId;
  String? _video;
  int? _currentPricePerShare;
  int? _sharePurchased;
  int? _sharesAvailable;
  String? _position;
  String? _tiersId;

  String? get id => _id;
  String? get playerName => _playerName;
  String? get profilePicture => _profilePicture;
  String? get playerId => _playerId;
  String? get video => _video;
  int? get currentPricePerShare => _currentPricePerShare;
  int? get sharePurchased => _sharePurchased;
  int? get sharesAvailable => _sharesAvailable;
  String? get position => _position;
  String? get tiersId => _tiersId;

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
    map['position'] = _position;
    map['tiersId'] = _tiersId;
    return map;
  }

}