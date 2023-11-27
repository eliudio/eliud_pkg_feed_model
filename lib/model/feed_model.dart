/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_entity.dart';

enum ThumbStyle { thumbs, banana, unknown }

ThumbStyle toThumbStyle(int? index) {
  switch (index) {
    case 0:
      return ThumbStyle.thumbs;
    case 1:
      return ThumbStyle.banana;
  }
  return ThumbStyle.unknown;
}

class FeedModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'feeds';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  ThumbStyle? thumbImage;

  // Allow photo posts
  bool? photoPost;

  // Allow video posts
  bool? videoPost;

  // Allow message posts
  bool? messagePost;

  // Allow audio posts
  bool? audioPost;

  // Allow album posts
  bool? albumPost;

  // Allow article posts
  bool? articlePost;

  FeedModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.thumbImage,
    this.photoPost,
    this.videoPost,
    this.messagePost,
    this.audioPost,
    this.albumPost,
    this.articlePost,
  });

  @override
  FeedModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    ThumbStyle? thumbImage,
    bool? photoPost,
    bool? videoPost,
    bool? messagePost,
    bool? audioPost,
    bool? albumPost,
    bool? articlePost,
  }) {
    return FeedModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      thumbImage: thumbImage ?? this.thumbImage,
      photoPost: photoPost ?? this.photoPost,
      videoPost: videoPost ?? this.videoPost,
      messagePost: messagePost ?? this.messagePost,
      audioPost: audioPost ?? this.audioPost,
      albumPost: albumPost ?? this.albumPost,
      articlePost: articlePost ?? this.articlePost,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      thumbImage.hashCode ^
      photoPost.hashCode ^
      videoPost.hashCode ^
      messagePost.hashCode ^
      audioPost.hashCode ^
      albumPost.hashCode ^
      articlePost.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          thumbImage == other.thumbImage &&
          photoPost == other.photoPost &&
          videoPost == other.videoPost &&
          messagePost == other.messagePost &&
          audioPost == other.audioPost &&
          albumPost == other.albumPost &&
          articlePost == other.articlePost;

  @override
  String toString() {
    return 'FeedModel{documentID: $documentID, appId: $appId, description: $description, thumbImage: $thumbImage, photoPost: $photoPost, videoPost: $videoPost, messagePost: $messagePost, audioPost: $audioPost, albumPost: $albumPost, articlePost: $articlePost}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    return referencesCollector;
  }

  @override
  FeedEntity toEntity({String? appId}) {
    return FeedEntity(
      appId: appId,
      description: (description != null) ? description : null,
      thumbImage: (thumbImage != null) ? thumbImage!.index : null,
      photoPost: (photoPost != null) ? photoPost : null,
      videoPost: (videoPost != null) ? videoPost : null,
      messagePost: (messagePost != null) ? messagePost : null,
      audioPost: (audioPost != null) ? audioPost : null,
      albumPost: (albumPost != null) ? albumPost : null,
      articlePost: (articlePost != null) ? articlePost : null,
    );
  }

  static Future<FeedModel?> fromEntity(
      String documentID, FeedEntity? entity) async {
    if (entity == null) return null;
    return FeedModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      thumbImage: toThumbStyle(entity.thumbImage),
      photoPost: entity.photoPost,
      videoPost: entity.videoPost,
      messagePost: entity.messagePost,
      audioPost: entity.audioPost,
      albumPost: entity.albumPost,
      articlePost: entity.articlePost,
    );
  }

  static Future<FeedModel?> fromEntityPlus(
      String documentID, FeedEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    return FeedModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      thumbImage: toThumbStyle(entity.thumbImage),
      photoPost: entity.photoPost,
      videoPost: entity.videoPost,
      messagePost: entity.messagePost,
      audioPost: entity.audioPost,
      albumPost: entity.albumPost,
      articlePost: entity.articlePost,
    );
  }
}
