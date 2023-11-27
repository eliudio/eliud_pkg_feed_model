/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/post_comment_entity.dart';

class PostCommentModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'postComments';

  @override
  String documentID;
  String? postId;
  String? postCommentId;
  String? memberId;
  DateTime? timestamp;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? comment;
  int? likes;
  int? dislikes;
  List<MemberMediumModel>? memberMedia;

  PostCommentModel({
    required this.documentID,
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

  @override
  PostCommentModel copyWith({
    String? documentID,
    String? postId,
    String? postCommentId,
    String? memberId,
    DateTime? timestamp,
    String? appId,
    String? comment,
    int? likes,
    int? dislikes,
    List<MemberMediumModel>? memberMedia,
  }) {
    return PostCommentModel(
      documentID: documentID ?? this.documentID,
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

  @override
  int get hashCode =>
      documentID.hashCode ^
      postId.hashCode ^
      postCommentId.hashCode ^
      memberId.hashCode ^
      timestamp.hashCode ^
      appId.hashCode ^
      comment.hashCode ^
      likes.hashCode ^
      dislikes.hashCode ^
      memberMedia.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          postId == other.postId &&
          postCommentId == other.postCommentId &&
          memberId == other.memberId &&
          timestamp == other.timestamp &&
          appId == other.appId &&
          comment == other.comment &&
          likes == other.likes &&
          dislikes == other.dislikes &&
          ListEquality().equals(memberMedia, other.memberMedia);

  @override
  String toString() {
    String memberMediaCsv =
        (memberMedia == null) ? '' : memberMedia!.join(', ');

    return 'PostCommentModel{documentID: $documentID, postId: $postId, postCommentId: $postCommentId, memberId: $memberId, timestamp: $timestamp, appId: $appId, comment: $comment, likes: $likes, dislikes: $dislikes, memberMedia: MemberMedium[] { $memberMediaCsv }}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (memberMedia != null) {
      for (var item in memberMedia!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  PostCommentEntity toEntity({String? appId}) {
    return PostCommentEntity(
      postId: (postId != null) ? postId : null,
      postCommentId: (postCommentId != null) ? postCommentId : null,
      memberId: (memberId != null) ? memberId : null,
      timestamp: (timestamp == null) ? null : timestamp!.millisecondsSinceEpoch,
      appId: appId,
      comment: (comment != null) ? comment : null,
      likes: (likes != null) ? likes : null,
      dislikes: (dislikes != null) ? dislikes : null,
      memberMedia: (memberMedia != null)
          ? memberMedia!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
    );
  }

  static Future<PostCommentModel?> fromEntity(
      String documentID, PostCommentEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return PostCommentModel(
      documentID: documentID,
      postId: entity.postId,
      postCommentId: entity.postCommentId,
      memberId: entity.memberId,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      appId: entity.appId ?? '',
      comment: entity.comment,
      likes: entity.likes,
      dislikes: entity.dislikes,
      memberMedia: entity.memberMedia == null
          ? null
          : List<MemberMediumModel>.from(
              await Future.wait(entity.memberMedia!.map((item) {
              counter++;
              return MemberMediumModel.fromEntity(counter.toString(), item);
            }).toList())),
    );
  }

  static Future<PostCommentModel?> fromEntityPlus(
      String documentID, PostCommentEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    var counter = 0;
    return PostCommentModel(
      documentID: documentID,
      postId: entity.postId,
      postCommentId: entity.postCommentId,
      memberId: entity.memberId,
      timestamp: entity.timestamp == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch((entity.timestamp as int)),
      appId: entity.appId ?? '',
      comment: entity.comment,
      likes: entity.likes,
      dislikes: entity.dislikes,
      memberMedia: entity.memberMedia == null
          ? null
          : List<MemberMediumModel>.from(
              await Future.wait(entity.memberMedia!.map((item) {
              counter++;
              return MemberMediumModel.fromEntityPlus(counter.toString(), item,
                  appId: appId);
            }).toList())),
    );
  }
}
