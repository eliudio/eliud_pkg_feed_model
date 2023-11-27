/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef MemberProfileModelTrigger = Function(List<MemberProfileModel?> list);
typedef MemberProfileChanged = Function(MemberProfileModel? value);
typedef MemberProfileErrorHandler = Function(dynamic o, dynamic e);

abstract class MemberProfileRepository
    extends RepositoryBase<MemberProfileModel, MemberProfileEntity> {
  @override
  Future<MemberProfileEntity> addEntity(
      String documentID, MemberProfileEntity value);
  @override
  Future<MemberProfileEntity> updateEntity(
      String documentID, MemberProfileEntity value);
  @override
  Future<MemberProfileModel> add(MemberProfileModel value);
  @override
  Future<void> delete(MemberProfileModel value);
  @override
  Future<MemberProfileModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<MemberProfileModel> update(MemberProfileModel value);

  @override
  Stream<List<MemberProfileModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<MemberProfileModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberProfileModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<MemberProfileModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<MemberProfileModel?>> listen(
      MemberProfileModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<MemberProfileModel?>> listenWithDetails(
      MemberProfileModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<MemberProfileModel?> listenTo(
      String documentId, MemberProfileChanged changed,
      {MemberProfileErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<MemberProfileModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
