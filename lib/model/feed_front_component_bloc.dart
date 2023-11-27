/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/feed_front_component_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_component_state.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_repository.dart';

class FeedFrontComponentBloc
    extends Bloc<FeedFrontComponentEvent, FeedFrontComponentState> {
  final FeedFrontRepository? feedFrontRepository;
  StreamSubscription? _feedFrontSubscription;

  void _mapLoadFeedFrontComponentUpdateToState(String documentId) {
    _feedFrontSubscription?.cancel();
    _feedFrontSubscription = feedFrontRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(FeedFrontComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct FeedFrontComponentBloc
   */
  FeedFrontComponentBloc({this.feedFrontRepository})
      : super(FeedFrontComponentUninitialized()) {
    on<FetchFeedFrontComponent>((event, emit) {
      _mapLoadFeedFrontComponentUpdateToState(event.id!);
    });
    on<FeedFrontComponentUpdated>((event, emit) {
      emit(FeedFrontComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the FeedFrontComponentBloc
   */
  @override
  Future<void> close() {
    _feedFrontSubscription?.cancel();
    return super.close();
  }
}
