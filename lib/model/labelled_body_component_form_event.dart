/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

@immutable
abstract class LabelledBodyComponentFormEvent extends Equatable {
  const LabelledBodyComponentFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewLabelledBodyComponentFormEvent
    extends LabelledBodyComponentFormEvent {}

class InitialiseLabelledBodyComponentFormEvent
    extends LabelledBodyComponentFormEvent {
  final LabelledBodyComponentModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseLabelledBodyComponentFormEvent({this.value});
}

class InitialiseLabelledBodyComponentFormNoLoadEvent
    extends LabelledBodyComponentFormEvent {
  final LabelledBodyComponentModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseLabelledBodyComponentFormNoLoadEvent({this.value});
}

class ChangedLabelledBodyComponentDocumentID
    extends LabelledBodyComponentFormEvent {
  final String? value;

  ChangedLabelledBodyComponentDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedLabelledBodyComponentDocumentID{ value: $value }';
}

class ChangedLabelledBodyComponentLabel extends LabelledBodyComponentFormEvent {
  final String? value;

  ChangedLabelledBodyComponentLabel({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedLabelledBodyComponentLabel{ value: $value }';
}

class ChangedLabelledBodyComponentComponentName
    extends LabelledBodyComponentFormEvent {
  final String? value;

  ChangedLabelledBodyComponentComponentName({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedLabelledBodyComponentComponentName{ value: $value }';
}

class ChangedLabelledBodyComponentComponentId
    extends LabelledBodyComponentFormEvent {
  final String? value;

  ChangedLabelledBodyComponentComponentId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() =>
      'ChangedLabelledBodyComponentComponentId{ value: $value }';
}
