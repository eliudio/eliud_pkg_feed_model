/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_model.dart';

/*
 * PostCommentComponentEvent is the base class for events to be used with constructing a PostCommentComponentBloc 
 */
abstract class PostCommentComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPostCommentComponent is the event to instruct the bloc to fetch the component
 */
class FetchPostCommentComponent extends PostCommentComponentEvent {
  final String? id;

  /*
   * Construct the FetchPostCommentComponent
   */
  FetchPostCommentComponent({this.id});
}

/*
 * PostCommentComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PostCommentComponentUpdated extends PostCommentComponentEvent {
  final PostCommentModel value;

  /*
   * Construct the PostCommentComponentUpdated
   */
  PostCommentComponentUpdated({required this.value});
}
