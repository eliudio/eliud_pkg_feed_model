/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef LabelledBodyComponentModelTrigger = Function(
    List<LabelledBodyComponentModel?> list);
typedef LabelledBodyComponentChanged = Function(
    LabelledBodyComponentModel? value);
typedef LabelledBodyComponentErrorHandler = Function(dynamic o, dynamic e);

abstract class LabelledBodyComponentRepository extends RepositoryBase<
    LabelledBodyComponentModel, LabelledBodyComponentEntity> {
  @override
  Future<LabelledBodyComponentEntity> addEntity(
      String documentID, LabelledBodyComponentEntity value);
  @override
  Future<LabelledBodyComponentEntity> updateEntity(
      String documentID, LabelledBodyComponentEntity value);
  @override
  Future<LabelledBodyComponentModel> add(LabelledBodyComponentModel value);
  @override
  Future<void> delete(LabelledBodyComponentModel value);
  @override
  Future<LabelledBodyComponentModel?> get(String? id,
      {Function(Exception)? onError});
  @override
  Future<LabelledBodyComponentModel> update(LabelledBodyComponentModel value);

  @override
  Stream<List<LabelledBodyComponentModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<LabelledBodyComponentModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<LabelledBodyComponentModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<LabelledBodyComponentModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<LabelledBodyComponentModel?>> listen(
      LabelledBodyComponentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<LabelledBodyComponentModel?>> listenWithDetails(
      LabelledBodyComponentModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<LabelledBodyComponentModel?> listenTo(
      String documentId, LabelledBodyComponentChanged changed,
      {LabelledBodyComponentErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<LabelledBodyComponentModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
