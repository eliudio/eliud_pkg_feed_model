/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_helpers/helpers/string_validator.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/post_form_event.dart';
import 'package:eliud_pkg_feed_model/model/post_form_state.dart';

class PostFormBloc extends Bloc<PostFormEvent, PostFormState> {
  final FormAction? formAction;
  final String? appId;

  PostFormBloc(this.appId, {this.formAction}) : super(PostFormUninitialized()) {
    on<InitialiseNewPostFormEvent>((event, emit) {
      PostFormLoaded loaded = PostFormLoaded(
          value: PostModel(
        documentID: "",
        authorId: "",
        appId: "",
        feedId: "",
        postAppId: "",
        postPageId: "",
        html: "",
        description: "",
        likes: 0,
        dislikes: 0,
        accessibleByMembers: [],
        readAccess: [],
        archived: PostArchiveStatus.active,
        externalLink: "",
        memberMedia: [],
      ));
      emit(loaded);
    });

    on<InitialisePostFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PostFormLoaded loaded = PostFormLoaded(
          value:
              await postRepository(appId: appId)!.get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePostFormNoLoadEvent>((event, emit) async {
      PostFormLoaded loaded = PostFormLoaded(value: event.value);
      emit(loaded);
    });
    PostModel? newValue;
    on<ChangedPostDocumentID>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePostForm(value: newValue));
        }
      }
    });
    on<ChangedPostAuthorId>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostTimestamp>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!
            .copyWith(timestamp: dateTimeFromTimestampString(event.value!));
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostAppId>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostFeedId>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(feedId: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostPostAppId>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(postAppId: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostPostPageId>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(postPageId: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostPageParameters>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(pageParameters: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostHtml>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(html: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostDescription>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostLikes>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(likes: int.parse(event.value!));
          emit(SubmittablePostForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(likes: 0);
          emit(LikesPostFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPostDislikes>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        if (isInt(event.value)) {
          newValue =
              currentState.value!.copyWith(dislikes: int.parse(event.value!));
          emit(SubmittablePostForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(dislikes: 0);
          emit(DislikesPostFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPostAccessibleByGroup>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(accessibleByGroup: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostArchived>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(archived: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostExternalLink>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(externalLink: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
    on<ChangedPostMemberMedia>((event, emit) async {
      if (state is PostFormInitialized) {
        final currentState = state as PostFormInitialized;
        newValue = currentState.value!.copyWith(memberMedia: event.value);
        emit(SubmittablePostForm(value: newValue));
      }
    });
  }

  DocumentIDPostFormError error(String message, PostModel newValue) =>
      DocumentIDPostFormError(message: message, value: newValue);

  Future<PostFormState> _isDocumentIDValid(
      String? value, PostModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<PostModel?> findDocument = postRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePostForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
