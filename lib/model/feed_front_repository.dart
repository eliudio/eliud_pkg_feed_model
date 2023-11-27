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

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef FeedFrontModelTrigger = Function(List<FeedFrontModel?> list);
typedef FeedFrontChanged = Function(FeedFrontModel? value);
typedef FeedFrontErrorHandler = Function(dynamic o, dynamic e);

abstract class FeedFrontRepository
    extends RepositoryBase<FeedFrontModel, FeedFrontEntity> {
  @override
  Future<FeedFrontEntity> addEntity(String documentID, FeedFrontEntity value);
  @override
  Future<FeedFrontEntity> updateEntity(
      String documentID, FeedFrontEntity value);
  @override
  Future<FeedFrontModel> add(FeedFrontModel value);
  @override
  Future<void> delete(FeedFrontModel value);
  @override
  Future<FeedFrontModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<FeedFrontModel> update(FeedFrontModel value);

  @override
  Stream<List<FeedFrontModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<FeedFrontModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FeedFrontModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FeedFrontModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<FeedFrontModel?>> listen(
      FeedFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<FeedFrontModel?>> listenWithDetails(
      FeedFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<FeedFrontModel?> listenTo(
      String documentId, FeedFrontChanged changed,
      {FeedFrontErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<FeedFrontModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
