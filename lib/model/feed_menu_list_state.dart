/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_model.dart';

abstract class FeedMenuListState extends Equatable {
  const FeedMenuListState();

  @override
  List<Object?> get props => [];
}

class FeedMenuListLoading extends FeedMenuListState {}

class FeedMenuListLoaded extends FeedMenuListState {
  final List<FeedMenuModel?>? values;
  final bool? mightHaveMore;

  const FeedMenuListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'FeedMenuListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is FeedMenuListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class FeedMenuNotLoaded extends FeedMenuListState {}
