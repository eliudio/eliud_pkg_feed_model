/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_model.dart';

/* 
 * PostComponentState is the base class for state for PostComponentBloc
 */
abstract class PostComponentState extends Equatable {
  const PostComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PostComponentUninitialized is the uninitialized state of the PostComponentBloc 
 */
class PostComponentUninitialized extends PostComponentState {}

/* 
 * PostComponentError is the error state of the PostComponentBloc 
 */
class PostComponentError extends PostComponentState {
  final String? message;
  PostComponentError({this.message});
}

/* 
 * PostComponentPermissionDenied is to indicate permission denied state of the PostComponentBloc 
 */
class PostComponentPermissionDenied extends PostComponentState {
  PostComponentPermissionDenied();
}

/* 
 * PostComponentLoaded is used to set the state of the PostComponentBloc to the loaded state
 */
class PostComponentLoaded extends PostComponentState {
  final PostModel value;

  /* 
   * construct PostComponentLoaded
   */
  const PostComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PostComponentLoaded copyWith({PostModel? copyThis}) {
    return PostComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PostComponentLoaded { value: $value }';
}
