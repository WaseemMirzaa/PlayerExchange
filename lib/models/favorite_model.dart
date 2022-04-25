import 'dart:convert';

import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
/// id : "string"
/// userId : "string"
/// cpoAthletesId : "string"
/// cpoAthletes : {"id":"string","playerName":"string","profilePicture":"string","playerId":"string","video":"string","currentPricePerShare":0,"sharePurchased":0,"sharesAvailable":0,"position":"QB","tiersId":"string","tiers":{"id":"string","name":"string","pricePerShare":0,"availableShare":0,"position":"QB","createdAt":"2022-04-22T06:12:09.407Z","isActive":true}}

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));
String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());
List<FavoriteModel> favoriteModelListFromJson(String str) =>
    List<FavoriteModel>.from(json.decode(str).map((x) => FavoriteModel.fromJson(x)));

class FavoriteModel {
  FavoriteModel({
      String? id, 
      String? userId, 
      String? cpoAthletesId,
    CpoModel? cpoAthletes,}){
    _id = id;
    _userId = userId;
    _cpoAthletesId = cpoAthletesId;
    _cpoAthletes = cpoAthletes;
}

  FavoriteModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _cpoAthletesId = json['cpoAthletesId'];
    _cpoAthletes = json['cpoAthletes'] != null ? CpoModel.fromJson(json['cpoAthletes']) : null;
  }
  String? _id;
  String? _userId;
  String? _cpoAthletesId;
  CpoModel? _cpoAthletes;
FavoriteModel copyWith({  String? id,
  String? userId,
  String? cpoAthletesId,
  CpoModel? cpoAthletes,
}) => FavoriteModel(  id: id ?? _id,
  userId: userId ?? _userId,
  cpoAthletesId: cpoAthletesId ?? _cpoAthletesId,
  cpoAthletes: cpoAthletes ?? _cpoAthletes,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get cpoAthletesId => _cpoAthletesId;
  CpoModel? get cpoAthletes => _cpoAthletes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['cpoAthletesId'] = _cpoAthletesId;
    if (_cpoAthletes != null) {
      map['cpoAthletes'] = _cpoAthletes?.toJson();
    }
    return map;
  }

}

/// id : "string"
/// playerName : "string"
/// profilePicture : "string"
/// playerId : "string"
/// video : "string"
/// currentPricePerShare : 0
/// sharePurchased : 0
/// sharesAvailable : 0
/// position : "QB"
/// tiersId : "string"
/// tiers : {"id":"string","name":"string","pricePerShare":0,"availableShare":0,"position":"QB","createdAt":"2022-04-22T06:12:09.407Z","isActive":true}

// CpoAthletes cpoAthletesFromJson(String str) => CpoAthletes.fromJson(json.decode(str));
// String cpoAthletesToJson(CpoAthletes data) => json.encode(data.toJson());
// class CpoAthletes {
//   CpoAthletes({
//       String? id,
//       String? playerName,
//       String? profilePicture,
//       String? playerId,
//       String? video,
//       int? currentPricePerShare,
//       int? sharePurchased,
//       int? sharesAvailable,
//       String? position,
//       String? tiersId,
//       Tiers? tiers,}){
//     _id = id;
//     _playerName = playerName;
//     _profilePicture = profilePicture;
//     _playerId = playerId;
//     _video = video;
//     _currentPricePerShare = currentPricePerShare;
//     _sharePurchased = sharePurchased;
//     _sharesAvailable = sharesAvailable;
//     _position = position;
//     _tiersId = tiersId;
//     _tiers = tiers;
// }
//
//   CpoAthletes.fromJson(dynamic json) {
//     _id = json['id'];
//     _playerName = json['playerName'];
//     _profilePicture = json['profilePicture'];
//     _playerId = json['playerId'];
//     _video = json['video'];
//     _currentPricePerShare = json['currentPricePerShare'];
//     _sharePurchased = json['sharePurchased'];
//     _sharesAvailable = json['sharesAvailable'];
//     _position = json['position'];
//     _tiersId = json['tiersId'];
//     _tiers = json['tiers'] != null ? Tiers.fromJson(json['tiers']) : null;
//   }
//   String? _id;
//   String? _playerName;
//   String? _profilePicture;
//   String? _playerId;
//   String? _video;
//   int? _currentPricePerShare;
//   int? _sharePurchased;
//   int? _sharesAvailable;
//   String? _position;
//   String? _tiersId;
//   Tiers? _tiers;
// CpoAthletes copyWith({  String? id,
//   String? playerName,
//   String? profilePicture,
//   String? playerId,
//   String? video,
//   int? currentPricePerShare,
//   int? sharePurchased,
//   int? sharesAvailable,
//   String? position,
//   String? tiersId,
//   Tiers? tiers,
// }) => CpoAthletes(  id: id ?? _id,
//   playerName: playerName ?? _playerName,
//   profilePicture: profilePicture ?? _profilePicture,
//   playerId: playerId ?? _playerId,
//   video: video ?? _video,
//   currentPricePerShare: currentPricePerShare ?? _currentPricePerShare,
//   sharePurchased: sharePurchased ?? _sharePurchased,
//   sharesAvailable: sharesAvailable ?? _sharesAvailable,
//   position: position ?? _position,
//   tiersId: tiersId ?? _tiersId,
//   tiers: tiers ?? _tiers,
// );
//   String? get id => _id;
//   String? get playerName => _playerName;
//   String? get profilePicture => _profilePicture;
//   String? get playerId => _playerId;
//   String? get video => _video;
//   int? get currentPricePerShare => _currentPricePerShare;
//   int? get sharePurchased => _sharePurchased;
//   int? get sharesAvailable => _sharesAvailable;
//   String? get position => _position;
//   String? get tiersId => _tiersId;
//   Tiers? get tiers => _tiers;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['playerName'] = _playerName;
//     map['profilePicture'] = _profilePicture;
//     map['playerId'] = _playerId;
//     map['video'] = _video;
//     map['currentPricePerShare'] = _currentPricePerShare;
//     map['sharePurchased'] = _sharePurchased;
//     map['sharesAvailable'] = _sharesAvailable;
//     map['position'] = _position;
//     map['tiersId'] = _tiersId;
//     if (_tiers != null) {
//       map['tiers'] = _tiers?.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// id : "string"
// /// name : "string"
// /// pricePerShare : 0
// /// availableShare : 0
// /// position : "QB"
// /// createdAt : "2022-04-22T06:12:09.407Z"
// /// isActive : true
//
// Tiers tiersFromJson(String str) => Tiers.fromJson(json.decode(str));
// String tiersToJson(Tiers data) => json.encode(data.toJson());
// class Tiers {
//   Tiers({
//       String? id,
//       String? name,
//       int? pricePerShare,
//       int? availableShare,
//       String? position,
//       String? createdAt,
//       bool? isActive,}){
//     _id = id;
//     _name = name;
//     _pricePerShare = pricePerShare;
//     _availableShare = availableShare;
//     _position = position;
//     _createdAt = createdAt;
//     _isActive = isActive;
// }
//
//   Tiers.fromJson(dynamic json) {
//     _id = json['id'];
//     _name = json['name'];
//     _pricePerShare = json['pricePerShare'];
//     _availableShare = json['availableShare'];
//     _position = json['position'];
//     _createdAt = json['createdAt'];
//     _isActive = json['isActive'];
//   }
//   String? _id;
//   String? _name;
//   int? _pricePerShare;
//   int? _availableShare;
//   String? _position;
//   String? _createdAt;
//   bool? _isActive;
// Tiers copyWith({  String? id,
//   String? name,
//   int? pricePerShare,
//   int? availableShare,
//   String? position,
//   String? createdAt,
//   bool? isActive,
// }) => Tiers(  id: id ?? _id,
//   name: name ?? _name,
//   pricePerShare: pricePerShare ?? _pricePerShare,
//   availableShare: availableShare ?? _availableShare,
//   position: position ?? _position,
//   createdAt: createdAt ?? _createdAt,
//   isActive: isActive ?? _isActive,
// );
//   String? get id => _id;
//   String? get name => _name;
//   int? get pricePerShare => _pricePerShare;
//   int? get availableShare => _availableShare;
//   String? get position => _position;
//   String? get createdAt => _createdAt;
//   bool? get isActive => _isActive;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['pricePerShare'] = _pricePerShare;
//     map['availableShare'] = _availableShare;
//     map['position'] = _position;
//     map['createdAt'] = _createdAt;
//     map['isActive'] = _isActive;
//     return map;
//   }
//
// }