/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_model/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class PostFormEvent extends Equatable {
  const PostFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPostFormEvent extends PostFormEvent {}

class InitialisePostFormEvent extends PostFormEvent {
  final PostModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePostFormEvent({this.value});
}

class InitialisePostFormNoLoadEvent extends PostFormEvent {
  final PostModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePostFormNoLoadEvent({this.value});
}

class ChangedPostDocumentID extends PostFormEvent {
  final String? value;

  ChangedPostDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostDocumentID{ value: $value }';
}

class ChangedPostAuthorId extends PostFormEvent {
  final String? value;

  ChangedPostAuthorId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostAuthorId{ value: $value }';
}

class ChangedPostTimestamp extends PostFormEvent {
  final String? value;

  ChangedPostTimestamp({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostTimestamp{ value: $value }';
}

class ChangedPostAppId extends PostFormEvent {
  final String? value;

  ChangedPostAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostAppId{ value: $value }';
}

class ChangedPostFeedId extends PostFormEvent {
  final String? value;

  ChangedPostFeedId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostFeedId{ value: $value }';
}

class ChangedPostPostAppId extends PostFormEvent {
  final String? value;

  ChangedPostPostAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostPostAppId{ value: $value }';
}

class ChangedPostPostPageId extends PostFormEvent {
  final String? value;

  ChangedPostPostPageId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostPostPageId{ value: $value }';
}

class ChangedPostPageParameters extends PostFormEvent {
  final Map<String, dynamic>? value;

  ChangedPostPageParameters({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostPageParameters{ value: $value }';
}

class ChangedPostHtml extends PostFormEvent {
  final String? value;

  ChangedPostHtml({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostHtml{ value: $value }';
}

class ChangedPostDescription extends PostFormEvent {
  final String? value;

  ChangedPostDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostDescription{ value: $value }';
}

class ChangedPostLikes extends PostFormEvent {
  final String? value;

  ChangedPostLikes({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikes{ value: $value }';
}

class ChangedPostDislikes extends PostFormEvent {
  final String? value;

  ChangedPostDislikes({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostDislikes{ value: $value }';
}

class ChangedPostAccessibleByGroup extends PostFormEvent {
  final PostAccessibleByGroup? value;

  ChangedPostAccessibleByGroup({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostAccessibleByGroup{ value: $value }';
}

class ChangedPostAccessibleByMembers extends PostFormEvent {
  final String? value;

  ChangedPostAccessibleByMembers({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostAccessibleByMembers{ value: $value }';
}

class ChangedPostReadAccess extends PostFormEvent {
  final String? value;

  ChangedPostReadAccess({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostReadAccess{ value: $value }';
}

class ChangedPostArchived extends PostFormEvent {
  final PostArchiveStatus? value;

  ChangedPostArchived({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostArchived{ value: $value }';
}

class ChangedPostExternalLink extends PostFormEvent {
  final String? value;

  ChangedPostExternalLink({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostExternalLink{ value: $value }';
}

class ChangedPostMemberMedia extends PostFormEvent {
  final List<MemberMediumContainerModel>? value;

  ChangedPostMemberMedia({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostMemberMedia{ value: $value }';
}
