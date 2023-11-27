/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_model.dart';

/*
 * FeedMenuComponentEvent is the base class for events to be used with constructing a FeedMenuComponentBloc 
 */
abstract class FeedMenuComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchFeedMenuComponent is the event to instruct the bloc to fetch the component
 */
class FetchFeedMenuComponent extends FeedMenuComponentEvent {
  final String? id;

  /*
   * Construct the FetchFeedMenuComponent
   */
  FetchFeedMenuComponent({this.id});
}

/*
 * FeedMenuComponentUpdated is the event to inform the bloc that a component has been updated
 */
class FeedMenuComponentUpdated extends FeedMenuComponentEvent {
  final FeedMenuModel value;

  /*
   * Construct the FeedMenuComponentUpdated
   */
  FeedMenuComponentUpdated({required this.value});
}
