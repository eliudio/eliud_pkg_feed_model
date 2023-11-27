/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_model.dart';

/* 
 * FeedMenuComponentState is the base class for state for FeedMenuComponentBloc
 */
abstract class FeedMenuComponentState extends Equatable {
  const FeedMenuComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FeedMenuComponentUninitialized is the uninitialized state of the FeedMenuComponentBloc 
 */
class FeedMenuComponentUninitialized extends FeedMenuComponentState {}

/* 
 * FeedMenuComponentError is the error state of the FeedMenuComponentBloc 
 */
class FeedMenuComponentError extends FeedMenuComponentState {
  final String? message;
  FeedMenuComponentError({this.message});
}

/* 
 * FeedMenuComponentPermissionDenied is to indicate permission denied state of the FeedMenuComponentBloc 
 */
class FeedMenuComponentPermissionDenied extends FeedMenuComponentState {
  FeedMenuComponentPermissionDenied();
}

/* 
 * FeedMenuComponentLoaded is used to set the state of the FeedMenuComponentBloc to the loaded state
 */
class FeedMenuComponentLoaded extends FeedMenuComponentState {
  final FeedMenuModel value;

  /* 
   * construct FeedMenuComponentLoaded
   */
  const FeedMenuComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FeedMenuComponentLoaded copyWith({FeedMenuModel? copyThis}) {
    return FeedMenuComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FeedMenuComponentLoaded { value: $value }';
}
