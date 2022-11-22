import 'dart:convert';
/// count : 0

CountModel countModelFromJson(String str) => CountModel.fromJson(json.decode(str));
String countModelToJson(CountModel data) => json.encode(data.toJson());
class CountModel {
  CountModel({
      int? count,}){
    _count = count;
}

  CountModel.fromJson(dynamic json) {
    _count = json['count'];
  }
  int? _count;
CountModel copyWith({  int? count,
}) => CountModel(  count: count ?? _count,
);
  int? get count => _count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    return map;
  }

}