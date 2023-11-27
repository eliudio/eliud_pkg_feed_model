/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/rgb_model.dart';

import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_menu_form_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_form_state.dart';

class FeedMenuFormBloc extends Bloc<FeedMenuFormEvent, FeedMenuFormState> {
  final FormAction? formAction;
  final String? appId;

  FeedMenuFormBloc(this.appId, {this.formAction})
      : super(FeedMenuFormUninitialized()) {
    on<InitialiseNewFeedMenuFormEvent>((event, emit) {
      FeedMenuFormLoaded loaded = FeedMenuFormLoaded(
          value: FeedMenuModel(
        documentID: "",
        appId: "",
        description: "",
        bodyComponentsCurrentMember: [],
        bodyComponentsOtherMember: [],
        itemColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
        selectedItemColor: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
      ));
      emit(loaded);
    });

    on<InitialiseFeedMenuFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      FeedMenuFormLoaded loaded = FeedMenuFormLoaded(
          value: await feedMenuRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseFeedMenuFormNoLoadEvent>((event, emit) async {
      FeedMenuFormLoaded loaded = FeedMenuFormLoaded(value: event.value);
      emit(loaded);
    });
    FeedMenuModel? newValue;
    on<ChangedFeedMenuDocumentID>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableFeedMenuForm(value: newValue));
        }
      }
    });
    on<ChangedFeedMenuAppId>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuDescription>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuBodyComponentsCurrentMember>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!
            .copyWith(bodyComponentsCurrentMember: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuBodyComponentsOtherMember>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!
            .copyWith(bodyComponentsOtherMember: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuItemColor>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(itemColor: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuSelectedItemColor>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(selectedItemColor: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuBackgroundOverride>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue =
            currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuFeedFront>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              feedFront:
                  await feedFrontRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
    on<ChangedFeedMenuConditions>((event, emit) async {
      if (state is FeedMenuFormInitialized) {
        final currentState = state as FeedMenuFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableFeedMenuForm(value: newValue));
      }
    });
  }

  DocumentIDFeedMenuFormError error(String message, FeedMenuModel newValue) =>
      DocumentIDFeedMenuFormError(message: message, value: newValue);

  Future<FeedMenuFormState> _isDocumentIDValid(
      String? value, FeedMenuModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<FeedMenuModel?> findDocument =
        feedMenuRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableFeedMenuForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
