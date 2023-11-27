/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/post_comment_component_event.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_component_state.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_repository.dart';

class PostCommentComponentBloc
    extends Bloc<PostCommentComponentEvent, PostCommentComponentState> {
  final PostCommentRepository? postCommentRepository;
  StreamSubscription? _postCommentSubscription;

  void _mapLoadPostCommentComponentUpdateToState(String documentId) {
    _postCommentSubscription?.cancel();
    _postCommentSubscription =
        postCommentRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PostCommentComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct PostCommentComponentBloc
   */
  PostCommentComponentBloc({this.postCommentRepository})
      : super(PostCommentComponentUninitialized()) {
    on<FetchPostCommentComponent>((event, emit) {
      _mapLoadPostCommentComponentUpdateToState(event.id!);
    });
    on<PostCommentComponentUpdated>((event, emit) {
      emit(PostCommentComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the PostCommentComponentBloc
   */
  @override
  Future<void> close() {
    _postCommentSubscription?.cancel();
    return super.close();
  }
}
