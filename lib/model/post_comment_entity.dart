/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';

class PostCommentEntity implements EntityBase {
  final String? postId;
  final String? postCommentId;
  final String? memberId;
  final Object? timestamp;
  final String? appId;
  final String? comment;
  final int? likes;
  final int? dislikes;
  final List<MemberMediumEntity>? memberMedia;

  PostCommentEntity({
    this.postId,
    this.postCommentId,
    this.memberId,
    this.timestamp,
    required this.appId,
    this.comment,
    this.likes,
    this.dislikes,
    this.memberMedia,
  });

  PostCommentEntity copyWith({
    String? documentID,
    String? postId,
    String? postCommentId,
    String? memberId,
    Object? timestamp,
    String? appId,
    String? comment,
    int? likes,
    int? dislikes,
    List<MemberMediumEntity>? memberMedia,
  }) {
    return PostCommentEntity(
      postId: postId ?? this.postId,
      postCommentId: postCommentId ?? this.postCommentId,
      memberId: memberId ?? this.memberId,
      timestamp: timestamp ?? this.timestamp,
      appId: appId ?? this.appId,
      comment: comment ?? this.comment,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      memberMedia: memberMedia ?? this.memberMedia,
    );
  }

  List<Object?> get props => [
        postId,
        postCommentId,
        memberId,
        timestamp,
        appId,
        comment,
        likes,
        dislikes,
        memberMedia,
      ];

  @override
  String toString() {
    String memberMediaCsv =
        (memberMedia == null) ? '' : memberMedia!.join(', ');

    return 'PostCommentEntity{postId: $postId, postCommentId: $postCommentId, memberId: $memberId, timestamp: $timestamp, appId: $appId, comment: $comment, likes: $likes, dislikes: $dislikes, memberMedia: MemberMedium[] { $memberMediaCsv }}';
  }

  static PostCommentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var memberMediaFromMap = map['memberMedia'];
    List<MemberMediumEntity> memberMediaList;
    if (memberMediaFromMap != null) {
      memberMediaList = (map['memberMedia'] as List<dynamic>)
          .map((dynamic item) => MemberMediumEntity.fromMap(item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      memberMediaList = [];
    }

    return PostCommentEntity(
      postId: map['postId'],
      postCommentId: map['postCommentId'],
      memberId: map['memberId'],
      timestamp: map['timestamp'] == null
          ? null
          : (map['timestamp'] as Timestamp).millisecondsSinceEpoch,
      appId: map['appId'],
      comment: map['comment'],
      likes: int.tryParse(map['likes'].toString()),
      dislikes: int.tryParse(map['dislikes'].toString()),
      memberMedia: memberMediaList,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? memberMediaListMap = memberMedia != null
        ? memberMedia!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (postId != null) {
      theDocument["postId"] = postId;
    } else {
      theDocument["postId"] = null;
    }
    if (postCommentId != null) {
      theDocument["postCommentId"] = postCommentId;
    } else {
      theDocument["postCommentId"] = null;
    }
    if (memberId != null) {
      theDocument["memberId"] = memberId;
    } else {
      theDocument["memberId"] = null;
    }
    theDocument["timestamp"] = timestamp;
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (comment != null) {
      theDocument["comment"] = comment;
    } else {
      theDocument["comment"] = null;
    }
    if (likes != null) {
      theDocument["likes"] = likes;
    } else {
      theDocument["likes"] = null;
    }
    if (dislikes != null) {
      theDocument["dislikes"] = dislikes;
    } else {
      theDocument["dislikes"] = null;
    }
    if (memberMedia != null) {
      theDocument["memberMedia"] = memberMediaListMap;
    } else {
      theDocument["memberMedia"] = null;
    }
    return theDocument;
  }

  @override
  PostCommentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PostCommentEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
