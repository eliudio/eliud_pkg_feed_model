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

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef FeedMenuModelTrigger = Function(List<FeedMenuModel?> list);
typedef FeedMenuChanged = Function(FeedMenuModel? value);
typedef FeedMenuErrorHandler = Function(dynamic o, dynamic e);

abstract class FeedMenuRepository
    extends RepositoryBase<FeedMenuModel, FeedMenuEntity> {
  @override
  Future<FeedMenuEntity> addEntity(String documentID, FeedMenuEntity value);
  @override
  Future<FeedMenuEntity> updateEntity(String documentID, FeedMenuEntity value);
  @override
  Future<FeedMenuModel> add(FeedMenuModel value);
  @override
  Future<void> delete(FeedMenuModel value);
  @override
  Future<FeedMenuModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<FeedMenuModel> update(FeedMenuModel value);

  @override
  Stream<List<FeedMenuModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<FeedMenuModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FeedMenuModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<FeedMenuModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<FeedMenuModel?>> listen(FeedMenuModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<FeedMenuModel?>> listenWithDetails(
      FeedMenuModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<FeedMenuModel?> listenTo(
      String documentId, FeedMenuChanged changed,
      {FeedMenuErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<FeedMenuModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
