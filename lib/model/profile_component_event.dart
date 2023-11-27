/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/profile_model.dart';

/*
 * ProfileComponentEvent is the base class for events to be used with constructing a ProfileComponentBloc 
 */
abstract class ProfileComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchProfileComponent is the event to instruct the bloc to fetch the component
 */
class FetchProfileComponent extends ProfileComponentEvent {
  final String? id;

  /*
   * Construct the FetchProfileComponent
   */
  FetchProfileComponent({this.id});
}

/*
 * ProfileComponentUpdated is the event to inform the bloc that a component has been updated
 */
class ProfileComponentUpdated extends ProfileComponentEvent {
  final ProfileModel value;

  /*
   * Construct the ProfileComponentUpdated
   */
  ProfileComponentUpdated({required this.value});
}
