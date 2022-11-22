import 'dart:convert';
/// date : "2022-08-30T07:39:38.898Z"
/// value : 0

ChartResponseModel chartResponseModelFromJson(String str) => ChartResponseModel.fromJson(json.decode(str));
String chartResponseModelToJson(ChartResponseModel data) => json.encode(data.toJson());

List<ChartResponseModel> chartModelListFromJson(String str) =>
    List<ChartResponseModel>.from(json.decode(str).map((x) => ChartResponseModel.fromJson(x)));

class ChartResponseModel {
  ChartResponseModel({
      String? date, 
      int? value,}){
    _date = date;
    _value = value;
}

  ChartResponseModel.fromJson(dynamic json) {
    _date = json['date'];
    _value = json['value'];
  }
  String? _date;
  int? _value;
ChartResponseModel copyWith({  String? date,
  int? value,
}) => ChartResponseModel(  date: date ?? _date,
  value: value ?? _value,
);
  String? get date => _date;
  int? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['value'] = _value;
    return map;
  }

}