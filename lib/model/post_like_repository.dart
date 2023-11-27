/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef PostLikeModelTrigger = Function(List<PostLikeModel?> list);
typedef PostLikeChanged = Function(PostLikeModel? value);
typedef PostLikeErrorHandler = Function(dynamic o, dynamic e);

abstract class PostLikeRepository
    extends RepositoryBase<PostLikeModel, PostLikeEntity> {
  @override
  Future<PostLikeEntity> addEntity(String documentID, PostLikeEntity value);
  @override
  Future<PostLikeEntity> updateEntity(String documentID, PostLikeEntity value);
  @override
  Future<PostLikeModel> add(PostLikeModel value);
  @override
  Future<void> delete(PostLikeModel value);
  @override
  Future<PostLikeModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PostLikeModel> update(PostLikeModel value);

  @override
  Stream<List<PostLikeModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PostLikeModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostLikeModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostLikeModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PostLikeModel?>> listen(PostLikeModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PostLikeModel?>> listenWithDetails(
      PostLikeModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PostLikeModel?> listenTo(
      String documentId, PostLikeChanged changed,
      {PostLikeErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PostLikeModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
