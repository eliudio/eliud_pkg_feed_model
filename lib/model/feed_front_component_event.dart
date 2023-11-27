/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';

/*
 * FeedFrontComponentEvent is the base class for events to be used with constructing a FeedFrontComponentBloc 
 */
abstract class FeedFrontComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFeedFrontComponent is the event to instruct the bloc to fetch the component
 */
class FetchFeedFrontComponent extends FeedFrontComponentEvent {
  final String? id;

  /*
   * Construct the FetchFeedFrontComponent
   */
  FetchFeedFrontComponent({this.id});
}

/*
 * FeedFrontComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FeedFrontComponentUpdated extends FeedFrontComponentEvent {
  final FeedFrontModel value;

  /*
   * Construct the FeedFrontComponentUpdated
   */
  FeedFrontComponentUpdated({required this.value});
}
