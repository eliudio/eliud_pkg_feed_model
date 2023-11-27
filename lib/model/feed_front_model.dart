/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_front_entity.dart';

class FeedFrontModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'feedFronts';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  FeedModel? feed;
  BackgroundModel? backgroundOverridePosts;
  BackgroundModel? backgroundOverrideProfile;
  StorageConditionsModel? conditions;

  FeedFrontModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.feed,
    this.backgroundOverridePosts,
    this.backgroundOverrideProfile,
    this.conditions,
  });

  @override
  FeedFrontModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    FeedModel? feed,
    BackgroundModel? backgroundOverridePosts,
    BackgroundModel? backgroundOverrideProfile,
    StorageConditionsModel? conditions,
  }) {
    return FeedFrontModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      feed: feed ?? this.feed,
      backgroundOverridePosts:
          backgroundOverridePosts ?? this.backgroundOverridePosts,
      backgroundOverrideProfile:
          backgroundOverrideProfile ?? this.backgroundOverrideProfile,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      feed.hashCode ^
      backgroundOverridePosts.hashCode ^
      backgroundOverrideProfile.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedFrontModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          feed == other.feed &&
          backgroundOverridePosts == other.backgroundOverridePosts &&
          backgroundOverrideProfile == other.backgroundOverrideProfile &&
          conditions == other.conditions;

  @override
  String toString() {
    return 'FeedFrontModel{documentID: $documentID, appId: $appId, description: $description, feed: $feed, backgroundOverridePosts: $backgroundOverridePosts, backgroundOverrideProfile: $backgroundOverrideProfile, conditions: $conditions}';
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
    if (backgroundOverridePosts != null) {
      referencesCollector.addAll(
          await backgroundOverridePosts!.collectReferences(appId: appId));
    }
    if (backgroundOverrideProfile != null) {
      referencesCollector.addAll(
          await backgroundOverrideProfile!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  FeedFrontEntity toEntity({String? appId}) {
    return FeedFrontEntity(
      appId: appId,
      description: (description != null) ? description : null,
      feedId: (feed != null) ? feed!.documentID : null,
      backgroundOverridePosts: (backgroundOverridePosts != null)
          ? backgroundOverridePosts!.toEntity(appId: appId)
          : null,
      backgroundOverrideProfile: (backgroundOverrideProfile != null)
          ? backgroundOverrideProfile!.toEntity(appId: appId)
          : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<FeedFrontModel?> fromEntity(
      String documentID, FeedFrontEntity? entity) async {
    if (entity == null) return null;
    return FeedFrontModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      backgroundOverridePosts:
          await BackgroundModel.fromEntity(entity.backgroundOverridePosts),
      backgroundOverrideProfile:
          await BackgroundModel.fromEntity(entity.backgroundOverrideProfile),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<FeedFrontModel?> fromEntityPlus(
      String documentID, FeedFrontEntity? entity,
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

    return FeedFrontModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      feed: feedHolder,
      backgroundOverridePosts: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverridePosts,
          appId: appId),
      backgroundOverrideProfile: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverrideProfile,
          appId: appId),
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
