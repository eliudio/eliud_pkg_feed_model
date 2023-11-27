/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/labelled_body_component_model.dart';

abstract class LabelledBodyComponentListEvent extends Equatable {
  const LabelledBodyComponentListEvent();
  @override
  List<Object?> get props => [];
}

class LoadLabelledBodyComponentList extends LabelledBodyComponentListEvent {}

class NewPage extends LabelledBodyComponentListEvent {}

class AddLabelledBodyComponentList extends LabelledBodyComponentListEvent {
  final LabelledBodyComponentModel? value;

  const AddLabelledBodyComponentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddLabelledBodyComponentList{ value: $value }';
}

class UpdateLabelledBodyComponentList extends LabelledBodyComponentListEvent {
  final LabelledBodyComponentModel? value;

  const UpdateLabelledBodyComponentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateLabelledBodyComponentList{ value: $value }';
}

class DeleteLabelledBodyComponentList extends LabelledBodyComponentListEvent {
  final LabelledBodyComponentModel? value;

  const DeleteLabelledBodyComponentList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteLabelledBodyComponentList{ value: $value }';
}

class LabelledBodyComponentListUpdated extends LabelledBodyComponentListEvent {
  final List<LabelledBodyComponentModel?>? value;
  final bool? mightHaveMore;

  const LabelledBodyComponentListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'LabelledBodyComponentListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class LabelledBodyComponentChangeQuery extends LabelledBodyComponentListEvent {
  final EliudQuery? newQuery;

  const LabelledBodyComponentChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'LabelledBodyComponentChangeQuery{ value: $newQuery }';
}
