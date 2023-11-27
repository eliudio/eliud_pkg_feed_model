import 'dart:collection';

import 'package:eliud_core_main/model/display_conditions_entity.dart';
import 'package:eliud_core_main/apis/action_api/action_entity.dart';

class PostActionEntity extends ActionEntity {
  static const String label = "Post";
  final String? feedId;

  const PostActionEntity(
      {String? appId, DisplayConditionsEntity? conditions, this.feedId})
      : super(appId, conditions: conditions, actionType: label);

  @override
  Map<String, Object?> toDocument() {
    Map<String, Object?> theDocument = HashMap();
    theDocument["appID"] = appID;
    theDocument["actionType"] = actionType;
    if (feedId != null) {
      theDocument["feedId"] = feedId;
    } else {
      theDocument["feedId"] = null;
    }
    theDocument['conditions'] =
        conditions == null ? null : conditions!.toDocument();

    return theDocument;
  }

  static PostActionEntity fromMap(Map snap) {
    return PostActionEntity(
      appId: snap["appID"],
      feedId: snap["feedId"],
      conditions: DisplayConditionsEntity.fromMap(snap['conditions']),
    );
  }

  @override
  PostActionEntity copyWith(
      {String? appId, DisplayConditionsEntity? conditions, String? feedId}) {
    return PostActionEntity(
        appId: appId ?? appID,
        conditions: conditions ?? this.conditions,
        feedId: feedId ?? this.feedId);
  }
}
