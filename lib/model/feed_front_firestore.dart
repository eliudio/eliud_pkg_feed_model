/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/feed_front_repository.dart';

import 'package:eliud_pkg_feed_model/model/repository_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';

/* 
 * FeedFrontFirestore is the firestore implementation of FeedFrontRepository
 */
class FeedFrontFirestore implements FeedFrontRepository {
  /* 
   * transform a map into an entity
   */
  @override
  FeedFrontEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return FeedFrontEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<FeedFrontEntity> addEntity(String documentID, FeedFrontEntity value) {
    return feedFrontCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Update an entity
   */
  @override
  Future<FeedFrontEntity> updateEntity(
      String documentID, FeedFrontEntity value) {
    return feedFrontCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<FeedFrontModel> add(FeedFrontModel value) {
    return feedFrontCollection
        .doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(FeedFrontModel value) {
    return feedFrontCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<FeedFrontModel> update(FeedFrontModel value) {
    return feedFrontCollection
        .doc(value.documentID)
        .update(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<FeedFrontModel?> _populateDoc(DocumentSnapshot value) async {
    return FeedFrontModel.fromEntity(
        value.id, FeedFrontEntity.fromMap(value.data()));
  }

  Future<FeedFrontModel?> _populateDocPlus(DocumentSnapshot value) async {
    return FeedFrontModel.fromEntityPlus(
        value.id, FeedFrontEntity.fromMap(value.data()),
        appId: appId);
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<FeedFrontEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = feedFrontCollection.doc(id);
      var doc = await collection.get();
      return FeedFrontEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving FeedFront with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<FeedFrontModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = feedFrontCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving FeedFront with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<FeedFrontModel?>> listen(
      FeedFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<FeedFrontModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(feedFrontCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfFeedFrontModels) {
      trigger(listOfFeedFrontModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<FeedFrontModel?>> listenWithDetails(
      FeedFrontModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<FeedFrontModel?>> stream;
    stream = getQuery(getCollection(),
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
//  see comment listen(...) above
//  stream = getQuery(feedFrontCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfFeedFrontModels) {
      trigger(listOfFeedFrontModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<FeedFrontModel?> listenTo(
      String documentId, FeedFrontChanged changed,
      {FeedFrontErrorHandler? errorHandler}) {
    var stream =
        feedFrontCollection.doc(documentId).snapshots().asyncMap((data) {
      return _populateDocPlus(data);
    });
    var theStream = stream.listen((value) {
      changed(value);
    });
    theStream.onError((theException, theStacktrace) {
      if (errorHandler != null) {
        errorHandler(theException, theStacktrace);
      }
    });
    return theStream;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Stream<List<FeedFrontModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<FeedFrontModel?>> values = getQuery(feedFrontCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Stream<List<FeedFrontModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<FeedFrontModel?>> values = getQuery(feedFrontCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .snapshots()
        .asyncMap((snapshot) {
      return Future.wait(snapshot.docs.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models from the repository
   */
  @override
  Future<List<FeedFrontModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<FeedFrontModel?> values = await getQuery(feedFrontCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDoc(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Retrieve values/models, including linked models, from the repository
   */
  @override
  Future<List<FeedFrontModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<FeedFrontModel?> values = await getQuery(feedFrontCollection,
            orderBy: orderBy,
            descending: descending,
            startAfter: startAfter as DocumentSnapshot?,
            limit: limit,
            privilegeLevel: privilegeLevel,
            eliudQuery: eliudQuery,
            appId: appId)!
        .get()
        .then((value) {
      var list = value.docs;
      return Future.wait(list.map((doc) {
        lastDoc = doc;
        return _populateDocPlus(doc);
      }).toList());
    });
    if ((setLastDoc != null) && (lastDoc != null)) setLastDoc(lastDoc);
    return values;
  }

  /* 
   * Flush the repository
   */
  @override
  void flush() {}

  /* 
   * Delete all entries in the repository
   */
  @override
  Future<void> deleteAll() {
    return feedFrontCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }

  /* 
   * Retrieve the subcollection of this repository
   */
  @override
  dynamic getSubCollection(String documentId, String name) {
    return feedFrontCollection.doc(documentId).collection(name);
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String? timeStampToString(dynamic timeStamp) {
    return firestoreTimeStampToString(timeStamp);
  }

  /* 
   * change 1 a fieldvalue for 1 document  
   */
  @override
  Future<FeedFrontModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return feedFrontCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  FeedFrontFirestore(this.getCollection, this.appId)
      : feedFrontCollection = getCollection();

  final CollectionReference feedFrontCollection;
  final GetCollection getCollection;
}
