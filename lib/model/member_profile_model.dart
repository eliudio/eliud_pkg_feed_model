/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_model.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eliud_core_helpers/base/model_base.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/entity_export.dart';

import 'package:eliud_pkg_feed_model/model/member_profile_entity.dart';

enum MemberProfileAccessibleByGroup {
  public,
  followers,
  me,
  specificMembers,
  unknown
}

MemberProfileAccessibleByGroup toMemberProfileAccessibleByGroup(int? index) {
  switch (index) {
    case 0:
      return MemberProfileAccessibleByGroup.public;
    case 1:
      return MemberProfileAccessibleByGroup.followers;
    case 2:
      return MemberProfileAccessibleByGroup.me;
    case 3:
      return MemberProfileAccessibleByGroup.specificMembers;
  }
  return MemberProfileAccessibleByGroup.unknown;
}

class MemberProfileModel implements ModelBase, WithAppId {
  static const String packageName = 'eliud_pkg_feed_model';
  static const String id = 'memberProfiles';

  @override
  String documentID;
  @override
  String appId;

  // This is the identifier of the feed
  String? feedId;
  String? authorId;
  String? profile;
  MemberMediumModel? profileBackground;
  String? profileOverride;
  String? nameOverride;
  MemberProfileAccessibleByGroup? accessibleByGroup;

  // In case accessibleByGroup == SpecificMembers, then these are the members
  List<String>? accessibleByMembers;
  List<String>? readAccess;
  List<MemberMediumContainerModel>? memberMedia;

  MemberProfileModel({
    required this.documentID,
    required this.appId,
    this.feedId,
    this.authorId,
    this.profile,
    this.profileBackground,
    this.profileOverride,
    this.nameOverride,
    this.accessibleByGroup,
    this.accessibleByMembers,
    this.readAccess,
    this.memberMedia,
  });

  @override
  MemberProfileModel copyWith({
    String? documentID,
    String? appId,
    String? feedId,
    String? authorId,
    String? profile,
    MemberMediumModel? profileBackground,
    String? profileOverride,
    String? nameOverride,
    MemberProfileAccessibleByGroup? accessibleByGroup,
    List<String>? accessibleByMembers,
    List<String>? readAccess,
    List<MemberMediumContainerModel>? memberMedia,
  }) {
    return MemberProfileModel(
      documentID: documentID ?? this.documentID,
      appId: appId ?? this.appId,
      feedId: feedId ?? this.feedId,
      authorId: authorId ?? this.authorId,
      profile: profile ?? this.profile,
      profileBackground: profileBackground ?? this.profileBackground,
      profileOverride: profileOverride ?? this.profileOverride,
      nameOverride: nameOverride ?? this.nameOverride,
      accessibleByGroup: accessibleByGroup ?? this.accessibleByGroup,
      accessibleByMembers: accessibleByMembers ?? this.accessibleByMembers,
      readAccess: readAccess ?? this.readAccess,
      memberMedia: memberMedia ?? this.memberMedia,
    );
  }

  @override
  int get hashCode =>
      documentID.hashCode ^
      appId.hashCode ^
      feedId.hashCode ^
      authorId.hashCode ^
      profile.hashCode ^
      profileBackground.hashCode ^
      profileOverride.hashCode ^
      nameOverride.hashCode ^
      accessibleByGroup.hashCode ^
      accessibleByMembers.hashCode ^
      readAccess.hashCode ^
      memberMedia.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberProfileModel &&
          runtimeType == other.runtimeType &&
          documentID == other.documentID &&
          appId == other.appId &&
          feedId == other.feedId &&
          authorId == other.authorId &&
          profile == other.profile &&
          profileBackground == other.profileBackground &&
          profileOverride == other.profileOverride &&
          nameOverride == other.nameOverride &&
          accessibleByGroup == other.accessibleByGroup &&
          ListEquality()
              .equals(accessibleByMembers, other.accessibleByMembers) &&
          ListEquality().equals(readAccess, other.readAccess) &&
          ListEquality().equals(memberMedia, other.memberMedia);

  @override
  String toString() {
    String accessibleByMembersCsv =
        (accessibleByMembers == null) ? '' : accessibleByMembers!.join(', ');
    String readAccessCsv = (readAccess == null) ? '' : readAccess!.join(', ');
    String memberMediaCsv =
        (memberMedia == null) ? '' : memberMedia!.join(', ');

    return 'MemberProfileModel{documentID: $documentID, appId: $appId, feedId: $feedId, authorId: $authorId, profile: $profile, profileBackground: $profileBackground, profileOverride: $profileOverride, nameOverride: $nameOverride, accessibleByGroup: $accessibleByGroup, accessibleByMembers: String[] { $accessibleByMembersCsv }, readAccess: String[] { $readAccessCsv }, memberMedia: MemberMediumContainer[] { $memberMediaCsv }}';
  }

  @override
  Future<List<ModelReference>> collectReferences({String? appId}) async {
    List<ModelReference> referencesCollector = [];
    if (profileBackground != null) {
      referencesCollector.add(ModelReference(MemberMediumModel.packageName,
          MemberMediumModel.id, profileBackground!));
    }
    if (profileBackground != null) {
      referencesCollector
          .addAll(await profileBackground!.collectReferences(appId: appId));
    }
    if (memberMedia != null) {
      for (var item in memberMedia!) {
        referencesCollector.addAll(await item.collectReferences(appId: appId));
      }
    }
    return referencesCollector;
  }

  @override
  MemberProfileEntity toEntity({String? appId}) {
    return MemberProfileEntity(
      appId: appId,
      feedId: (feedId != null) ? feedId : null,
      authorId: (authorId != null) ? authorId : null,
      profile: (profile != null) ? profile : null,
      profileBackgroundId:
          (profileBackground != null) ? profileBackground!.documentID : null,
      profileOverride: (profileOverride != null) ? profileOverride : null,
      nameOverride: (nameOverride != null) ? nameOverride : null,
      accessibleByGroup:
          (accessibleByGroup != null) ? accessibleByGroup!.index : null,
      accessibleByMembers:
          (accessibleByMembers != null) ? accessibleByMembers : null,
      readAccess: (readAccess != null) ? readAccess : null,
      memberMedia: (memberMedia != null)
          ? memberMedia!.map((item) => item.toEntity(appId: appId)).toList()
          : null,
    );
  }

  static Future<MemberProfileModel?> fromEntity(
      String documentID, MemberProfileEntity? entity) async {
    if (entity == null) return null;
    var counter = 0;
    return MemberProfileModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      feedId: entity.feedId,
      authorId: entity.authorId,
      profile: entity.profile,
      profileOverride: entity.profileOverride,
      nameOverride: entity.nameOverride,
      accessibleByGroup:
          toMemberProfileAccessibleByGroup(entity.accessibleByGroup),
      accessibleByMembers: entity.accessibleByMembers,
      readAccess: entity.readAccess,
      memberMedia: entity.memberMedia == null
          ? null
          : List<MemberMediumContainerModel>.from(
              await Future.wait(entity.memberMedia!.map((item) {
              counter++;
              return MemberMediumContainerModel.fromEntity(
                  counter.toString(), item);
            }).toList())),
    );
  }

  static Future<MemberProfileModel?> fromEntityPlus(
      String documentID, MemberProfileEntity? entity,
      {String? appId}) async {
    if (entity == null) return null;

    MemberMediumModel? profileBackgroundHolder;
    if (entity.profileBackgroundId != null) {
      try {
        profileBackgroundHolder = await memberMediumRepository(appId: appId)!
            .get(entity.profileBackgroundId);
      } on Exception catch (e) {
        print('Error whilst trying to initialise profileBackground');
        print(
            'Error whilst retrieving memberMedium with id ${entity.profileBackgroundId}');
        print('Exception: $e');
      }
    }

    var counter = 0;
    return MemberProfileModel(
      documentID: documentID,
      appId: entity.appId ?? '',
      feedId: entity.feedId,
      authorId: entity.authorId,
      profile: entity.profile,
      profileBackground: profileBackgroundHolder,
      profileOverride: entity.profileOverride,
      nameOverride: entity.nameOverride,
      accessibleByGroup:
          toMemberProfileAccessibleByGroup(entity.accessibleByGroup),
      accessibleByMembers: entity.accessibleByMembers,
      readAccess: entity.readAccess,
      memberMedia: entity.memberMedia == null
          ? null
          : List<MemberMediumContainerModel>.from(
              await Future.wait(entity.memberMedia!.map((item) {
              counter++;
              return MemberMediumContainerModel.fromEntityPlus(
                  counter.toString(), item,
                  appId: appId);
            }).toList())),
    );
  }
}
