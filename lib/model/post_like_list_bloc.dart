/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/post_like_repository.dart';
import 'package:eliud_pkg_feed_model/model/post_like_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_like_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'post_like_model.dart';

typedef FilterPostLikeModels = List<PostLikeModel?> Function(
    List<PostLikeModel?> values);

class PostLikeListBloc extends Bloc<PostLikeListEvent, PostLikeListState> {
  final FilterPostLikeModels? filter;
  final PostLikeRepository _postLikeRepository;
  StreamSubscription? _postLikesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int postLikeLimit;

  PostLikeListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PostLikeRepository postLikeRepository,
      this.postLikeLimit = 5})
      : _postLikeRepository = postLikeRepository,
        super(PostLikeListLoading()) {
    on<LoadPostLikeList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostLikeListToState();
      } else {
        _mapLoadPostLikeListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPostLikeListWithDetailsToState();
    });

    on<PostLikeChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostLikeListToState();
      } else {
        _mapLoadPostLikeListWithDetailsToState();
      }
    });

    on<AddPostLikeList>((event, emit) async {
      await _mapAddPostLikeListToState(event);
    });

    on<UpdatePostLikeList>((event, emit) async {
      await _mapUpdatePostLikeListToState(event);
    });

    on<DeletePostLikeList>((event, emit) async {
      await _mapDeletePostLikeListToState(event);
    });

    on<PostLikeListUpdated>((event, emit) {
      emit(_mapPostLikeListUpdatedToState(event));
    });
  }

  List<PostLikeModel?> _filter(List<PostLikeModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPostLikeListToState() async {
    int amountNow = (state is PostLikeListLoaded)
        ? (state as PostLikeListLoaded).values!.length
        : 0;
    _postLikesListSubscription?.cancel();
    _postLikesListSubscription = _postLikeRepository.listen(
        (list) => add(PostLikeListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postLikeLimit : null);
  }

  Future<void> _mapLoadPostLikeListWithDetailsToState() async {
    int amountNow = (state is PostLikeListLoaded)
        ? (state as PostLikeListLoaded).values!.length
        : 0;
    _postLikesListSubscription?.cancel();
    _postLikesListSubscription = _postLikeRepository.listenWithDetails(
        (list) => add(PostLikeListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postLikeLimit : null);
  }

  Future<void> _mapAddPostLikeListToState(AddPostLikeList event) async {
    var value = event.value;
    if (value != null) {
      await _postLikeRepository.add(value);
    }
  }

  Future<void> _mapUpdatePostLikeListToState(UpdatePostLikeList event) async {
    var value = event.value;
    if (value != null) {
      await _postLikeRepository.update(value);
    }
  }

  Future<void> _mapDeletePostLikeListToState(DeletePostLikeList event) async {
    var value = event.value;
    if (value != null) {
      await _postLikeRepository.delete(value);
    }
  }

  PostLikeListLoaded _mapPostLikeListUpdatedToState(
          PostLikeListUpdated event) =>
      PostLikeListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _postLikesListSubscription?.cancel();
    return super.close();
  }
}
