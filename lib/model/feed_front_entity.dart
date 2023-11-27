/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';

class FeedFrontEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? feedId;
  final BackgroundEntity? backgroundOverridePosts;
  final BackgroundEntity? backgroundOverrideProfile;
  final StorageConditionsEntity? conditions;

  FeedFrontEntity({
    required this.appId,
    this.description,
    this.feedId,
    this.backgroundOverridePosts,
    this.backgroundOverrideProfile,
    this.conditions,
  });

  FeedFrontEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? feedId,
    BackgroundEntity? backgroundOverridePosts,
    BackgroundEntity? backgroundOverrideProfile,
    StorageConditionsEntity? conditions,
  }) {
    return FeedFrontEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      feedId: feedId ?? this.feedId,
      backgroundOverridePosts:
          backgroundOverridePosts ?? this.backgroundOverridePosts,
      backgroundOverrideProfile:
          backgroundOverrideProfile ?? this.backgroundOverrideProfile,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        feedId,
        backgroundOverridePosts,
        backgroundOverrideProfile,
        conditions,
      ];

  @override
  String toString() {
    return 'FeedFrontEntity{appId: $appId, description: $description, feedId: $feedId, backgroundOverridePosts: $backgroundOverridePosts, backgroundOverrideProfile: $backgroundOverrideProfile, conditions: $conditions}';
  }

  static FeedFrontEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backgroundOverridePostsFromMap = map['backgroundOverridePosts'];
    if (backgroundOverridePostsFromMap != null) {
      backgroundOverridePostsFromMap = BackgroundEntity.fromMap(
          backgroundOverridePostsFromMap,
          newDocumentIds: newDocumentIds);
    }
    var backgroundOverrideProfileFromMap = map['backgroundOverrideProfile'];
    if (backgroundOverrideProfileFromMap != null) {
      backgroundOverrideProfileFromMap = BackgroundEntity.fromMap(
          backgroundOverrideProfileFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return FeedFrontEntity(
      appId: map['appId'],
      description: map['description'],
      feedId: map['feedId'],
      backgroundOverridePosts: backgroundOverridePostsFromMap,
      backgroundOverrideProfile: backgroundOverrideProfileFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backgroundOverridePostsMap =
        backgroundOverridePosts != null
            ? backgroundOverridePosts!.toDocument()
            : null;
    final Map<String, dynamic>? backgroundOverrideProfileMap =
        backgroundOverrideProfile != null
            ? backgroundOverrideProfile!.toDocument()
            : null;
    final Map<String, dynamic>? conditionsMap =
        conditions != null ? conditions!.toDocument() : null;

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
    if (feedId != null) {
      theDocument["feedId"] = feedId;
    } else {
      theDocument["feedId"] = null;
    }
    if (backgroundOverridePosts != null) {
      theDocument["backgroundOverridePosts"] = backgroundOverridePostsMap;
    } else {
      theDocument["backgroundOverridePosts"] = null;
    }
    if (backgroundOverrideProfile != null) {
      theDocument["backgroundOverrideProfile"] = backgroundOverrideProfileMap;
    } else {
      theDocument["backgroundOverrideProfile"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  FeedFrontEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static FeedFrontEntity? fromJsonString(String json,
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
