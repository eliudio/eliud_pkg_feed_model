/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class ProfileFormEvent extends Equatable {
  const ProfileFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewProfileFormEvent extends ProfileFormEvent {}

class InitialiseProfileFormEvent extends ProfileFormEvent {
  final ProfileModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseProfileFormEvent({this.value});
}

class InitialiseProfileFormNoLoadEvent extends ProfileFormEvent {
  final ProfileModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseProfileFormNoLoadEvent({this.value});
}

class ChangedProfileDocumentID extends ProfileFormEvent {
  final String? value;

  ChangedProfileDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileDocumentID{ value: $value }';
}

class ChangedProfileAppId extends ProfileFormEvent {
  final String? value;

  ChangedProfileAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileAppId{ value: $value }';
}

class ChangedProfileDescription extends ProfileFormEvent {
  final String? value;

  ChangedProfileDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileDescription{ value: $value }';
}

class ChangedProfileFeed extends ProfileFormEvent {
  final String? value;

  ChangedProfileFeed({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileFeed{ value: $value }';
}

class ChangedProfileBackgroundOverride extends ProfileFormEvent {
  final BackgroundModel? value;

  ChangedProfileBackgroundOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileBackgroundOverride{ value: $value }';
}

class ChangedProfileConditions extends ProfileFormEvent {
  final StorageConditionsModel? value;

  ChangedProfileConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedProfileConditions{ value: $value }';
}
