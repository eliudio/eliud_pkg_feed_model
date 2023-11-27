/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef PostCommentModelTrigger = Function(List<PostCommentModel?> list);
typedef PostCommentChanged = Function(PostCommentModel? value);
typedef PostCommentErrorHandler = Function(dynamic o, dynamic e);

abstract class PostCommentRepository
    extends RepositoryBase<PostCommentModel, PostCommentEntity> {
  @override
  Future<PostCommentEntity> addEntity(
      String documentID, PostCommentEntity value);
  @override
  Future<PostCommentEntity> updateEntity(
      String documentID, PostCommentEntity value);
  @override
  Future<PostCommentModel> add(PostCommentModel value);
  @override
  Future<void> delete(PostCommentModel value);
  @override
  Future<PostCommentModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<PostCommentModel> update(PostCommentModel value);

  @override
  Stream<List<PostCommentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<PostCommentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostCommentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<PostCommentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<PostCommentModel?>> listen(
      PostCommentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<PostCommentModel?>> listenWithDetails(
      PostCommentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<PostCommentModel?> listenTo(
      String documentId, PostCommentChanged changed,
      {PostCommentErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<PostCommentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
