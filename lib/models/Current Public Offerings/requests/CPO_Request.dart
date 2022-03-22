import 'dart:convert';
/// where : {"position":"QB"}
/// include : [{"relation":"tiers"}]

CpoRequest cpoRequestFromJson(String str) => CpoRequest.fromJson(json.decode(str));
String cpoRequestToJson(CpoRequest data) => json.encode(data.toJson());
class CpoRequest {
  CpoRequest({
      Where? where, 
      List<Include>? include,}){
    _where = where;
    _include = include;
}

  CpoRequest.fromJson(dynamic json) {
    _where = json['where'] != null ? Where.fromJson(json['where']) : null;
    if (json['include'] != null) {
      _include = [];
      json['include'].forEach((v) {
        _include?.add(Include.fromJson(v));
      });
    }
  }
  Where? _where;
  List<Include>? _include;

  Where? get where => _where;
  List<Include>? get include => _include;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_where != null) {
      map['where'] = _where?.toJson();
    }
    if (_include != null) {
      map['include'] = _include?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// relation : "tiers"

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

/// position : "QB"

Where whereFromJson(String str) => Where.fromJson(json.decode(str));
String whereToJson(Where data) => json.encode(data.toJson());
class Where {
  Where({
      String? position,}){
    _position = position;
}

  Where.fromJson(dynamic json) {
    _position = json['position'];
  }
  String? _position;

  String? get position => _position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['position'] = _position;
    return map;
  }

}