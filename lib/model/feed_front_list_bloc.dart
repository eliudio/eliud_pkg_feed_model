/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/feed_front_repository.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'feed_front_model.dart';

typedef FilterFeedFrontModels = List<FeedFrontModel?> Function(
    List<FeedFrontModel?> values);

class FeedFrontListBloc extends Bloc<FeedFrontListEvent, FeedFrontListState> {
  final FilterFeedFrontModels? filter;
  final FeedFrontRepository _feedFrontRepository;
  StreamSubscription? _feedFrontsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int feedFrontLimit;

  FeedFrontListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required FeedFrontRepository feedFrontRepository,
      this.feedFrontLimit = 5})
      : _feedFrontRepository = feedFrontRepository,
        super(FeedFrontListLoading()) {
    on<LoadFeedFrontList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedFrontListToState();
      } else {
        _mapLoadFeedFrontListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFeedFrontListWithDetailsToState();
    });

    on<FeedFrontChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedFrontListToState();
      } else {
        _mapLoadFeedFrontListWithDetailsToState();
      }
    });

    on<AddFeedFrontList>((event, emit) async {
      await _mapAddFeedFrontListToState(event);
    });

    on<UpdateFeedFrontList>((event, emit) async {
      await _mapUpdateFeedFrontListToState(event);
    });

    on<DeleteFeedFrontList>((event, emit) async {
      await _mapDeleteFeedFrontListToState(event);
    });

    on<FeedFrontListUpdated>((event, emit) {
      emit(_mapFeedFrontListUpdatedToState(event));
    });
  }

  List<FeedFrontModel?> _filter(List<FeedFrontModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFeedFrontListToState() async {
    int amountNow = (state is FeedFrontListLoaded)
        ? (state as FeedFrontListLoaded).values!.length
        : 0;
    _feedFrontsListSubscription?.cancel();
    _feedFrontsListSubscription = _feedFrontRepository.listen(
        (list) => add(FeedFrontListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedFrontLimit : null);
  }

  Future<void> _mapLoadFeedFrontListWithDetailsToState() async {
    int amountNow = (state is FeedFrontListLoaded)
        ? (state as FeedFrontListLoaded).values!.length
        : 0;
    _feedFrontsListSubscription?.cancel();
    _feedFrontsListSubscription = _feedFrontRepository.listenWithDetails(
        (list) => add(FeedFrontListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedFrontLimit : null);
  }

  Future<void> _mapAddFeedFrontListToState(AddFeedFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _feedFrontRepository.add(value);
    }
  }

  Future<void> _mapUpdateFeedFrontListToState(UpdateFeedFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _feedFrontRepository.update(value);
    }
  }

  Future<void> _mapDeleteFeedFrontListToState(DeleteFeedFrontList event) async {
    var value = event.value;
    if (value != null) {
      await _feedFrontRepository.delete(value);
    }
  }

  FeedFrontListLoaded _mapFeedFrontListUpdatedToState(
          FeedFrontListUpdated event) =>
      FeedFrontListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _feedFrontsListSubscription?.cancel();
    return super.close();
  }
}
