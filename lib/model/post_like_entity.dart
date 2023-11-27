/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/entity_base.dart';

class PostLikeEntity implements EntityBase {
  final String? postId;
  final String? postCommentId;
  final String? memberId;
  final Object? timestamp;
  final String? appId;
  final int? likeType;

  PostLikeEntity({
    required this.postId,
    this.postCommentId,
    required this.memberId,
    this.timestamp,
    required this.appId,
    this.likeType,
  });

  PostLikeEntity copyWith({
    String? documentID,
    String? postId,
    String? postCommentId,
    String? memberId,
    Object? timestamp,
    String? appId,
    int? likeType,
  }) {
    return PostLikeEntity(
      postId: postId ?? this.postId,
      postCommentId: postCommentId ?? this.postCommentId,
      memberId: memberId ?? this.memberId,
      timestamp: timestamp ?? this.timestamp,
      appId: appId ?? this.appId,
      likeType: likeType ?? this.likeType,
    );
  }

  List<Object?> get props => [
        postId,
        postCommentId,
        memberId,
        timestamp,
        appId,
        likeType,
      ];

  @override
  String toString() {
    return 'PostLikeEntity{postId: $postId, postCommentId: $postCommentId, memberId: $memberId, timestamp: $timestamp, appId: $appId, likeType: $likeType}';
  }

  static PostLikeEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return PostLikeEntity(
      postId: map['postId'],
      postCommentId: map['postCommentId'],
      memberId: map['memberId'],
      timestamp: map['timestamp'] == null
          ? null
          : (map['timestamp'] as Timestamp).millisecondsSinceEpoch,
      appId: map['appId'],
      likeType: map['likeType'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
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
    if (likeType != null) {
      theDocument["likeType"] = likeType;
    } else {
      theDocument["likeType"] = null;
    }
    return theDocument;
  }

  @override
  PostLikeEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static PostLikeEntity? fromJsonString(String json,
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
