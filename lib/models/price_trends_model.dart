import 'dart:convert';
// "starting": 10,
// "lowest": 10,
// "highest": 10,
// "date": "2022-09-01T20:01:20.000Z"

PriceTrendsModel priceResponseModelFromJson(String str) => PriceTrendsModel.fromJson(json.decode(str));

String priceResponseModelToJson(PriceTrendsModel data) => json.encode(data.toJson());

List<PriceTrendsModel> priceModelListFromJson(String str) =>
    List<PriceTrendsModel>.from(json.decode(str).map((x) => PriceTrendsModel.fromJson(x)));

class PriceTrendsModel {
  PriceTrendsModel({
    int? starting,
    int? lowest,
    int? highest,
    String? date,}){
    _starting = starting;
    _lowest = lowest;
    _highest = highest;
    _date = date;

  }

  PriceTrendsModel.fromJson(dynamic json) {
    _starting = json ['starting'];
    _lowest = json ['lowest'];
    _highest = json ['highest'];
    _date = json['date'];
  }

  int? _starting;
  int? _lowest;
  int? _highest;
  String? _date;

  PriceTrendsModel copyWith({  String? date,
    int? starting, int? lowest, int? highest
  }) => PriceTrendsModel(
      starting: starting ?? _starting,
      lowest: lowest ?? _lowest,
      highest: highest ?? _highest,
      date: date ?? _date,

  );

  int? get starting => _starting;
  int? get lowest => _lowest;
  int? get highest => _highest;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['starting'] = _starting;
    map['lowest'] = _lowest;
    map['highest'] = _highest;
    map['date'] = _date;
    return map;
  }
}