/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_repository.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/repository_export.dart';
import 'package:eliud_pkg_feed_model/model/cache_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

class FeedMenuCache implements FeedMenuRepository {
  final FeedMenuRepository reference;
  final Map<String?, FeedMenuModel?> fullCache = {};

  FeedMenuCache(this.reference);

  /// Add a FeedMenuModel to the repository, cached
  @override
  Future<FeedMenuModel> add(FeedMenuModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a FeedMenuEntity to the repository, cached
  @override
  Future<FeedMenuEntity> addEntity(String documentID, FeedMenuEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a FeedMenuEntity in the repository, cached
  @override
  Future<FeedMenuEntity> updateEntity(String documentID, FeedMenuEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a FeedMenuModel from the repository, cached
  @override
  Future<void> delete(FeedMenuModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a FeedMenuModel with it's id, cached
  @override
  Future<FeedMenuModel?> get(String? id, {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a FeedMenuModel
  @override
  Future<FeedMenuModel> update(FeedMenuModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<FeedMenuModel?>
  @override
  Stream<List<FeedMenuModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.values(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Stream<List<FeedMenuModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.valuesWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<FeedMenuModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesList(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  Future<List<FeedMenuModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    return await reference.valuesListWithDetails(
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        setLastDoc: setLastDoc,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  void flush() {
    fullCache.clear();
  }

  @override
  String? timeStampToString(dynamic timeStamp) {
    return reference.timeStampToString(timeStamp);
  }

  @override
  dynamic getSubCollection(String documentId, String name) {
    return reference.getSubCollection(documentId, name);
  }

  @override
  Future<FeedMenuModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<FeedMenuEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  FeedMenuEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<FeedMenuModel?>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listen(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<List<FeedMenuModel?>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return reference.listenWithDetails(trigger,
        orderBy: orderBy,
        descending: descending,
        startAfter: startAfter,
        limit: limit,
        privilegeLevel: privilegeLevel,
        eliudQuery: eliudQuery);
  }

  @override
  StreamSubscription<FeedMenuModel?> listenTo(
      String documentId, FeedMenuChanged changed,
      {FeedMenuErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<FeedMenuModel> refreshRelations(FeedMenuModel model) async {
    FeedFrontModel? feedFrontHolder;
    if (model.feedFront != null) {
      try {
        await feedFrontRepository(appId: model.appId)!
            .get(model.feedFront!.documentID)
            .then((val) {
          feedFrontHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    List<LabelledBodyComponentModel>? bodyComponentsCurrentMemberHolder;
    if (model.bodyComponentsCurrentMember != null) {
      bodyComponentsCurrentMemberHolder = List<LabelledBodyComponentModel>.from(
              await Future.wait(
                  model.bodyComponentsCurrentMember!.map((element) async {
        return await LabelledBodyComponentCache.refreshRelations(element);
      })))
          .toList();
    }

    List<LabelledBodyComponentModel>? bodyComponentsOtherMemberHolder;
    if (model.bodyComponentsOtherMember != null) {
      bodyComponentsOtherMemberHolder = List<LabelledBodyComponentModel>.from(
              await Future.wait(
                  model.bodyComponentsOtherMember!.map((element) async {
        return await LabelledBodyComponentCache.refreshRelations(element);
      })))
          .toList();
    }

    return model.copyWith(
      feedFront: feedFrontHolder,
      bodyComponentsCurrentMember: bodyComponentsCurrentMemberHolder,
      bodyComponentsOtherMember: bodyComponentsOtherMemberHolder,
    );
  }
}
