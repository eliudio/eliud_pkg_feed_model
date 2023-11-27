/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';

/* 
 * FeedFrontComponentState is the base class for state for FeedFrontComponentBloc
 */
abstract class FeedFrontComponentState extends Equatable {
  const FeedFrontComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * FeedFrontComponentUninitialized is the uninitialized state of the FeedFrontComponentBloc 
 */
class FeedFrontComponentUninitialized extends FeedFrontComponentState {}

/* 
 * FeedFrontComponentError is the error state of the FeedFrontComponentBloc 
 */
class FeedFrontComponentError extends FeedFrontComponentState {
  final String? message;
  FeedFrontComponentError({this.message});
}

/* 
 * FeedFrontComponentPermissionDenied is to indicate permission denied state of the FeedFrontComponentBloc 
 */
class FeedFrontComponentPermissionDenied extends FeedFrontComponentState {
  FeedFrontComponentPermissionDenied();
}

/* 
 * FeedFrontComponentLoaded is used to set the state of the FeedFrontComponentBloc to the loaded state
 */
class FeedFrontComponentLoaded extends FeedFrontComponentState {
  final FeedFrontModel value;

  /* 
   * construct FeedFrontComponentLoaded
   */
  const FeedFrontComponentLoaded({required this.value});

  /* 
   * copy method
   */
  FeedFrontComponentLoaded copyWith({FeedFrontModel? copyThis}) {
    return FeedFrontComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'FeedFrontComponentLoaded { value: $value }';
}
