/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_like_model.dart';

/* 
 * PostLikeComponentState is the base class for state for PostLikeComponentBloc
 */
abstract class PostLikeComponentState extends Equatable {
  const PostLikeComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PostLikeComponentUninitialized is the uninitialized state of the PostLikeComponentBloc 
 */
class PostLikeComponentUninitialized extends PostLikeComponentState {}

/* 
 * PostLikeComponentError is the error state of the PostLikeComponentBloc 
 */
class PostLikeComponentError extends PostLikeComponentState {
  final String? message;
  PostLikeComponentError({this.message});
}

/* 
 * PostLikeComponentPermissionDenied is to indicate permission denied state of the PostLikeComponentBloc 
 */
class PostLikeComponentPermissionDenied extends PostLikeComponentState {
  PostLikeComponentPermissionDenied();
}

/* 
 * PostLikeComponentLoaded is used to set the state of the PostLikeComponentBloc to the loaded state
 */
class PostLikeComponentLoaded extends PostLikeComponentState {
  final PostLikeModel value;

  /* 
   * construct PostLikeComponentLoaded
   */
  const PostLikeComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PostLikeComponentLoaded copyWith({PostLikeModel? copyThis}) {
    return PostLikeComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PostLikeComponentLoaded { value: $value }';
}
