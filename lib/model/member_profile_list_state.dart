/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_model.dart';

abstract class MemberProfileListState extends Equatable {
  const MemberProfileListState();

  @override
  List<Object?> get props => [];
}

class MemberProfileListLoading extends MemberProfileListState {}

class MemberProfileListLoaded extends MemberProfileListState {
  final List<MemberProfileModel?>? values;
  final bool? mightHaveMore;

  const MemberProfileListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'MemberProfileListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MemberProfileListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MemberProfileNotLoaded extends MemberProfileListState {}
