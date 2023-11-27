/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_helpers/helpers/string_validator.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/post_comment_form_event.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_form_state.dart';

class PostCommentFormBloc
    extends Bloc<PostCommentFormEvent, PostCommentFormState> {
  final FormAction? formAction;
  final String? appId;

  PostCommentFormBloc(this.appId, {this.formAction})
      : super(PostCommentFormUninitialized()) {
    on<InitialiseNewPostCommentFormEvent>((event, emit) {
      PostCommentFormLoaded loaded = PostCommentFormLoaded(
          value: PostCommentModel(
        documentID: "",
        postId: "",
        postCommentId: "",
        memberId: "",
        appId: "",
        comment: "",
        likes: 0,
        dislikes: 0,
        memberMedia: [],
      ));
      emit(loaded);
    });

    on<InitialisePostCommentFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PostCommentFormLoaded loaded = PostCommentFormLoaded(
          value: await postCommentRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePostCommentFormNoLoadEvent>((event, emit) async {
      PostCommentFormLoaded loaded = PostCommentFormLoaded(value: event.value);
      emit(loaded);
    });
    PostCommentModel? newValue;
    on<ChangedPostCommentDocumentID>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePostCommentForm(value: newValue));
        }
      }
    });
    on<ChangedPostCommentPostId>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(postId: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentPostCommentId>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(postCommentId: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentMemberId>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(memberId: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentTimestamp>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!
            .copyWith(timestamp: dateTimeFromTimestampString(event.value!));
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentAppId>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentComment>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(comment: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
    on<ChangedPostCommentLikes>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(likes: int.parse(event.value!));
          emit(SubmittablePostCommentForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(likes: 0);
          emit(LikesPostCommentFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPostCommentDislikes>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(dislikes: int.parse(event.value!));
          emit(SubmittablePostCommentForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(dislikes: 0);
          emit(DislikesPostCommentFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPostCommentMemberMedia>((event, emit) async {
      if (state is PostCommentFormInitialized) {
        final currentState = state as PostCommentFormInitialized;
        newValue = currentState.value!.copyWith(memberMedia: event.value);
        emit(SubmittablePostCommentForm(value: newValue));
      }
    });
  }

  DocumentIDPostCommentFormError error(
          String message, PostCommentModel newValue) =>
      DocumentIDPostCommentFormError(message: message, value: newValue);

  Future<PostCommentFormState> _isDocumentIDValid(
      String? value, PostCommentModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<PostCommentModel?> findDocument =
        postCommentRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePostCommentForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
