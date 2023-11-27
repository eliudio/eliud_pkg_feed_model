/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/profile_entity.dart';

class ProfileModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'profiles';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  FeedModel? feed;
  BackgroundModel? backgroundOverride;
  StorageConditionsModel? conditions;

  ProfileModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.feed,
    this.backgroundOverride,
    this.conditions,
  });

  @override
  ProfileModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    FeedModel? feed,
    BackgroundModel? backgroundOverride,
    StorageConditionsModel? conditions,
  }) {
    return ProfileModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      feed: feed ?? this.feed,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      feed.hashCode ^
      backgroundOverride.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          feed == other.feed &&
          backgroundOverride == other.backgroundOverride &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'ProfileModel{documentID: $documentID, appId: $appId, description: $description, feed: $feed, backgroundOverride: $backgroundOverride, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (feed != null) {
      referencesCollector
          .add(ModelReference(FeedModel.packageName, FeedModel.id, feed!));
    }
    if (feed != null) {
      referencesCollector.addAll(await feed!.collectReferences(appId: appId));
    }
    if (backgroundOverride != null) {
      referencesCollector
          .addAll(await backgroundOverride!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  ProfileEntity toEntity({String? appId}) {
    return ProfileEntity(
      appId: appId,
      description: (description != null) ? description : null,
      feedId: (feed != null) ? feed!.documentID : null,
      backgroundOverride: (backgroundOverride != null)
          ? backgroundOverride!.toEntity(appId: appId)
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<ProfileModel?> fromEntity(
      String documentID, ProfileEntity? entity) async {
    if (entity == null) return null;
    return ProfileModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      backgroundOverride:
          await BackgroundModel.fromEntity(entity.backgroundOverride),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<ProfileModel?> fromEntityPlus(
      String documentID, ProfileEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    FeedModel? feedHolder;
    if (entity.feedId != null) {
      try {
        feedHolder = await feedRepository(appId: appId)!.get(entity.feedId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise feed');
        print('Error whilst retrieving feed with id ${entity.feedId}');
        print('Exception: $e');
      }
    }

    return ProfileModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      feed: feedHolder,
      backgroundOverride: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverride,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
