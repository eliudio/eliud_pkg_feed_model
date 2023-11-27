/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/post_repository.dart';

import 'package:eliud_pkg_feed_model/model/repository_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';

/* 
 * PostFirestore is the firestore implementation of PostRepository
 */
class PostFirestore implements PostRepository {
  /* 
   * transform a map into an entity
   */
  @override
  PostEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    return PostEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<PostEntity> addEntity(String documentID, PostEntity value) {
    return postCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await getEntity(documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Update an entity
   */
  @override
  Future<PostEntity> updateEntity(String documentID, PostEntity value) {
    return postCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await getEntity(documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<PostModel> add(PostModel value) {
    return postCollection
        .doc(value.documentID)
        .set(value
            .toEntity(appId: appId)
            .copyWith(
              timestamp: FieldValue.serverTimestamp(),
            )
            .toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await get(value.documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(PostModel value) {
    return postCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<PostModel> update(PostModel value) {
    return postCollection
        .doc(value.documentID)
        .update(value
            .toEntity(appId: appId)
            .copyWith(
              timestamp: FieldValue.serverTimestamp(),
            )
            .toDocument())
        .then((_) => value)
        .then((v) async {
      var newValue = await get(value.documentID);
      if (newValue == null) {
        return value;
      } else {
        return newValue;
      }
    });
  }

  Future<PostModel?> _populateDoc(DocumentSnapshot value) async {
    return PostModel.fromEntity(value.id, PostEntity.fromMap(value.data()));
  }

  Future<PostModel?> _populateDocPlus(DocumentSnapshot value) async {
    return PostModel.fromEntityPlus(value.id, PostEntity.fromMap(value.data()),
        appId: appId);
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<PostEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = postCollection.doc(id);
      var doc = await collection.get();
      return PostEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Post with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<PostModel?> get(String? id, {Function(Exception)? onError}) async {
    try {
      var collection = postCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving Post with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<PostModel?>> listen(PostModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<PostModel?>> stream;
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
//  stream = getQuery(postCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfPostModels) {
      trigger(listOfPostModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<PostModel?>> listenWithDetails(
      PostModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<PostModel?>> stream;
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
//  stream = getQuery(postCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfPostModels) {
      trigger(listOfPostModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<PostModel?> listenTo(
      String documentId, PostChanged changed,
      {PostErrorHandler? errorHandler}) {
    var stream = postCollection.doc(documentId).snapshots().asyncMap((data) {
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
  Stream<List<PostModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<PostModel?>> values = getQuery(postCollection,
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
  Stream<List<PostModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<PostModel?>> values = getQuery(postCollection,
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
  Future<List<PostModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<PostModel?> values = await getQuery(postCollection,
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
  Future<List<PostModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<PostModel?> values = await getQuery(postCollection,
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
    return postCollection.get().then((snapshot) {
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
    return postCollection.doc(documentId).collection(name);
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
  Future<PostModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return postCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  PostFirestore(this.getCollection, this.appId)
      : postCollection = getCollection();

  final CollectionReference postCollection;
  final GetCollection getCollection;
}
