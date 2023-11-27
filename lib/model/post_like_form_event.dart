/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class PostLikeFormEvent extends Equatable {
  const PostLikeFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewPostLikeFormEvent extends PostLikeFormEvent {}

class InitialisePostLikeFormEvent extends PostLikeFormEvent {
  final PostLikeModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePostLikeFormEvent({this.value});
}

class InitialisePostLikeFormNoLoadEvent extends PostLikeFormEvent {
  final PostLikeModel? value;

  @override
  List<Object?> get props => [value];

  InitialisePostLikeFormNoLoadEvent({this.value});
}

class ChangedPostLikeDocumentID extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikeDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikeDocumentID{ value: $value }';
}

class ChangedPostLikePostId extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikePostId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikePostId{ value: $value }';
}

class ChangedPostLikePostCommentId extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikePostCommentId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikePostCommentId{ value: $value }';
}

class ChangedPostLikeMemberId extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikeMemberId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikeMemberId{ value: $value }';
}

class ChangedPostLikeTimestamp extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikeTimestamp({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikeTimestamp{ value: $value }';
}

class ChangedPostLikeAppId extends PostLikeFormEvent {
  final String? value;

  ChangedPostLikeAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikeAppId{ value: $value }';
}

class ChangedPostLikeLikeType extends PostLikeFormEvent {
  final LikeType? value;

  ChangedPostLikeLikeType({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedPostLikeLikeType{ value: $value }';
}
