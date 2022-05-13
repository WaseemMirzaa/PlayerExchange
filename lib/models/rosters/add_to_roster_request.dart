import 'dart:convert';
/// userId : "string"
/// sharesBought : 0
/// currentValue : 0
/// averageCost : 0
/// totalValue : 0
/// totalInvestment : 0
/// totalRevenue : 0
/// cpoAthletesId : "string"

AddToRosterRequest addToRosterRequestFromJson(String str) => AddToRosterRequest.fromJson(json.decode(str));
String addToRosterRequestToJson(AddToRosterRequest data) => json.encode(data.toJson());
class AddToRosterRequest {
  AddToRosterRequest({
      String? userId, 
      num? sharesBought,
      num? currentValue,
      num? averageCost,
      num? totalValue,
      num? totalInvestment,
      num? totalRevenue,
      String? cpoAthletesId,}){
    _userId = userId;
    _sharesBought = sharesBought;
    _currentValue = currentValue;
    _averageCost = averageCost;
    _totalValue = totalValue;
    _totalInvestment = totalInvestment;
    _totalRevenue = totalRevenue;
    _cpoAthletesId = cpoAthletesId;
}

  AddToRosterRequest.fromJson(dynamic json) {
    _userId = json['userId'];
    _sharesBought = json['sharesBought'];
    _currentValue = json['currentValue'];
    _averageCost = json['averageCost'];
    _totalValue = json['totalValue'];
    _totalInvestment = json['totalInvestment'];
    _totalRevenue = json['totalRevenue'];
    _cpoAthletesId = json['cpoAthletesId'];
  }
  String? _userId;
  num? _sharesBought;
  num? _currentValue;
  num? _averageCost;
  num? _totalValue;
  num? _totalInvestment;
  num? _totalRevenue;
  String? _cpoAthletesId;
AddToRosterRequest copyWith({  String? userId,
  num? sharesBought,
  num? currentValue,
  num? averageCost,
  num? totalValue,
  num? totalInvestment,
  num? totalRevenue,
  String? cpoAthletesId,
}) => AddToRosterRequest(  userId: userId ?? _userId,
  sharesBought: sharesBought ?? _sharesBought,
  currentValue: currentValue ?? _currentValue,
  averageCost: averageCost ?? _averageCost,
  totalValue: totalValue ?? _totalValue,
  totalInvestment: totalInvestment ?? _totalInvestment,
  totalRevenue: totalRevenue ?? _totalRevenue,
  cpoAthletesId: cpoAthletesId ?? _cpoAthletesId,
);
  String? get userId => _userId;
  num? get sharesBought => _sharesBought;
  num? get currentValue => _currentValue;
  num? get averageCost => _averageCost;
  num? get totalValue => _totalValue;
  num? get totalInvestment => _totalInvestment;
  num? get totalRevenue => _totalRevenue;
  String? get cpoAthletesId => _cpoAthletesId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['sharesBought'] = _sharesBought;
    map['currentValue'] = _currentValue;
    map['averageCost'] = _averageCost;
    map['totalValue'] = _totalValue;
    map['totalInvestment'] = _totalInvestment;
    map['totalRevenue'] = _totalRevenue;
    map['cpoAthletesId'] = _cpoAthletesId;
    return map;
  }

}