/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/base/entity_base.dart';
import 'package:eliud_core_model/model/entity_export.dart';

class MemberProfileEntity implements EntityBase {
  final String? appId;
  final String? feedId;
  final String? authorId;
  final String? profile;
  final String? profileBackgroundId;
  final String? profileOverride;
  final String? nameOverride;
  final int? accessibleByGroup;
  final List<String>? accessibleByMembers;
  final List<String>? readAccess;
  final List<MemberMediumContainerEntity>? memberMedia;

  MemberProfileEntity({
    required this.appId,
    this.feedId,
    this.authorId,
    this.profile,
    this.profileBackgroundId,
    this.profileOverride,
    this.nameOverride,
    this.accessibleByGroup,
    this.accessibleByMembers,
    this.readAccess,
    this.memberMedia,
  });

  MemberProfileEntity copyWith({
    String? documentID,
    String? appId,
    String? feedId,
    String? authorId,
    String? profile,
    String? profileBackgroundId,
    String? profileOverride,
    String? nameOverride,
    int? accessibleByGroup,
    List<String>? accessibleByMembers,
    List<String>? readAccess,
    List<MemberMediumContainerEntity>? memberMedia,
  }) {
    return MemberProfileEntity(
      appId: appId ?? this.appId,
      feedId: feedId ?? this.feedId,
      authorId: authorId ?? this.authorId,
      profile: profile ?? this.profile,
      profileBackgroundId: profileBackgroundId ?? this.profileBackgroundId,
      profileOverride: profileOverride ?? this.profileOverride,
      nameOverride: nameOverride ?? this.nameOverride,
      accessibleByGroup: accessibleByGroup ?? this.accessibleByGroup,
      accessibleByMembers: accessibleByMembers ?? this.accessibleByMembers,
      readAccess: readAccess ?? this.readAccess,
      memberMedia: memberMedia ?? this.memberMedia,
    );
  }

  List<Object?> get props => [
        appId,
        feedId,
        authorId,
        profile,
        profileBackgroundId,
        profileOverride,
        nameOverride,
        accessibleByGroup,
        accessibleByMembers,
        readAccess,
        memberMedia,
      ];

  @override
  String toString() {
    String accessibleByMembersCsv =
        (accessibleByMembers == null) ? '' : accessibleByMembers!.join(', ');
    String readAccessCsv = (readAccess == null) ? '' : readAccess!.join(', ');
    String memberMediaCsv =
        (memberMedia == null) ? '' : memberMedia!.join(', ');

    return 'MemberProfileEntity{appId: $appId, feedId: $feedId, authorId: $authorId, profile: $profile, profileBackgroundId: $profileBackgroundId, profileOverride: $profileOverride, nameOverride: $nameOverride, accessibleByGroup: $accessibleByGroup, accessibleByMembers: String[] { $accessibleByMembersCsv }, readAccess: String[] { $readAccessCsv }, memberMedia: MemberMediumContainer[] { $memberMediaCsv }}';
  }

  static MemberProfileEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    var profileBackgroundIdNewDocmentId = map['profileBackgroundId'];
    if ((newDocumentIds != null) && (profileBackgroundIdNewDocmentId != null)) {
      var profileBackgroundIdOldDocmentId = profileBackgroundIdNewDocmentId;
      profileBackgroundIdNewDocmentId = newRandomKey();
      newDocumentIds[profileBackgroundIdOldDocmentId] =
          profileBackgroundIdNewDocmentId;
    }
    var memberMediaFromMap = map['memberMedia'];
    List<MemberMediumContainerEntity> memberMediaList;
    if (memberMediaFromMap != null) {
      memberMediaList = (map['memberMedia'] as List<dynamic>)
          .map((dynamic item) => MemberMediumContainerEntity.fromMap(
              item as Map,
              newDocumentIds: newDocumentIds)!)
          .toList();
    } else {
      memberMediaList = [];
    }

    return MemberProfileEntity(
      appId: map['appId'],
      feedId: map['feedId'],
      authorId: map['authorId'],
      profile: map['profile'],
      profileBackgroundId: profileBackgroundIdNewDocmentId,
      profileOverride: map['profileOverride'],
      nameOverride: map['nameOverride'],
      accessibleByGroup: map['accessibleByGroup'],
      accessibleByMembers: map['accessibleByMembers'] == null
          ? null
          : List.from(map['accessibleByMembers']),
      readAccess:
          map['readAccess'] == null ? null : List.from(map['readAccess']),
      memberMedia: memberMediaList,
    );
  }

  @override
  Map<String, Object?> toDocument() {
    final List<Map<String?, dynamic>>? memberMediaListMap = memberMedia != null
        ? memberMedia!.map((item) => item.toDocument()).toList()
        : null;

    Map<String, Object?> theDocument = HashMap();
    if (appId != null) {
      theDocument["appId"] = appId;
    } else {
      theDocument["appId"] = null;
    }
    if (feedId != null) {
      theDocument["feedId"] = feedId;
    } else {
      theDocument["feedId"] = null;
    }
    if (authorId != null) {
      theDocument["authorId"] = authorId;
    } else {
      theDocument["authorId"] = null;
    }
    if (profile != null) {
      theDocument["profile"] = profile;
    } else {
      theDocument["profile"] = null;
    }
    if (profileBackgroundId != null) {
      theDocument["profileBackgroundId"] = profileBackgroundId;
    } else {
      theDocument["profileBackgroundId"] = null;
    }
    if (profileOverride != null) {
      theDocument["profileOverride"] = profileOverride;
    } else {
      theDocument["profileOverride"] = null;
    }
    if (nameOverride != null) {
      theDocument["nameOverride"] = nameOverride;
    } else {
      theDocument["nameOverride"] = null;
    }
    if (accessibleByGroup != null) {
      theDocument["accessibleByGroup"] = accessibleByGroup;
    } else {
      theDocument["accessibleByGroup"] = null;
    }
    if (accessibleByMembers != null) {
      theDocument["accessibleByMembers"] = accessibleByMembers!.toList();
    } else {
      theDocument["accessibleByMembers"] = null;
    }
    if (readAccess != null) {
      theDocument["readAccess"] = readAccess!.toList();
    } else {
      theDocument["readAccess"] = null;
    }
    if (memberMedia != null) {
      theDocument["memberMedia"] = memberMediaListMap;
    } else {
      theDocument["memberMedia"] = null;
    }
    return theDocument;
  }

  @override
  MemberProfileEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith(appId: newAppId);
    return newEntity;
  }

  static MemberProfileEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
