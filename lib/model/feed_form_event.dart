/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class FeedFormEvent extends Equatable {
  const FeedFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewFeedFormEvent extends FeedFormEvent {}

class InitialiseFeedFormEvent extends FeedFormEvent {
  final FeedModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedFormEvent({this.value});
}

class InitialiseFeedFormNoLoadEvent extends FeedFormEvent {
  final FeedModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseFeedFormNoLoadEvent({this.value});
}

class ChangedFeedDocumentID extends FeedFormEvent {
  final String? value;

  ChangedFeedDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedDocumentID{ value: $value }';
}

class ChangedFeedAppId extends FeedFormEvent {
  final String? value;

  ChangedFeedAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedAppId{ value: $value }';
}

class ChangedFeedDescription extends FeedFormEvent {
  final String? value;

  ChangedFeedDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedDescription{ value: $value }';
}

class ChangedFeedThumbImage extends FeedFormEvent {
  final ThumbStyle? value;

  ChangedFeedThumbImage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedThumbImage{ value: $value }';
}

class ChangedFeedPhotoPost extends FeedFormEvent {
  final bool? value;

  ChangedFeedPhotoPost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedPhotoPost{ value: $value }';
}

class ChangedFeedVideoPost extends FeedFormEvent {
  final bool? value;

  ChangedFeedVideoPost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedVideoPost{ value: $value }';
}

class ChangedFeedMessagePost extends FeedFormEvent {
  final bool? value;

  ChangedFeedMessagePost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedMessagePost{ value: $value }';
}

class ChangedFeedAudioPost extends FeedFormEvent {
  final bool? value;

  ChangedFeedAudioPost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedAudioPost{ value: $value }';
}

class ChangedFeedAlbumPost extends FeedFormEvent {
  final bool? value;

  ChangedFeedAlbumPost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedAlbumPost{ value: $value }';
}

class ChangedFeedArticlePost extends FeedFormEvent {
  final bool? value;

  ChangedFeedArticlePost({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedFeedArticlePost{ value: $value }';
}
