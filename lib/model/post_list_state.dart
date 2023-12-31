/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_model.dart';

abstract class PostListState extends Equatable {
  const PostListState();

  @override
  List<Object?> get props => [];
}

class PostListLoading extends PostListState {}

class PostListLoaded extends PostListState {
  final List<PostModel?>? values;
  final bool? mightHaveMore;

  const PostListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'PostListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is PostListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class PostNotLoaded extends PostListState {}
