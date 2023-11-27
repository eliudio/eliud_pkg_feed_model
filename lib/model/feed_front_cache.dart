/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_repository.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/repository_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

class FeedFrontCache implements FeedFrontRepository {
  final FeedFrontRepository reference;
  final Map<String?, FeedFrontModel?> fullCache = {};

  FeedFrontCache(this.reference);

  /// Add a FeedFrontModel to the repository, cached
  @override
  Future<FeedFrontModel> add(FeedFrontModel value) {
    return reference.add(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Add a FeedFrontEntity to the repository, cached
  @override
  Future<FeedFrontEntity> addEntity(String documentID, FeedFrontEntity value) {
    return reference.addEntity(documentID, value);
  }

  /// Update a FeedFrontEntity in the repository, cached
  @override
  Future<FeedFrontEntity> updateEntity(
      String documentID, FeedFrontEntity value) {
    return reference.updateEntity(documentID, value);
  }

  /// Delete a FeedFrontModel from the repository, cached
  @override
  Future<void> delete(FeedFrontModel value) {
    fullCache.remove(value.documentID);
    reference.delete(value);
    return Future.value();
  }

  /// Retrieve a FeedFrontModel with it's id, cached
  @override
  Future<FeedFrontModel?> get(String? id,
      {Function(Exception)? onError}) async {
    var value = fullCache[id];
    if (value != null) return refreshRelations(value);
    value = await reference.get(id, onError: onError);
    fullCache[id] = value;
    return value;
  }

  /// Update a FeedFrontModel
  @override
  Future<FeedFrontModel> update(FeedFrontModel value) {
    return reference.update(value).then((newValue) {
      fullCache[value.documentID] = newValue;
      return newValue;
    });
  }

  /// Retrieve list of List<FeedFrontModel?>
  @override
  Stream<List<FeedFrontModel?>> values(
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
  Stream<List<FeedFrontModel?>> valuesWithDetails(
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
  Future<List<FeedFrontModel?>> valuesList(
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
  Future<List<FeedFrontModel?>> valuesListWithDetails(
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
  Future<FeedFrontModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    return reference
        .changeValue(documentId, fieldName, changeByThisValue)
        .then((newValue) {
      fullCache[documentId] = newValue;
      return newValue!;
    });
  }

  @override
  Future<FeedFrontEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    return reference.getEntity(id, onError: onError);
  }

  @override
  FeedFrontEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return reference.fromMap(o, newDocumentIds: newDocumentIds);
  }

  @override
  Future<void> deleteAll() {
    return reference.deleteAll();
  }

  @override
  StreamSubscription<List<FeedFrontModel?>> listen(trigger,
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
  StreamSubscription<List<FeedFrontModel?>> listenWithDetails(trigger,
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
  StreamSubscription<FeedFrontModel?> listenTo(
      String documentId, FeedFrontChanged changed,
      {FeedFrontErrorHandler? errorHandler}) {
    return reference.listenTo(documentId, ((value) {
      if (value != null) {
        fullCache[value.documentID] = value;
      }
      changed(value);
    }), errorHandler: errorHandler);
  }

  static Future<FeedFrontModel> refreshRelations(FeedFrontModel model) async {
    FeedModel? feedHolder;
    if (model.feed != null) {
      try {
        await feedRepository(appId: model.appId)!
            .get(model.feed!.documentID)
            .then((val) {
          feedHolder = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    return model.copyWith(
      feed: feedHolder,
    );
  }
}
