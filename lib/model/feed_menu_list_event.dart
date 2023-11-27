/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_model.dart';

abstract class FeedMenuListEvent extends Equatable {
  const FeedMenuListEvent();
  @override
  List<Object?> get props => [];
}

class LoadFeedMenuList extends FeedMenuListEvent {}

class NewPage extends FeedMenuListEvent {}

class AddFeedMenuList extends FeedMenuListEvent {
  final FeedMenuModel? value;

  const AddFeedMenuList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddFeedMenuList{ value: $value }';
}

class UpdateFeedMenuList extends FeedMenuListEvent {
  final FeedMenuModel? value;

  const UpdateFeedMenuList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateFeedMenuList{ value: $value }';
}

class DeleteFeedMenuList extends FeedMenuListEvent {
  final FeedMenuModel? value;

  const DeleteFeedMenuList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteFeedMenuList{ value: $value }';
}

class FeedMenuListUpdated extends FeedMenuListEvent {
  final List<FeedMenuModel?>? value;
  final bool? mightHaveMore;

  const FeedMenuListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'FeedMenuListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class FeedMenuChangeQuery extends FeedMenuListEvent {
  final EliudQuery? newQuery;

  const FeedMenuChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'FeedMenuChangeQuery{ value: $newQuery }';
}
