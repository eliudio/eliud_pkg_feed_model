/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';

abstract class FeedFrontListEvent extends Equatable {
  const FeedFrontListEvent();
  @override
  List<Object?> get props => [];
}

class LoadFeedFrontList extends FeedFrontListEvent {}

class NewPage extends FeedFrontListEvent {}

class AddFeedFrontList extends FeedFrontListEvent {
  final FeedFrontModel? value;

  const AddFeedFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddFeedFrontList{ value: $value }';
}

class UpdateFeedFrontList extends FeedFrontListEvent {
  final FeedFrontModel? value;

  const UpdateFeedFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateFeedFrontList{ value: $value }';
}

class DeleteFeedFrontList extends FeedFrontListEvent {
  final FeedFrontModel? value;

  const DeleteFeedFrontList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteFeedFrontList{ value: $value }';
}

class FeedFrontListUpdated extends FeedFrontListEvent {
  final List<FeedFrontModel?>? value;
  final bool? mightHaveMore;

  const FeedFrontListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'FeedFrontListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class FeedFrontChangeQuery extends FeedFrontListEvent {
  final EliudQuery? newQuery;

  const FeedFrontChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'FeedFrontChangeQuery{ value: $newQuery }';
}
