/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class FeedMenuFormEvent extends Equatable {
  const FeedMenuFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFeedMenuFormEvent extends FeedMenuFormEvent {}

class InitialiseFeedMenuFormEvent extends FeedMenuFormEvent {
  final FeedMenuModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedMenuFormEvent({this.value});
}

class InitialiseFeedMenuFormNoLoadEvent extends FeedMenuFormEvent {
  final FeedMenuModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedMenuFormNoLoadEvent({this.value});
}

class ChangedFeedMenuDocumentID extends FeedMenuFormEvent {
  final String? value;

  ChangedFeedMenuDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuDocumentID{ value: $value }';
}

class ChangedFeedMenuAppId extends FeedMenuFormEvent {
  final String? value;

  ChangedFeedMenuAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuAppId{ value: $value }';
}

class ChangedFeedMenuDescription extends FeedMenuFormEvent {
  final String? value;

  ChangedFeedMenuDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuDescription{ value: $value }';
}

class ChangedFeedMenuBodyComponentsCurrentMember extends FeedMenuFormEvent {
  final List<LabelledBodyComponentModel>? value;

  ChangedFeedMenuBodyComponentsCurrentMember({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFeedMenuBodyComponentsCurrentMember{ value: $value }';
}

class ChangedFeedMenuBodyComponentsOtherMember extends FeedMenuFormEvent {
  final List<LabelledBodyComponentModel>? value;

  ChangedFeedMenuBodyComponentsOtherMember({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFeedMenuBodyComponentsOtherMember{ value: $value }';
}

class ChangedFeedMenuItemColor extends FeedMenuFormEvent {
  final RgbModel? value;

  ChangedFeedMenuItemColor({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuItemColor{ value: $value }';
}

class ChangedFeedMenuSelectedItemColor extends FeedMenuFormEvent {
  final RgbModel? value;

  ChangedFeedMenuSelectedItemColor({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuSelectedItemColor{ value: $value }';
}

class ChangedFeedMenuBackgroundOverride extends FeedMenuFormEvent {
  final BackgroundModel? value;

  ChangedFeedMenuBackgroundOverride({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuBackgroundOverride{ value: $value }';
}

class ChangedFeedMenuFeedFront extends FeedMenuFormEvent {
  final String? value;

  ChangedFeedMenuFeedFront({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuFeedFront{ value: $value }';
}

class ChangedFeedMenuConditions extends FeedMenuFormEvent {
  final StorageConditionsModel? value;

  ChangedFeedMenuConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMenuConditions{ value: $value }';
}
