import 'dart:convert';
/// include : [{"relation":"cpoAthletes"}]

RosterRequest rosterRequestFromJson(String str) => RosterRequest.fromJson(json.decode(str));
String rosterRequestToJson(RosterRequest data) => json.encode(data.toJson());
class RosterRequest {
  RosterRequest({
      List<Include>? include,}){
    _include = include;
}

  RosterRequest.fromJson(dynamic json) {
    if (json['include'] != null) {
      _include = [];
      json['include'].forEach((v) {
        _include?.add(Include.fromJson(v));
      });
    }
  }
  List<Include>? _include;

  List<Include>? get include => _include;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_include != null) {
      map['include'] = _include?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// relation : "cpoAthletes"

Include includeFromJson(String str) => Include.fromJson(json.decode(str));
String includeToJson(Include data) => json.encode(data.toJson());
class Include {
  Include({
      String? relation,}){
    _relation = relation;
}

  Include.fromJson(dynamic json) {
    _relation = json['relation'];
  }
  String? _relation;

  String? get relation => _relation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['relation'] = _relation;
    return map;
  }

}