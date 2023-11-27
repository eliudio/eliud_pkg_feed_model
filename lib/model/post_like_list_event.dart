/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_like_model.dart';

abstract class PostLikeListEvent extends Equatable {
  const PostLikeListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPostLikeList extends PostLikeListEvent {}

class NewPage extends PostLikeListEvent {}

class AddPostLikeList extends PostLikeListEvent {
  final PostLikeModel? value;

  const AddPostLikeList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddPostLikeList{ value: $value }';
}

class UpdatePostLikeList extends PostLikeListEvent {
  final PostLikeModel? value;

  const UpdatePostLikeList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdatePostLikeList{ value: $value }';
}

class DeletePostLikeList extends PostLikeListEvent {
  final PostLikeModel? value;

  const DeletePostLikeList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeletePostLikeList{ value: $value }';
}

class PostLikeListUpdated extends PostLikeListEvent {
  final List<PostLikeModel?>? value;
  final bool? mightHaveMore;

  const PostLikeListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'PostLikeListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PostLikeChangeQuery extends PostLikeListEvent {
  final EliudQuery? newQuery;

  const PostLikeChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'PostLikeChangeQuery{ value: $newQuery }';
}
