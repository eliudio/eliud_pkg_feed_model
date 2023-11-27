/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/labelled_body_component_list_bloc.dart';
import '../model/labelled_body_component_list.dart';
import '../model/labelled_body_component_list_event.dart';
import '../model/labelled_body_component_model.dart';
import '../model/labelled_body_component_entity.dart';
import '../model/labelled_body_component_repository.dart';

import '../model/member_profile_list_bloc.dart';
import '../model/member_profile_list.dart';
import '../model/member_profile_list_event.dart';
import '../model/member_profile_model.dart';
import '../model/member_profile_entity.dart';
import '../model/member_profile_repository.dart';

typedef LabelledBodyComponentListChanged = Function(
    List<LabelledBodyComponentModel> values);
typedef MemberProfileListChanged = Function(List<MemberProfileModel> values);

labelledBodyComponentsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.labelledBodyComponentsList(
        app, context, value, trigger);
memberProfilesList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberProfilesList(app, context, value, trigger);

class EmbeddedComponentFactory {
/* 
 * labelledBodyComponentsList function to construct a list of LabelledBodyComponentModel
 */
  static Widget labelledBodyComponentsList(
      AppModel app,
      BuildContext context,
      List<LabelledBodyComponentModel> values,
      LabelledBodyComponentListChanged trigger) {
    LabelledBodyComponentInMemoryRepository inMemoryRepository =
        LabelledBodyComponentInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<LabelledBodyComponentListBloc>(
          create: (context) => LabelledBodyComponentListBloc(
            labelledBodyComponentRepository: inMemoryRepository,
          )..add(LoadLabelledBodyComponentList()),
        )
      ],
      child: LabelledBodyComponentListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * memberProfilesList function to construct a list of MemberProfileModel
 */
  static Widget memberProfilesList(AppModel app, BuildContext context,
      List<MemberProfileModel> values, MemberProfileListChanged trigger) {
    MemberProfileInMemoryRepository inMemoryRepository =
        MemberProfileInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberProfileListBloc>(
          create: (context) => MemberProfileListBloc(
            memberProfileRepository: inMemoryRepository,
          )..add(LoadMemberProfileList()),
        )
      ],
      child: MemberProfileListWidget(app: app, isEmbedded: true),
    );
  }
}

/* 
 * LabelledBodyComponentInMemoryRepository is an in memory implementation of LabelledBodyComponentRepository
 */
class LabelledBodyComponentInMemoryRepository
    implements LabelledBodyComponentRepository {
  final List<LabelledBodyComponentModel> items;
  final LabelledBodyComponentListChanged trigger;
  Stream<List<LabelledBodyComponentModel>>? theValues;

  /* 
     * Construct the LabelledBodyComponentInMemoryRepository
     */
  LabelledBodyComponentInMemoryRepository(this.trigger, this.items) {
    List<List<LabelledBodyComponentModel>> myList =
        <List<LabelledBodyComponentModel>>[];
    myList.add(items);
    theValues = Stream<List<LabelledBodyComponentModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<LabelledBodyComponentEntity> addEntity(
      String documentID, LabelledBodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<LabelledBodyComponentEntity> updateEntity(
      String documentID, LabelledBodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<LabelledBodyComponentModel> add(LabelledBodyComponentModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(LabelledBodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<LabelledBodyComponentModel> update(LabelledBodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<LabelledBodyComponentModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<LabelledBodyComponentModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of LabelledBodyComponentModel base on a query
     */
  @override
  Stream<List<LabelledBodyComponentModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of LabelledBodyComponentModel, including linked models base on a query
     */
  @override
  Stream<List<LabelledBodyComponentModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of LabelledBodyComponentModel base on a query
     */
  @override
  StreamSubscription<List<LabelledBodyComponentModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of LabelledBodyComponentModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<LabelledBodyComponentModel>> listenWithDetails(
      trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<LabelledBodyComponentModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<LabelledBodyComponentModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<LabelledBodyComponentModel> listenTo(
      String documentId, LabelledBodyComponentChanged changed,
      {LabelledBodyComponentErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<LabelledBodyComponentModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<LabelledBodyComponentEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  LabelledBodyComponentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * MemberProfileInMemoryRepository is an in memory implementation of MemberProfileRepository
 */
class MemberProfileInMemoryRepository implements MemberProfileRepository {
  final List<MemberProfileModel> items;
  final MemberProfileListChanged trigger;
  Stream<List<MemberProfileModel>>? theValues;

  /* 
     * Construct the MemberProfileInMemoryRepository
     */
  MemberProfileInMemoryRepository(this.trigger, this.items) {
    List<List<MemberProfileModel>> myList = <List<MemberProfileModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberProfileModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<MemberProfileEntity> addEntity(
      String documentID, MemberProfileEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MemberProfileEntity> updateEntity(
      String documentID, MemberProfileEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberProfileModel> add(MemberProfileModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MemberProfileModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberProfileModel> update(MemberProfileModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MemberProfileModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberProfileModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MemberProfileModel base on a query
     */
  @override
  Stream<List<MemberProfileModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MemberProfileModel, including linked models base on a query
     */
  @override
  Stream<List<MemberProfileModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MemberProfileModel base on a query
     */
  @override
  StreamSubscription<List<MemberProfileModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MemberProfileModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MemberProfileModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MemberProfileModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberProfileModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MemberProfileModel> listenTo(
      String documentId, MemberProfileChanged changed,
      {MemberProfileErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberProfileModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberProfileEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberProfileEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
