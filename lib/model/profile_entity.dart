/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_main/model/entity_export.dart';

class ProfileEntity implements EntityBase {
  final String? appId;
  final String? description;
  final String? feedId;
  final BackgroundEntity? backgroundOverride;
  final StorageConditionsEntity? conditions;

  ProfileEntity({
    required this.appId,
    this.description,
    this.feedId,
    this.backgroundOverride,
    this.conditions,
  });

  ProfileEntity copyWith({
    String? documentID,
    String? appId,
    String? description,
    String? feedId,
    BackgroundEntity? backgroundOverride,
    StorageConditionsEntity? conditions,
  }) {
    return ProfileEntity(
      appId: appId ?? this.appId,
      description: description ?? this.description,
      feedId: feedId ?? this.feedId,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      conditions: conditions ?? this.conditions,
    );
  }

  List<Object?> get props => [
        appId,
        description,
        feedId,
        backgroundOverride,
        conditions,
      ];

  @override
  String toString() {
    return 'ProfileEntity{appId: $appId, description: $description, feedId: $feedId, backgroundOverride: $backgroundOverride, conditions: $conditions}';
  }

  static ProfileEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var backgroundOverrideFromMap = map['backgroundOverride'];
    if (backgroundOverrideFromMap != null) {
      backgroundOverrideFromMap = BackgroundEntity.fromMap(
          backgroundOverrideFromMap,
          newDocumentIds: newDocumentIds);
    }
    var conditionsFromMap = map['conditions'];
    if (conditionsFromMap != null) {
      conditionsFromMap = StorageConditionsEntity.fromMap(conditionsFromMap,
          newDocumentIds: newDocumentIds);
    }

    return ProfileEntity(
      appId: map['appId'],
      description: map['description'],
      feedId: map['feedId'],
      backgroundOverride: backgroundOverrideFromMap,
      conditions: conditionsFromMap,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final Map<String, dynamic>? backgroundOverrideMap =
        backgroundOverride != null ? backgroundOverride!.toDocument() : null;
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
    if (backgroundOverride != null) {
      theDocument["backgroundOverride"] = backgroundOverrideMap;
    } else {
      theDocument["backgroundOverride"] = null;
    }
    if (conditions != null) {
      theDocument["conditions"] = conditionsMap;
    } else {
      theDocument["conditions"] = null;
    }
    return theDocument;
  }

  @override
  ProfileEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static ProfileEntity? fromJsonString(String json,
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
