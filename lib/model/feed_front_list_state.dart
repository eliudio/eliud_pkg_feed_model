/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';

abstract class FeedFrontListState extends Equatable {
  const FeedFrontListState();

  @override
  List<Object?> get props => [];
}

class FeedFrontListLoading extends FeedFrontListState {}

class FeedFrontListLoaded extends FeedFrontListState {
  final List<FeedFrontModel?>? values;
  final bool? mightHaveMore;

  const FeedFrontListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'FeedFrontListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is FeedFrontListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class FeedFrontNotLoaded extends FeedFrontListState {}
