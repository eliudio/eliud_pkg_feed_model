/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_entity.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:collection';
import 'dart:convert';
import 'package:eliud_core_helpers/base/entity_base.dart';

class LabelledBodyComponentEntity implements EntityBase {
  final String? label;
  final String? componentName;
  final String? componentId;

  LabelledBodyComponentEntity({
    this.label,
    this.componentName,
    this.componentId,
  });

  LabelledBodyComponentEntity copyWith({
    String? documentID,
    String? label,
    String? componentName,
    String? componentId,
  }) {
    return LabelledBodyComponentEntity(
      label: label ?? this.label,
      componentName: componentName ?? this.componentName,
      componentId: componentId ?? this.componentId,
    );
  }

  List<Object?> get props => [
        label,
        componentName,
        componentId,
      ];

  @override
  String toString() {
    return 'LabelledBodyComponentEntity{label: $label, componentName: $componentName, componentId: $componentId}';
  }

  static LabelledBodyComponentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    if (o == null) return null;
    var map = o as Map<String, dynamic>;

    return LabelledBodyComponentEntity(
      label: map['label'],
      componentName: map['componentName'],
      componentId: map['componentId'],
    );
  }

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    if (label != null) {
      theDocument["label"] = label;
    } else {
      theDocument["label"] = null;
    }
    if (componentName != null) {
      theDocument["componentName"] = componentName;
    } else {
      theDocument["componentName"] = null;
    }
    if (componentId != null) {
      theDocument["componentId"] = componentId;
    } else {
      theDocument["componentId"] = null;
    }
    return theDocument;
  }

  @override
  LabelledBodyComponentEntity switchAppId({required String newAppId}) {
    var newEntity = copyWith();
    return newEntity;
  }

  static LabelledBodyComponentEntity? fromJsonString(String json,
      {Map<String, String>? newDocumentIds}) {
    Map<String, dynamic>? generationSpecificationMap = jsonDecode(json);
    return fromMap(generationSpecificationMap, newDocumentIds: newDocumentIds);
  }

  String toJsonString() {
    return jsonEncode(toDocument());
  }

  @override
  Future<Map<String, Object?>> enrichedDocument(
      Map<String, Object?> theDocument) async {
    return theDocument;
  }
}
