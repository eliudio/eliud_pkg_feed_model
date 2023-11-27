/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_firestore.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/member_profile_repository.dart';

import 'package:eliud_pkg_feed_model/model/repository_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';

/* 
 * MemberProfileFirestore is the firestore implementation of MemberProfileRepository
 */
class MemberProfileFirestore implements MemberProfileRepository {
  /* 
   * transform a map into an entity
   */
  @override
  MemberProfileEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    return MemberProfileEntity.fromMap(o, newDocumentIds: newDocumentIds);
  }

  /* 
   * add an entity to the repository
   */
  @override
  Future<MemberProfileEntity> addEntity(
      String documentID, MemberProfileEntity value) {
    return memberProfileCollection
        .doc(documentID)
        .set(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Update an entity
   */
  @override
  Future<MemberProfileEntity> updateEntity(
      String documentID, MemberProfileEntity value) {
    return memberProfileCollection
        .doc(documentID)
        .update(value.toDocument())
        .then((_) => value);
  }

  /* 
   * Add a model to the repository
   */
  @override
  Future<MemberProfileModel> add(MemberProfileModel value) {
    return memberProfileCollection
        .doc(value.documentID)
        .set(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  /* 
   * Delete a model
   */
  @override
  Future<void> delete(MemberProfileModel value) {
    return memberProfileCollection.doc(value.documentID).delete();
  }

  /* 
   * Update a model
   */
  @override
  Future<MemberProfileModel> update(MemberProfileModel value) {
    return memberProfileCollection
        .doc(value.documentID)
        .update(value.toEntity(appId: appId).toDocument())
        .then((_) => value);
  }

  Future<MemberProfileModel?> _populateDoc(DocumentSnapshot value) async {
    return MemberProfileModel.fromEntity(
        value.id, MemberProfileEntity.fromMap(value.data()));
  }

  Future<MemberProfileModel?> _populateDocPlus(DocumentSnapshot value) async {
    return MemberProfileModel.fromEntityPlus(
        value.id, MemberProfileEntity.fromMap(value.data()),
        appId: appId);
  }

  /* 
   * Retrieve an entity from the repository with id
   */
  @override
  Future<MemberProfileEntity?> getEntity(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = memberProfileCollection.doc(id);
      var doc = await collection.get();
      return MemberProfileEntity.fromMap(doc.data());
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberProfile with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Retrieve an model from the repository with id
   */
  @override
  Future<MemberProfileModel?> get(String? id,
      {Function(Exception)? onError}) async {
    try {
      var collection = memberProfileCollection.doc(id);
      var doc = await collection.get();
      return await _populateDocPlus(doc);
    } on Exception catch (e) {
      if (onError != null) {
        onError(e);
      } else {
        print("Error whilst retrieving MemberProfile with id $id");
        print("Exceptoin: $e");
      }
    }
    return null;
  }

  /* 
   * Listen to the repository using a query. Retrieve models
   */
  @override
  StreamSubscription<List<MemberProfileModel?>> listen(
      MemberProfileModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<MemberProfileModel?>> stream;
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
//  stream = getQuery(memberProfileCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDoc(doc)).toList());
    });

    return stream.listen((listOfMemberProfileModels) {
      trigger(listOfMemberProfileModels);
    });
  }

  /* 
   * Listen to the repository using a query. Retrieve models and linked models
   */
  @override
  StreamSubscription<List<MemberProfileModel?>> listenWithDetails(
      MemberProfileModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    Stream<List<MemberProfileModel?>> stream;
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
//  stream = getQuery(memberProfileCollection, orderBy: orderBy,  descending: descending,  startAfter: startAfter as DocumentSnapshot?,  limit: limit, privilegeLevel: privilegeLevel, eliudQuery: eliudQuery, appId: appId)!.snapshots()
        .asyncMap((data) async {
      return await Future.wait(
          data.docs.map((doc) => _populateDocPlus(doc)).toList());
    });

    return stream.listen((listOfMemberProfileModels) {
      trigger(listOfMemberProfileModels);
    });
  }

  /* 
   * Listen to 1 document in the repository
   */
  @override
  StreamSubscription<MemberProfileModel?> listenTo(
      String documentId, MemberProfileChanged changed,
      {MemberProfileErrorHandler? errorHandler}) {
    var stream =
        memberProfileCollection.doc(documentId).snapshots().asyncMap((data) {
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
  Stream<List<MemberProfileModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberProfileModel?>> values = getQuery(memberProfileCollection,
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
  Stream<List<MemberProfileModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    DocumentSnapshot? lastDoc;
    Stream<List<MemberProfileModel?>> values = getQuery(memberProfileCollection,
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
  Future<List<MemberProfileModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<MemberProfileModel?> values = await getQuery(memberProfileCollection,
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
  Future<List<MemberProfileModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) async {
    DocumentSnapshot? lastDoc;
    List<MemberProfileModel?> values = await getQuery(memberProfileCollection,
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
    return memberProfileCollection.get().then((snapshot) {
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
    return memberProfileCollection.doc(documentId).collection(name);
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
  Future<MemberProfileModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    var change = FieldValue.increment(changeByThisValue);
    return memberProfileCollection
        .doc(documentId)
        .update({fieldName: change}).then((v) => get(documentId));
  }

  final String appId;
  MemberProfileFirestore(this.getCollection, this.appId)
      : memberProfileCollection = getCollection();

  final CollectionReference memberProfileCollection;
  final GetCollection getCollection;
}
