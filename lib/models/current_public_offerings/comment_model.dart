import 'dart:convert';
/// id : "string"
/// senderId : "string"
/// createdAt : "2022-06-23T14:30:35.334Z"
/// likesCount : 0
/// dislikesCount : 0
/// text : "string"
/// likeId : "string"
/// dislikeId : "string"
/// cpoAthletesId : "string"
/// commentLikes : [{"id":"string","senderId":"string","commentId":"string","createdAt":"2022-06-23T14:30:35.334Z"}]

CommentModel commentModelFromJson(String str) => CommentModel.fromJson(json.decode(str));
String commentModelToJson(CommentModel data) => json.encode(data.toJson());

List<CommentModel> commentModelListFromJson(String str) =>
    List<CommentModel>.from(json.decode(str).map((x) => CommentModel.fromJson(x)));

String commentModelListToJson(List<CommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentModel {
  CommentModel({
      String? id, 
      String? senderId, 
      String? createdAt, 
      int? likesCount, 
      int? dislikesCount, 
      String? text, 
      String? likeId, 
      String? dislikeId, 
      String? cpoAthletesId, 
      String? senderName,
      String? senderProfile,
      List<CommentLikes>? commentLikes,}){
    _id = id;
    _senderId = senderId;
    _createdAt = createdAt;
    _likesCount = likesCount;
    _dislikesCount = dislikesCount;
    _text = text;
    _likeId = likeId;
    _dislikeId = dislikeId;
    _cpoAthletesId = cpoAthletesId;
    senderName = senderName;
    senderProfile = senderProfile;
    _commentLikes = commentLikes;
}

  CommentModel.fromJson(dynamic json) {
    _id = json['id'];
    _senderId = json['senderId'];
    _createdAt = json['createdAt'];
    _likesCount = json['likesCount'];
    _dislikesCount = json['dislikesCount'];
    _text = json['text'];
    _likeId = json['likeId'];
    _dislikeId = json['dislikeId'];
    _cpoAthletesId = json['cpoAthletesId'];
    senderName = json['senderName'];
    senderProfile = json['senderProfile'];
    if (json['commentLikes'] != null) {
      _commentLikes = [];
      json['commentLikes'].forEach((v) {
        _commentLikes?.add(CommentLikes.fromJson(v));
      });
    }
  }
  String? _id;
  String? _senderId;
  String? _createdAt;
  int? _likesCount;
  int? _dislikesCount;
  String? _text;
  String? _likeId;
  String? _dislikeId;
  String? _cpoAthletesId;
  String? senderName;
  String? senderProfile;
  List<CommentLikes>? _commentLikes;
CommentModel copyWith({  String? id,
  String? senderId,
  String? createdAt,
  int? likesCount,
  int? dislikesCount,
  String? text,
  String? likeId,
  String? dislikeId,
  String? cpoAthletesId,
  String? senderName,
  String? senderProfile,
  List<CommentLikes>? commentLikes,
}) => CommentModel(  id: id ?? _id,
  senderId: senderId ?? _senderId,
  createdAt: createdAt ?? _createdAt,
  likesCount: likesCount ?? _likesCount,
  dislikesCount: dislikesCount ?? _dislikesCount,
  text: text ?? _text,
  likeId: likeId ?? _likeId,
  dislikeId: dislikeId ?? _dislikeId,
  cpoAthletesId: cpoAthletesId ?? _cpoAthletesId,
  senderName: senderName ?? senderName,
  senderProfile: senderProfile ?? senderProfile,
  commentLikes: commentLikes ?? _commentLikes,
);
  String? get id => _id;
  String? get senderId => _senderId;
  String? get createdAt => _createdAt;
  int? get likesCount => _likesCount;
  int? get dislikesCount => _dislikesCount;
  String? get text => _text;
  String? get likeId => _likeId;
  String? get dislikeId => _dislikeId;
  String? get cpoAthletesId => _cpoAthletesId;
  // String? get senderName => senderName;
  // String? get senderProfile => senderProfile;
  List<CommentLikes>? get commentLikes => _commentLikes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['senderId'] = _senderId;
    map['createdAt'] = _createdAt;
    map['likesCount'] = _likesCount;
    map['dislikesCount'] = _dislikesCount;
    map['text'] = _text;
    map['likeId'] = _likeId;
    map['dislikeId'] = _dislikeId;
    map['cpoAthletesId'] = _cpoAthletesId;
    map['senderName'] = senderName;
    map['senderProfile'] = senderProfile;
    if (_commentLikes != null) {
      map['commentLikes'] = _commentLikes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "string"
/// senderId : "string"
/// commentId : "string"
/// createdAt : "2022-06-23T14:30:35.334Z"

CommentLikes commentLikesFromJson(String str) => CommentLikes.fromJson(json.decode(str));
String commentLikesToJson(CommentLikes data) => json.encode(data.toJson());
class CommentLikes {
  CommentLikes({
      String? id, 
      String? senderId, 
      String? commentId, 
      String? createdAt,}){
    _id = id;
    _senderId = senderId;
    _commentId = commentId;
    _createdAt = createdAt;
}

  CommentLikes.fromJson(dynamic json) {
    _id = json['id'];
    _senderId = json['senderId'];
    _commentId = json['commentId'];
    _createdAt = json['createdAt'];
  }
  String? _id;
  String? _senderId;
  String? _commentId;
  String? _createdAt;
CommentLikes copyWith({  String? id,
  String? senderId,
  String? commentId,
  String? createdAt,
}) => CommentLikes(  id: id ?? _id,
  senderId: senderId ?? _senderId,
  commentId: commentId ?? _commentId,
  createdAt: createdAt ?? _createdAt,
);
  String? get id => _id;
  String? get senderId => _senderId;
  String? get commentId => _commentId;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['senderId'] = _senderId;
    map['commentId'] = _commentId;
    map['createdAt'] = _createdAt;
    return map;
  }

}