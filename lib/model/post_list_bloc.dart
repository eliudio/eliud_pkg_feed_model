/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/post_repository.dart';
import 'package:eliud_pkg_feed_model/model/post_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'post_model.dart';

typedef FilterPostModels = List<PostModel?> Function(List<PostModel?> values);

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final FilterPostModels? filter;
  final PostRepository _postRepository;
  StreamSubscription? _postsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int postLimit;

  PostListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PostRepository postRepository,
      this.postLimit = 5})
      : _postRepository = postRepository,
        super(PostListLoading()) {
    on<LoadPostList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostListToState();
      } else {
        _mapLoadPostListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPostListWithDetailsToState();
    });

    on<PostChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostListToState();
      } else {
        _mapLoadPostListWithDetailsToState();
      }
    });

    on<AddPostList>((event, emit) async {
      await _mapAddPostListToState(event);
    });

    on<UpdatePostList>((event, emit) async {
      await _mapUpdatePostListToState(event);
    });

    on<DeletePostList>((event, emit) async {
      await _mapDeletePostListToState(event);
    });

    on<PostListUpdated>((event, emit) {
      emit(_mapPostListUpdatedToState(event));
    });
  }

  List<PostModel?> _filter(List<PostModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPostListToState() async {
    int amountNow = (state is PostListLoaded)
        ? (state as PostListLoaded).values!.length
        : 0;
    _postsListSubscription?.cancel();
    _postsListSubscription = _postRepository.listen(
        (list) => add(PostListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postLimit : null);
  }

  Future<void> _mapLoadPostListWithDetailsToState() async {
    int amountNow = (state is PostListLoaded)
        ? (state as PostListLoaded).values!.length
        : 0;
    _postsListSubscription?.cancel();
    _postsListSubscription = _postRepository.listenWithDetails(
        (list) => add(PostListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postLimit : null);
  }

  Future<void> _mapAddPostListToState(AddPostList event) async {
    var value = event.value;
    if (value != null) {
      await _postRepository.add(value);
    }
  }

  Future<void> _mapUpdatePostListToState(UpdatePostList event) async {
    var value = event.value;
    if (value != null) {
      await _postRepository.update(value);
    }
  }

  Future<void> _mapDeletePostListToState(DeletePostList event) async {
    var value = event.value;
    if (value != null) {
      await _postRepository.delete(value);
    }
  }

  PostListLoaded _mapPostListUpdatedToState(PostListUpdated event) =>
      PostListLoaded(values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _postsListSubscription?.cancel();
    return super.close();
  }
}
