import 'dart:convert';

import 'package:player_exchange/models/current_public_offerings/cpo_model.dart';
/// id : "e410a31e-e929-4e15-8ae6-e24a02f7df93"
/// userId : "e056fb9e-2dbe-4205-a9ab-5f35db504f76"
/// sharesBought : 10
/// currentValue : 10
/// averageCost : 10
/// totalValue : 10
/// totalInvestment : 10
/// totalRevenue : 10
/// cpoAthletesId : "58d12700-dbfd-4598-9359-89b432d3eff5"
/// cpoAthletes : {"id":"58d12700-dbfd-4598-9359-89b432d3eff5","playerName":"Kyle Fuller","profilePicture":"","playerId":"054f4c09-6bc9-49c9-a466-80abd2a39e74","video":"https://playerexchange.s3.amazonaws.com/attachments/333e8e71-2a0e-4a52-b9df-e0a535f3b132.mp4","currentPricePerShare":10,"sharePurchased":0,"sharesAvailable":1000000,"position":"QB","tiersId":"dc2f3556-fdfc-42e7-93a3-d93c3a5b58bb"}

RosterModel rosterModelFromJson(String str) => RosterModel.fromJson(json.decode(str));
String rosterModelToJson(RosterModel data) => json.encode(data.toJson());

List<RosterModel> rosterModelListFromJson(String str) =>
    List<RosterModel>.from(json.decode(str).map((x) => RosterModel.fromJson(x)));

String rosterModelListToJson(List<RosterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RosterModel {
  RosterModel({
      String? id, 
      String? userId, 
      int? sharesBought, 
      int? currentValue, 
      int? averageCost, 
      int? totalValue, 
      int? totalInvestment, 
      int? totalRevenue, 
      String? cpoAthletesId, 
      CpoModel? cpoAthletes,}){
    _id = id;
    _userId = userId;
    _sharesBought = sharesBought;
    _currentValue = currentValue;
    _averageCost = averageCost;
    _totalValue = totalValue;
    _totalInvestment = totalInvestment;
    _totalRevenue = totalRevenue;
    _cpoAthletesId = cpoAthletesId;
    _cpoAthletes = cpoAthletes;
}

  RosterModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'] ?? "";
    _sharesBought = json['sharesBought'] ?? 0.0;
    _currentValue = json['currentValue'] ?? 0.0;
    _averageCost = json['averageCost'] ?? 0.0;
    _totalValue = json['totalValue'] ?? 0.0;
    _totalInvestment = json['totalInvestment'] ?? 0.0;
    _totalRevenue = json['totalRevenue'] ?? 0.0;
    _cpoAthletesId = json['cpoAthletesId'] ?? "";
    _cpoAthletes = json['cpoAthletes'] != null ? CpoModel.fromJson(json['cpoAthletes']) : null;
  }
  String? _id;
  String? _userId;
  int? _sharesBought;
  int? _currentValue;
  int? _averageCost;
  int? _totalValue;
  int? _totalInvestment;
  int? _totalRevenue;
  String? _cpoAthletesId;
  CpoModel? _cpoAthletes;

  String? get id => _id;
  String? get userId => _userId;
  int? get sharesBought => _sharesBought;
  int? get currentValue => _currentValue;
  int? get averageCost => _averageCost;
  int? get totalValue => _totalValue;
  int? get totalInvestment => _totalInvestment;
  int? get totalRevenue => _totalRevenue;
  String? get cpoAthletesId => _cpoAthletesId;
  CpoModel? get cpoAthletes => _cpoAthletes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['sharesBought'] = _sharesBought;
    map['currentValue'] = _currentValue;
    map['averageCost'] = _averageCost;
    map['totalValue'] = _totalValue;
    map['totalInvestment'] = _totalInvestment;
    map['totalRevenue'] = _totalRevenue;
    map['cpoAthletesId'] = _cpoAthletesId;
    if (_cpoAthletes != null) {
      map['cpoAthletes'] = _cpoAthletes?.toJson();
    }
    return map;
  }

}

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
//       String? tiersId,}){
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
//
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
//     return map;
//   }
//
// }