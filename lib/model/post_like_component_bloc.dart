/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/post_like_component_event.dart';
import 'package:eliud_pkg_feed_model/model/post_like_component_state.dart';
import 'package:eliud_pkg_feed_model/model/post_like_repository.dart';

class PostLikeComponentBloc
    extends Bloc<PostLikeComponentEvent, PostLikeComponentState> {
  final PostLikeRepository? postLikeRepository;
  StreamSubscription? _postLikeSubscription;

  void _mapLoadPostLikeComponentUpdateToState(String documentId) {
    _postLikeSubscription?.cancel();
    _postLikeSubscription = postLikeRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PostLikeComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct PostLikeComponentBloc
   */
  PostLikeComponentBloc({this.postLikeRepository})
      : super(PostLikeComponentUninitialized()) {
    on<FetchPostLikeComponent>((event, emit) {
      _mapLoadPostLikeComponentUpdateToState(event.id!);
    });
    on<PostLikeComponentUpdated>((event, emit) {
      emit(PostLikeComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the PostLikeComponentBloc
   */
  @override
  Future<void> close() {
    _postLikeSubscription?.cancel();
    return super.close();
  }
}
