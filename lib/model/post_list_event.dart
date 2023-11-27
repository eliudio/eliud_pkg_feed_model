/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_model.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();
  @override
  List<Object?> get props => [];
}

class LoadPostList extends PostListEvent {}

class NewPage extends PostListEvent {}

class AddPostList extends PostListEvent {
  final PostModel? value;

  const AddPostList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddPostList{ value: $value }';
}

class UpdatePostList extends PostListEvent {
  final PostModel? value;

  const UpdatePostList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdatePostList{ value: $value }';
}

class DeletePostList extends PostListEvent {
  final PostModel? value;

  const DeletePostList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeletePostList{ value: $value }';
}

class PostListUpdated extends PostListEvent {
  final List<PostModel?>? value;
  final bool? mightHaveMore;

  const PostListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'PostListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class PostChangeQuery extends PostListEvent {
  final EliudQuery? newQuery;

  const PostChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'PostChangeQuery{ value: $newQuery }';
}
