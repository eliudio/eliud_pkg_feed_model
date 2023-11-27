/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/labelled_body_component_model.dart';

abstract class LabelledBodyComponentListState extends Equatable {
  const LabelledBodyComponentListState();

  @override
  List<Object?> get props => [];
}

class LabelledBodyComponentListLoading extends LabelledBodyComponentListState {}

class LabelledBodyComponentListLoaded extends LabelledBodyComponentListState {
  final List<LabelledBodyComponentModel?>? values;
  final bool? mightHaveMore;

  const LabelledBodyComponentListLoaded(
      {this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'LabelledBodyComponentListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is LabelledBodyComponentListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class LabelledBodyComponentNotLoaded extends LabelledBodyComponentListState {}
