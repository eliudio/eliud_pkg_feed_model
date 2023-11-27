/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/feed_menu_component_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_component_state.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_repository.dart';

class FeedMenuComponentBloc
    extends Bloc<FeedMenuComponentEvent, FeedMenuComponentState> {
  final FeedMenuRepository? feedMenuRepository;
  StreamSubscription? _feedMenuSubscription;

  void _mapLoadFeedMenuComponentUpdateToState(String documentId) {
    _feedMenuSubscription?.cancel();
    _feedMenuSubscription = feedMenuRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(FeedMenuComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct FeedMenuComponentBloc
   */
  FeedMenuComponentBloc({this.feedMenuRepository})
      : super(FeedMenuComponentUninitialized()) {
    on<FetchFeedMenuComponent>((event, emit) {
      _mapLoadFeedMenuComponentUpdateToState(event.id!);
    });
    on<FeedMenuComponentUpdated>((event, emit) {
      emit(FeedMenuComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the FeedMenuComponentBloc
   */
  @override
  Future<void> close() {
    _feedMenuSubscription?.cancel();
    return super.close();
  }
}
