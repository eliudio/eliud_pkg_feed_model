/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/profile_model.dart';

abstract class ProfileListEvent extends Equatable {
  const ProfileListEvent();
  @override
  List<Object?> get props => [];
}

class LoadProfileList extends ProfileListEvent {}

class NewPage extends ProfileListEvent {}

class AddProfileList extends ProfileListEvent {
  final ProfileModel? value;

  const AddProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddProfileList{ value: $value }';
}

class UpdateProfileList extends ProfileListEvent {
  final ProfileModel? value;

  const UpdateProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateProfileList{ value: $value }';
}

class DeleteProfileList extends ProfileListEvent {
  final ProfileModel? value;

  const DeleteProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteProfileList{ value: $value }';
}

class ProfileListUpdated extends ProfileListEvent {
  final List<ProfileModel?>? value;
  final bool? mightHaveMore;

  const ProfileListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'ProfileListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class ProfileChangeQuery extends ProfileListEvent {
  final EliudQuery? newQuery;

  const ProfileChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'ProfileChangeQuery{ value: $newQuery }';
}
