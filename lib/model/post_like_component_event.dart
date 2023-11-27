/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_like_model.dart';

/*
 * PostLikeComponentEvent is the base class for events to be used with constructing a PostLikeComponentBloc 
 */
abstract class PostLikeComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPostLikeComponent is the event to instruct the bloc to fetch the component
 */
class FetchPostLikeComponent extends PostLikeComponentEvent {
  final String? id;

  /*
   * Construct the FetchPostLikeComponent
   */
  FetchPostLikeComponent({this.id});
}

/*
 * PostLikeComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PostLikeComponentUpdated extends PostLikeComponentEvent {
  final PostLikeModel value;

  /*
   * Construct the PostLikeComponentUpdated
   */
  PostLikeComponentUpdated({required this.value});
}
