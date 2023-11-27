/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';

class FeedEntity implements EntityBase {
  final String? appId;
  final String? description;
  final int? thumbImage;
  final bool? photoPost;
  final bool? videoPost;
  final bool? messagePost;
  final bool? audioPost;
  final bool? albumPost;
  final bool? articlePost;

  FeedEntity({
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

  FeedEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    int? thumbImage,
    bool? photoPost,
    bool? videoPost,
    bool? messagePost,
    bool? audioPost,
    bool? albumPost,
    bool? articlePost,
  }) {
    return FeedEntity(
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

  List<Object?> get props => [
        appId,
        description,
        thumbImage,
        photoPost,
        videoPost,
        messagePost,
        audioPost,
        albumPost,
        articlePost,
      ];

  @override
  String toString() {
    return 'FeedEntity{appId: $appId, description: $description, thumbImage: $thumbImage, photoPost: $photoPost, videoPost: $videoPost, messagePost: $messagePost, audioPost: $audioPost, albumPost: $albumPost, articlePost: $articlePost}';
  }

  static FeedEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return FeedEntity(
      appId: map['appId'],
      description: map['description'],
      thumbImage: map['thumbImage'],
      photoPost: map['photoPost'],
      videoPost: map['videoPost'],
      messagePost: map['messagePost'],
      audioPost: map['audioPost'],
      albumPost: map['albumPost'],
      articlePost: map['articlePost'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (description != null) {
      theDocument["description"] = description;
    } else {
      theDocument["description"] = null;
    }
    if (thumbImage != null) {
      theDocument["thumbImage"] = thumbImage;
    } else {
      theDocument["thumbImage"] = null;
    }
    if (photoPost != null) {
      theDocument["photoPost"] = photoPost;
    } else {
      theDocument["photoPost"] = null;
    }
    if (videoPost != null) {
      theDocument["videoPost"] = videoPost;
    } else {
      theDocument["videoPost"] = null;
    }
    if (messagePost != null) {
      theDocument["messagePost"] = messagePost;
    } else {
      theDocument["messagePost"] = null;
    }
    if (audioPost != null) {
      theDocument["audioPost"] = audioPost;
    } else {
      theDocument["audioPost"] = null;
    }
    if (albumPost != null) {
      theDocument["albumPost"] = albumPost;
    } else {
      theDocument["albumPost"] = null;
    }
    if (articlePost != null) {
      theDocument["articlePost"] = articlePost;
    } else {
      theDocument["articlePost"] = null;
    }
    return theDocument;
  }

  @override
  FeedEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FeedEntity? fromJsonString(String json,
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
