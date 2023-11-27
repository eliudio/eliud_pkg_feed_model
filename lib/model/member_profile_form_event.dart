/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class MemberProfileFormEvent extends Equatable {
  const MemberProfileFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewMemberProfileFormEvent extends MemberProfileFormEvent {}

class InitialiseMemberProfileFormEvent extends MemberProfileFormEvent {
  final MemberProfileModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseMemberProfileFormEvent({this.value});
}

class InitialiseMemberProfileFormNoLoadEvent extends MemberProfileFormEvent {
  final MemberProfileModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseMemberProfileFormNoLoadEvent({this.value});
}

class ChangedMemberProfileDocumentID extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileDocumentID{ value: $value }';
}

class ChangedMemberProfileAppId extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileAppId{ value: $value }';
}

class ChangedMemberProfileFeedId extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileFeedId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileFeedId{ value: $value }';
}

class ChangedMemberProfileAuthorId extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileAuthorId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileAuthorId{ value: $value }';
}

class ChangedMemberProfileProfile extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileProfile({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileProfile{ value: $value }';
}

class ChangedMemberProfileProfileBackground extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileProfileBackground({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileProfileBackground{ value: $value }';
}

class ChangedMemberProfileProfileOverride extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileProfileOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileProfileOverride{ value: $value }';
}

class ChangedMemberProfileNameOverride extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileNameOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileNameOverride{ value: $value }';
}

class ChangedMemberProfileAccessibleByGroup extends MemberProfileFormEvent {
  final MemberProfileAccessibleByGroup? value;

  ChangedMemberProfileAccessibleByGroup({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileAccessibleByGroup{ value: $value }';
}

class ChangedMemberProfileAccessibleByMembers extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileAccessibleByMembers({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedMemberProfileAccessibleByMembers{ value: $value }';
}

class ChangedMemberProfileReadAccess extends MemberProfileFormEvent {
  final String? value;

  ChangedMemberProfileReadAccess({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileReadAccess{ value: $value }';
}

class ChangedMemberProfileMemberMedia extends MemberProfileFormEvent {
  final List<MemberMediumContainerModel>? value;

  ChangedMemberProfileMemberMedia({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMemberProfileMemberMedia{ value: $value }';
}
