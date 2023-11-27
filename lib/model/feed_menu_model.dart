/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_menu_entity.dart';

class FeedMenuModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'feedMenus';

  @override
  String documentID;

  // This is the identifier of the app to which this feed belongs
  @override
  String appId;
  String? description;
  List<LabelledBodyComponentModel>? bodyComponentsCurrentMember;
  List<LabelledBodyComponentModel>? bodyComponentsOtherMember;
  RgbModel? itemColor;
  RgbModel? selectedItemColor;
  BackgroundModel? backgroundOverride;
  FeedFrontModel? feedFront;
  StorageConditionsModel? conditions;

  FeedMenuModel({
    required this.documentID,
    required this.appId,
    this.description,
    this.bodyComponentsCurrentMember,
    this.bodyComponentsOtherMember,
    this.itemColor,
    this.selectedItemColor,
    this.backgroundOverride,
    this.feedFront,
    this.conditions,
  });

  @override
  FeedMenuModel copyWith({
    String? documentID,
    String? appId,
    String? description,
    List<LabelledBodyComponentModel>? bodyComponentsCurrentMember,
    List<LabelledBodyComponentModel>? bodyComponentsOtherMember,
    RgbModel? itemColor,
    RgbModel? selectedItemColor,
    BackgroundModel? backgroundOverride,
    FeedFrontModel? feedFront,
    StorageConditionsModel? conditions,
  }) {
    return FeedMenuModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      description: description ?? this.description,
      bodyComponentsCurrentMember:
          bodyComponentsCurrentMember ?? this.bodyComponentsCurrentMember,
      bodyComponentsOtherMember:
          bodyComponentsOtherMember ?? this.bodyComponentsOtherMember,
      itemColor: itemColor ?? this.itemColor,
      selectedItemColor: selectedItemColor ?? this.selectedItemColor,
      backgroundOverride: backgroundOverride ?? this.backgroundOverride,
      feedFront: feedFront ?? this.feedFront,
      conditions: conditions ?? this.conditions,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      description.hashCode ^
      bodyComponentsCurrentMember.hashCode ^
      bodyComponentsOtherMember.hashCode ^
      itemColor.hashCode ^
      selectedItemColor.hashCode ^
      backgroundOverride.hashCode ^
      feedFront.hashCode ^
      conditions.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedMenuModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          description == other.description &&
          ListEquality().equals(
              bodyComponentsCurrentMember, other.bodyComponentsCurrentMember) &&
          ListEquality().equals(
              bodyComponentsOtherMember, other.bodyComponentsOtherMember) &&
          itemColor == other.itemColor &&
          selectedItemColor == other.selectedItemColor &&
          backgroundOverride == other.backgroundOverride &&
          feedFront == other.feedFront &&
          conditions == other.conditions;

  @override
  String toString() {
    String bodyComponentsCurrentMemberCsv =
        (bodyComponentsCurrentMember == null)
            ? ''
            : bodyComponentsCurrentMember!.join(', ');
    String bodyComponentsOtherMemberCsv = (bodyComponentsOtherMember == null)
        ? ''
        : bodyComponentsOtherMember!.join(', ');

    return 'FeedMenuModel{documentID: $documentID, appId: $appId, description: $description, bodyComponentsCurrentMember: LabelledBodyComponent[] { $bodyComponentsCurrentMemberCsv }, bodyComponentsOtherMember: LabelledBodyComponent[] { $bodyComponentsOtherMemberCsv }, itemColor: $itemColor, selectedItemColor: $selectedItemColor, backgroundOverride: $backgroundOverride, feedFront: $feedFront, conditions: $conditions}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (feedFront != null) {
      referencesCollector.add(ModelReference(
          FeedFrontModel.packageName, FeedFrontModel.id, feedFront!));
    }
    if (bodyComponentsCurrentMember != null) {
      for (var item in bodyComponentsCurrentMember!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (bodyComponentsOtherMember != null) {
      for (var item in bodyComponentsOtherMember!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    if (itemColor != null) {
      referencesCollector
          .addAll(await itemColor!.collectReferences(appId: appId));
    }
    if (selectedItemColor != null) {
      referencesCollector
          .addAll(await selectedItemColor!.collectReferences(appId: appId));
    }
    if (backgroundOverride != null) {
      referencesCollector
          .addAll(await backgroundOverride!.collectReferences(appId: appId));
    }
    if (feedFront != null) {
      referencesCollector
          .addAll(await feedFront!.collectReferences(appId: appId));
    }
    if (conditions != null) {
      referencesCollector
          .addAll(await conditions!.collectReferences(appId: appId));
    }
    return referencesCollector;
  }

  @override
  FeedMenuEntity toEntity({String? appId}) {
    return FeedMenuEntity(
      appId: appId,
      description: (description != null) ? description : null,
      bodyComponentsCurrentMember: (bodyComponentsCurrentMember != null)
          ? bodyComponentsCurrentMember!
              .map((item) => item.toEntity(appId: appId))
              .toList()
          : null,
      bodyComponentsOtherMember: (bodyComponentsOtherMember != null)
          ? bodyComponentsOtherMember!
              .map((item) => item.toEntity(appId: appId))
              .toList()
          : null,
      itemColor: (itemColor != null) ? itemColor!.toEntity(appId: appId) : null,
      selectedItemColor: (selectedItemColor != null)
          ? selectedItemColor!.toEntity(appId: appId)
          : null,
      backgroundOverride: (backgroundOverride != null)
          ? backgroundOverride!.toEntity(appId: appId)
          : null,
      feedFrontId: (feedFront != null) ? feedFront!.documentID : null,
      conditions:
          (conditions != null) ? conditions!.toEntity(appId: appId) : null,
    );
  }

  static Future<FeedMenuModel?> fromEntity(
      String documentID, FeedMenuEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return FeedMenuModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      bodyComponentsCurrentMember: entity.bodyComponentsCurrentMember == null
          ? null
          : List<LabelledBodyComponentModel>.from(
              await Future.wait(entity.bodyComponentsCurrentMember!.map((item) {
              counter++;
              return LabelledBodyComponentModel.fromEntity(
                  counter.toString(), item);
            }).toList())),
      bodyComponentsOtherMember: entity.bodyComponentsOtherMember == null
          ? null
          : List<LabelledBodyComponentModel>.from(
              await Future.wait(entity.bodyComponentsOtherMember!.map((item) {
              counter++;
              return LabelledBodyComponentModel.fromEntity(
                  counter.toString(), item);
            }).toList())),
      itemColor: await RgbModel.fromEntity(entity.itemColor),
      selectedItemColor: await RgbModel.fromEntity(entity.selectedItemColor),
      backgroundOverride:
          await BackgroundModel.fromEntity(entity.backgroundOverride),
      conditions: await StorageConditionsModel.fromEntity(entity.conditions),
    );
  }

  static Future<FeedMenuModel?> fromEntityPlus(
      String documentID, FeedMenuEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    FeedFrontModel? feedFrontHolder;
    if (entity.feedFrontId != null) {
      try {
        feedFrontHolder =
            await feedFrontRepository(appId: appId)!.get(entity.feedFrontId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise feedFront');
        print(
            'Error whilst retrieving feedFront with id ${entity.feedFrontId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return FeedMenuModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      description: entity.description,
      bodyComponentsCurrentMember: entity.bodyComponentsCurrentMember == null
          ? null
          : List<LabelledBodyComponentModel>.from(
              await Future.wait(entity.bodyComponentsCurrentMember!.map((item) {
              counter++;
              return LabelledBodyComponentModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
      bodyComponentsOtherMember: entity.bodyComponentsOtherMember == null
          ? null
          : List<LabelledBodyComponentModel>.from(
              await Future.wait(entity.bodyComponentsOtherMember!.map((item) {
              counter++;
              return LabelledBodyComponentModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
      itemColor: await RgbModel.fromEntityPlus(entity.itemColor, appId: appId),
      selectedItemColor:
          await RgbModel.fromEntityPlus(entity.selectedItemColor, appId: appId),
      backgroundOverride: await BackgroundModel.fromEntityPlus(
          entity.backgroundOverride,
          appId: appId),
      feedFront: feedFrontHolder,
      conditions: await StorageConditionsModel.fromEntityPlus(entity.conditions,
          appId: appId),
    );
  }
}
