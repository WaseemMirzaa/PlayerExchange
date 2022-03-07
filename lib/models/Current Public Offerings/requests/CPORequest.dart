import 'dart:convert';

CpoRequest cpoRequestFromJson(String str) =>
    CpoRequest.fromJson(json.decode(str));

String cpoRequestToJson(CpoRequest data) => json.encode(data.toJson());

class CpoRequest {
  CpoRequest({
    Where? where,
  }) {
    _where = where;
  }

  CpoRequest.fromJson(dynamic json) {
    _where = json['where'] != null ? Where.fromJson(json['where']) : null;
  }

  Where? _where;

  Where? get where => _where;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_where != null) {
      map['where'] = _where?.toJson();
    }
    return map;
  }
}

Where whereFromJson(String str) => Where.fromJson(json.decode(str));

String whereToJson(Where data) => json.encode(data.toJson());

class Where {
  Where({
    String? position,
  }) {
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
