/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef PostModelTrigger = Function(List<PostModel?> list);
typedef PostChanged = Function(PostModel? value);
typedef PostErrorHandler = Function(dynamic o, dynamic e);

abstract class PostRepository extends RepositoryBase<PostModel, PostEntity> {
  @override
  Future<PostEntity> addEntity(String documentID, PostEntity value);
  @override
  Future<PostEntity> updateEntity(String documentID, PostEntity value);
  @override
  Future<PostModel> add(PostModel value);
  @override
  Future<void> delete(PostModel value);
  @override
  Future<PostModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PostModel> update(PostModel value);

  @override
  Stream<List<PostModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PostModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PostModel?>> listen(PostModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PostModel?>> listenWithDetails(
      PostModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PostModel?> listenTo(
      String documentId, PostChanged changed,
      {PostErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PostModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
