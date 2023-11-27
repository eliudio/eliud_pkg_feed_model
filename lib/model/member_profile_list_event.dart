/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_model.dart';

abstract class MemberProfileListEvent extends Equatable {
  const MemberProfileListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMemberProfileList extends MemberProfileListEvent {}

class NewPage extends MemberProfileListEvent {}

class AddMemberProfileList extends MemberProfileListEvent {
  final MemberProfileModel? value;

  const AddMemberProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddMemberProfileList{ value: $value }';
}

class UpdateMemberProfileList extends MemberProfileListEvent {
  final MemberProfileModel? value;

  const UpdateMemberProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateMemberProfileList{ value: $value }';
}

class DeleteMemberProfileList extends MemberProfileListEvent {
  final MemberProfileModel? value;

  const DeleteMemberProfileList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteMemberProfileList{ value: $value }';
}

class MemberProfileListUpdated extends MemberProfileListEvent {
  final List<MemberProfileModel?>? value;
  final bool? mightHaveMore;

  const MemberProfileListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'MemberProfileListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MemberProfileChangeQuery extends MemberProfileListEvent {
  final EliudQuery? newQuery;

  const MemberProfileChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'MemberProfileChangeQuery{ value: $newQuery }';
}
