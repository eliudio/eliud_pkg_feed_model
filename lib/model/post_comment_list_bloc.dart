/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/post_comment_repository.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'post_comment_model.dart';

typedef FilterPostCommentModels = List<PostCommentModel?> Function(
    List<PostCommentModel?> values);

class PostCommentListBloc
    extends Bloc<PostCommentListEvent, PostCommentListState> {
  final FilterPostCommentModels? filter;
  final PostCommentRepository _postCommentRepository;
  StreamSubscription? _postCommentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int postCommentLimit;

  PostCommentListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required PostCommentRepository postCommentRepository,
      this.postCommentLimit = 5})
      : _postCommentRepository = postCommentRepository,
        super(PostCommentListLoading()) {
    on<LoadPostCommentList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostCommentListToState();
      } else {
        _mapLoadPostCommentListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadPostCommentListWithDetailsToState();
    });

    on<PostCommentChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadPostCommentListToState();
      } else {
        _mapLoadPostCommentListWithDetailsToState();
      }
    });

    on<AddPostCommentList>((event, emit) async {
      await _mapAddPostCommentListToState(event);
    });

    on<UpdatePostCommentList>((event, emit) async {
      await _mapUpdatePostCommentListToState(event);
    });

    on<DeletePostCommentList>((event, emit) async {
      await _mapDeletePostCommentListToState(event);
    });

    on<PostCommentListUpdated>((event, emit) {
      emit(_mapPostCommentListUpdatedToState(event));
    });
  }

  List<PostCommentModel?> _filter(List<PostCommentModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadPostCommentListToState() async {
    int amountNow = (state is PostCommentListLoaded)
        ? (state as PostCommentListLoaded).values!.length
        : 0;
    _postCommentsListSubscription?.cancel();
    _postCommentsListSubscription = _postCommentRepository.listen(
        (list) => add(PostCommentListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postCommentLimit : null);
  }

  Future<void> _mapLoadPostCommentListWithDetailsToState() async {
    int amountNow = (state is PostCommentListLoaded)
        ? (state as PostCommentListLoaded).values!.length
        : 0;
    _postCommentsListSubscription?.cancel();
    _postCommentsListSubscription = _postCommentRepository.listenWithDetails(
        (list) => add(PostCommentListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * postCommentLimit : null);
  }

  Future<void> _mapAddPostCommentListToState(AddPostCommentList event) async {
    var value = event.value;
    if (value != null) {
      await _postCommentRepository.add(value);
    }
  }

  Future<void> _mapUpdatePostCommentListToState(
      UpdatePostCommentList event) async {
    var value = event.value;
    if (value != null) {
      await _postCommentRepository.update(value);
    }
  }

  Future<void> _mapDeletePostCommentListToState(
      DeletePostCommentList event) async {
    var value = event.value;
    if (value != null) {
      await _postCommentRepository.delete(value);
    }
  }

  PostCommentListLoaded _mapPostCommentListUpdatedToState(
          PostCommentListUpdated event) =>
      PostCommentListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _postCommentsListSubscription?.cancel();
    return super.close();
  }
}
