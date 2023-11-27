/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_model.dart';

abstract class PostCommentListState extends Equatable {
  const PostCommentListState();

  @override
  List<Object?> get props => [];
}

class PostCommentListLoading extends PostCommentListState {}

class PostCommentListLoaded extends PostCommentListState {
  final List<PostCommentModel?>? values;
  final bool? mightHaveMore;

  const PostCommentListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'PostCommentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is PostCommentListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class PostCommentNotLoaded extends PostCommentListState {}
