/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_model.dart';

abstract class PostCommentListEvent extends Equatable {
  const PostCommentListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPostCommentList extends PostCommentListEvent {}

class NewPage extends PostCommentListEvent {}

class AddPostCommentList extends PostCommentListEvent {
  final PostCommentModel? value;

  const AddPostCommentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddPostCommentList{ value: $value }';
}

class UpdatePostCommentList extends PostCommentListEvent {
  final PostCommentModel? value;

  const UpdatePostCommentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdatePostCommentList{ value: $value }';
}

class DeletePostCommentList extends PostCommentListEvent {
  final PostCommentModel? value;

  const DeletePostCommentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeletePostCommentList{ value: $value }';
}

class PostCommentListUpdated extends PostCommentListEvent {
  final List<PostCommentModel?>? value;
  final bool? mightHaveMore;

  const PostCommentListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'PostCommentListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PostCommentChangeQuery extends PostCommentListEvent {
  final EliudQuery? newQuery;

  const PostCommentChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'PostCommentChangeQuery{ value: $newQuery }';
}
