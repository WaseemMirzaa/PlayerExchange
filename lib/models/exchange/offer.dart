import 'dart:convert';
/// id : "string"
/// senderId : "string"
/// receiverId : "string"
/// exchangePlayerModelId : "string"
/// createdAt : "2022-08-24T18:01:38.243Z"
/// updatedAt : "2022-08-24T18:01:38.243Z"
/// totalShares : 0
/// offerAmount : 0
/// validFor : "2022-08-24T18:01:38.243Z"
/// isNegotiable : true
/// status : "string"
/// offerType : "string"

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));
String offerToJson(Offer data) => json.encode(data.toJson());

List<Offer> offerModelListFromJson(String str) =>
    List<Offer>.from(json.decode(str).map((x) => Offer.fromJson(x)));

String offerModelListToJson(List<Offer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Offer {
  Offer({
    String? id,
    String? senderId,
    String? receiverId,
    String? exchangePlayerModelId,
    String? createdAt,
    String? updatedAt,
    num? totalShares,
    num? offerAmount,
    String? validFor,
    bool? isNegotiable,
    String? status,
    String? offerType,}){
    _id = id;
    _senderId = senderId;
    _receiverId = receiverId;
    _exchangePlayerModelId = exchangePlayerModelId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _totalShares = totalShares;
    _offerAmount = offerAmount;
    _validFor = validFor;
    _isNegotiable = isNegotiable;
    _status = status;
    _offerType = offerType;
  }

  Offer.fromJson(dynamic json) {
    _id = json['id'];
    _senderId = json['senderId'];
    _receiverId = json['receiverId'];
    _exchangePlayerModelId = json['exchangePlayerModelId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _totalShares = json['totalShares'];
    _offerAmount = json['offerAmount'];
    _validFor = json['validFor'];
    _isNegotiable = json['isNegotiable'];
    _status = json['status'];
    _offerType = json['offerType'];
  }
  String? _id;
  String? _senderId;
  String? _receiverId;
  String? _exchangePlayerModelId;
  String? _createdAt;
  String? _updatedAt;
  num? _totalShares;
  num? _offerAmount;
  String? _validFor;
  bool? _isNegotiable;
  String? _status;
  String? _offerType;
  Offer copyWith({  String? id,
    String? senderId,
    String? receiverId,
    String? exchangePlayerModelId,
    String? createdAt,
    String? updatedAt,
    num? totalShares,
    num? offerAmount,
    String? validFor,
    bool? isNegotiable,
    String? status,
    String? offerType,
  }) => Offer(  id: id ?? _id,
    senderId: senderId ?? _senderId,
    receiverId: receiverId ?? _receiverId,
    exchangePlayerModelId: exchangePlayerModelId ?? _exchangePlayerModelId,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    totalShares: totalShares ?? _totalShares,
    offerAmount: offerAmount ?? _offerAmount,
    validFor: validFor ?? _validFor,
    isNegotiable: isNegotiable ?? _isNegotiable,
    status: status ?? _status,
    offerType: offerType ?? _offerType,
  );
  String? get id => _id;
  String? get senderId => _senderId;
  String? get receiverId => _receiverId;
  String? get exchangePlayerModelId => _exchangePlayerModelId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get totalShares => _totalShares;
  num? get offerAmount => _offerAmount;
  String? get validFor => _validFor;
  bool? get isNegotiable => _isNegotiable;
  String? get status => _status;
  String? get offerType => _offerType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['senderId'] = _senderId;
    map['receiverId'] = _receiverId;
    map['exchangePlayerModelId'] = _exchangePlayerModelId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['totalShares'] = _totalShares;
    map['offerAmount'] = _offerAmount;
    map['validFor'] = _validFor;
    map['isNegotiable'] = _isNegotiable;
    map['status'] = _status;
    map['offerType'] = _offerType;
    return map;
  }

  Map<String, dynamic> toJsonPatch() {
    final map = <String, dynamic>{};
    if(id != null)map['id'] = _id;
    if(senderId != null)map['senderId'] = _senderId;
    if(_receiverId != null)map['receiverId'] = _receiverId;
    if(_exchangePlayerModelId != null)map['exchangePlayerModelId'] = _exchangePlayerModelId;
    if(createdAt != null)map['createdAt'] = _createdAt;
    if(updatedAt != null) map['updatedAt'] = _updatedAt;
    if(_totalShares != null)map['totalShares'] = _totalShares;
    if(_offerAmount != null)map['offerAmount'] = _offerAmount;
    if(_validFor != null)map['validFor'] = _validFor;
    if(_isNegotiable != null)map['isNegotiable'] = _isNegotiable;
    if(_status != null)map['status'] = _status;
    if(_offerType != null)map['offerType'] = _offerType;
    return map;
  }

}