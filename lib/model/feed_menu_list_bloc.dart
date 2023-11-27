/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/feed_menu_repository.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'feed_menu_model.dart';

typedef FilterFeedMenuModels = List<FeedMenuModel?> Function(
    List<FeedMenuModel?> values);

class FeedMenuListBloc extends Bloc<FeedMenuListEvent, FeedMenuListState> {
  final FilterFeedMenuModels? filter;
  final FeedMenuRepository _feedMenuRepository;
  StreamSubscription? _feedMenusListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int feedMenuLimit;

  FeedMenuListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required FeedMenuRepository feedMenuRepository,
      this.feedMenuLimit = 5})
      : _feedMenuRepository = feedMenuRepository,
        super(FeedMenuListLoading()) {
    on<LoadFeedMenuList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedMenuListToState();
      } else {
        _mapLoadFeedMenuListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadFeedMenuListWithDetailsToState();
    });

    on<FeedMenuChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadFeedMenuListToState();
      } else {
        _mapLoadFeedMenuListWithDetailsToState();
      }
    });

    on<AddFeedMenuList>((event, emit) async {
      await _mapAddFeedMenuListToState(event);
    });

    on<UpdateFeedMenuList>((event, emit) async {
      await _mapUpdateFeedMenuListToState(event);
    });

    on<DeleteFeedMenuList>((event, emit) async {
      await _mapDeleteFeedMenuListToState(event);
    });

    on<FeedMenuListUpdated>((event, emit) {
      emit(_mapFeedMenuListUpdatedToState(event));
    });
  }

  List<FeedMenuModel?> _filter(List<FeedMenuModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadFeedMenuListToState() async {
    int amountNow = (state is FeedMenuListLoaded)
        ? (state as FeedMenuListLoaded).values!.length
        : 0;
    _feedMenusListSubscription?.cancel();
    _feedMenusListSubscription = _feedMenuRepository.listen(
        (list) => add(FeedMenuListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedMenuLimit : null);
  }

  Future<void> _mapLoadFeedMenuListWithDetailsToState() async {
    int amountNow = (state is FeedMenuListLoaded)
        ? (state as FeedMenuListLoaded).values!.length
        : 0;
    _feedMenusListSubscription?.cancel();
    _feedMenusListSubscription = _feedMenuRepository.listenWithDetails(
        (list) => add(FeedMenuListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * feedMenuLimit : null);
  }

  Future<void> _mapAddFeedMenuListToState(AddFeedMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _feedMenuRepository.add(value);
    }
  }

  Future<void> _mapUpdateFeedMenuListToState(UpdateFeedMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _feedMenuRepository.update(value);
    }
  }

  Future<void> _mapDeleteFeedMenuListToState(DeleteFeedMenuList event) async {
    var value = event.value;
    if (value != null) {
      await _feedMenuRepository.delete(value);
    }
  }

  FeedMenuListLoaded _mapFeedMenuListUpdatedToState(
          FeedMenuListUpdated event) =>
      FeedMenuListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _feedMenusListSubscription?.cancel();
    return super.close();
  }
}
