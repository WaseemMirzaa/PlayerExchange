import 'dart:convert';

import 'package:player_exchange/models/rosters/roster_model.dart';
/// id : "9787b1e1-7a08-4bbf-a1b2-0e9e1e608300"
/// askingAmount : 100
/// shares : 5
/// rosterId : "829f9c24-3a61-4d7e-b734-ed6818543ceb"
/// roster : {"id":"829f9c24-3a61-4d7e-b734-ed6818543ceb","userId":"e6562959-5058-46cc-b1a0-53006e9642b0","sharesBought":320,"currentValue":10,"averageCost":10,"totalValue":3200,"totalInvestment":3200,"totalRevenue":3200,"cpoAthletesId":"6c2f4dbd-3415-44c6-8030-f311368348e7"}

ExchangePlayerModel exchangePlayerModelFromJson(String str) => ExchangePlayerModel.fromJson(json.decode(str));
String exchangePlayerModelToJson(ExchangePlayerModel data) => json.encode(data.toJson());
List<ExchangePlayerModel> exchangePlayerModelListFromJson(String str) =>
    List<ExchangePlayerModel>.from(json.decode(str).map((x) => ExchangePlayerModel.fromJson(x)));

String exchangePlayerModelListToJson(List<RosterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExchangePlayerModel {
  ExchangePlayerModel({
    String? id,
    String? userId,
    num? askingAmount,
    num? shares,
    String? rosterId,
    bool? isPurchased,
    RosterModel? roster,}){
    _id = id;
    _userId = userId;
    _askingAmount = askingAmount;
    _shares = shares;
    _rosterId = rosterId;
    _isPurchased = isPurchased;
    _roster = roster;
  }

  ExchangePlayerModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['userId'];
    _askingAmount = json['askingAmount'];
    _shares = json['shares'];
    _rosterId = json['rosterId'];
    _isPurchased = json['isPurchased'];
    _roster = json['roster'] != null ? RosterModel.fromJson(json['roster']) : null;
  }
  String? _id;
  String? _userId;
  num? _askingAmount;
  num? _shares;
  String? _rosterId;
  bool? _isPurchased;
  RosterModel? _roster;
  ExchangePlayerModel copyWith({
    String? id,
    String? userId,
    num? askingAmount,
    num? shares,
    String? rosterId,
    bool? isPurchased,
    RosterModel? roster,
  }) => ExchangePlayerModel(
    id: id ?? _id,
    userId: userId ?? _userId,
    askingAmount: askingAmount ?? _askingAmount,
    shares: shares ?? _shares,
    rosterId: rosterId ?? _rosterId,
    isPurchased: isPurchased ?? _isPurchased,
    roster: roster ?? _roster,
  );
  String? get id => _id;
  String? get userId => _userId;
  num? get askingAmount => _askingAmount;
  num? get shares => _shares;
  String? get rosterId => _rosterId;
  bool? get isPurchased => _isPurchased;
  RosterModel? get roster => _roster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['userId'] = _userId;
    map['askingAmount'] = _askingAmount;
    map['shares'] = _shares;
    map['rosterId'] = _rosterId;
    map['isPurchased'] = isPurchased;
    if (_roster != null) {
      map['roster'] = _roster?.toJson();
    }
    return map;
  }

}
