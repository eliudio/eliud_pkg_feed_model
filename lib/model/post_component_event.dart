/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_model.dart';

/*
 * PostComponentEvent is the base class for events to be used with constructing a PostComponentBloc 
 */
abstract class PostComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchPostComponent is the event to instruct the bloc to fetch the component
 */
class FetchPostComponent extends PostComponentEvent {
  final String? id;

  /*
   * Construct the FetchPostComponent
   */
  FetchPostComponent({this.id});
}

/*
 * PostComponentUpdated is the event to inform the bloc that a component has been updated
 */
class PostComponentUpdated extends PostComponentEvent {
  final PostModel value;

  /*
   * Construct the PostComponentUpdated
   */
  PostComponentUpdated({required this.value});
}
