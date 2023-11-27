/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/feed_repository.dart';
import 'package:eliud_pkg_feed_model/model/feed_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'feed_model.dart';

typedef FilterFeedModels = List<FeedModel?> Function(List<FeedModel?> values);

class FeedListBloc extends Bloc<FeedListEvent, FeedListState> {
  final FilterFeedModels? filter;
  final FeedRepository _feedRepository;
  StreamSubscription? _feedsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int feedLimit;

  FeedListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required FeedRepository feedRepository,
      this.feedLimit = 5})
      : _feedRepository = feedRepository,
        super(FeedListLoading()) {
    on<LoadFeedList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedListToState();
      } else {
        _mapLoadFeedListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFeedListWithDetailsToState();
    });

    on<FeedChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedListToState();
      } else {
        _mapLoadFeedListWithDetailsToState();
      }
    });

    on<AddFeedList>((event, emit) async {
      await _mapAddFeedListToState(event);
    });

    on<UpdateFeedList>((event, emit) async {
      await _mapUpdateFeedListToState(event);
    });

    on<DeleteFeedList>((event, emit) async {
      await _mapDeleteFeedListToState(event);
    });

    on<FeedListUpdated>((event, emit) {
      emit(_mapFeedListUpdatedToState(event));
    });
  }

  List<FeedModel?> _filter(List<FeedModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFeedListToState() async {
    int amountNow = (state is FeedListLoaded)
        ? (state as FeedListLoaded).values!.length
        : 0;
    _feedsListSubscription?.cancel();
    _feedsListSubscription = _feedRepository.listen(
        (list) => add(FeedListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedLimit : null);
  }

  Future<void> _mapLoadFeedListWithDetailsToState() async {
    int amountNow = (state is FeedListLoaded)
        ? (state as FeedListLoaded).values!.length
        : 0;
    _feedsListSubscription?.cancel();
    _feedsListSubscription = _feedRepository.listenWithDetails(
        (list) => add(FeedListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedLimit : null);
  }

  Future<void> _mapAddFeedListToState(AddFeedList event) async {
    var value = event.value;
    if (value != null) {
      await _feedRepository.add(value);
    }
  }

  Future<void> _mapUpdateFeedListToState(UpdateFeedList event) async {
    var value = event.value;
    if (value != null) {
      await _feedRepository.update(value);
    }
  }

  Future<void> _mapDeleteFeedListToState(DeleteFeedList event) async {
    var value = event.value;
    if (value != null) {
      await _feedRepository.delete(value);
    }
  }

  FeedListLoaded _mapFeedListUpdatedToState(FeedListUpdated event) =>
      FeedListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _feedsListSubscription?.cancel();
    return super.close();
  }
}
