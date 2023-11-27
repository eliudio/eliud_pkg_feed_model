/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class FeedFrontFormEvent extends Equatable {
  const FeedFrontFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFeedFrontFormEvent extends FeedFrontFormEvent {}

class InitialiseFeedFrontFormEvent extends FeedFrontFormEvent {
  final FeedFrontModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedFrontFormEvent({this.value});
}

class InitialiseFeedFrontFormNoLoadEvent extends FeedFrontFormEvent {
  final FeedFrontModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedFrontFormNoLoadEvent({this.value});
}

class ChangedFeedFrontDocumentID extends FeedFrontFormEvent {
  final String? value;

  ChangedFeedFrontDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedFrontDocumentID{ value: $value }';
}

class ChangedFeedFrontAppId extends FeedFrontFormEvent {
  final String? value;

  ChangedFeedFrontAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedFrontAppId{ value: $value }';
}

class ChangedFeedFrontDescription extends FeedFrontFormEvent {
  final String? value;

  ChangedFeedFrontDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedFrontDescription{ value: $value }';
}

class ChangedFeedFrontFeed extends FeedFrontFormEvent {
  final String? value;

  ChangedFeedFrontFeed({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedFrontFeed{ value: $value }';
}

class ChangedFeedFrontBackgroundOverridePosts extends FeedFrontFormEvent {
  final BackgroundModel? value;

  ChangedFeedFrontBackgroundOverridePosts({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFeedFrontBackgroundOverridePosts{ value: $value }';
}

class ChangedFeedFrontBackgroundOverrideProfile extends FeedFrontFormEvent {
  final BackgroundModel? value;

  ChangedFeedFrontBackgroundOverrideProfile({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedFeedFrontBackgroundOverrideProfile{ value: $value }';
}

class ChangedFeedFrontConditions extends FeedFrontFormEvent {
  final StorageConditionsModel? value;

  ChangedFeedFrontConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedFrontConditions{ value: $value }';
}
