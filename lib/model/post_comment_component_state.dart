/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_model.dart';

/* 
 * PostCommentComponentState is the base class for state for PostCommentComponentBloc
 */
abstract class PostCommentComponentState extends Equatable {
  const PostCommentComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * PostCommentComponentUninitialized is the uninitialized state of the PostCommentComponentBloc 
 */
class PostCommentComponentUninitialized extends PostCommentComponentState {}

/* 
 * PostCommentComponentError is the error state of the PostCommentComponentBloc 
 */
class PostCommentComponentError extends PostCommentComponentState {
  final String? message;
  PostCommentComponentError({this.message});
}

/* 
 * PostCommentComponentPermissionDenied is to indicate permission denied state of the PostCommentComponentBloc 
 */
class PostCommentComponentPermissionDenied extends PostCommentComponentState {
  PostCommentComponentPermissionDenied();
}

/* 
 * PostCommentComponentLoaded is used to set the state of the PostCommentComponentBloc to the loaded state
 */
class PostCommentComponentLoaded extends PostCommentComponentState {
  final PostCommentModel value;

  /* 
   * construct PostCommentComponentLoaded
   */
  const PostCommentComponentLoaded({required this.value});

  /* 
   * copy method
   */
  PostCommentComponentLoaded copyWith({PostCommentModel? copyThis}) {
    return PostCommentComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'PostCommentComponentLoaded { value: $value }';
}
