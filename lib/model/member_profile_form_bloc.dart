/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/member_profile_form_event.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_form_state.dart';

class MemberProfileFormBloc
    extends Bloc<MemberProfileFormEvent, MemberProfileFormState> {
  final FormAction? formAction;
  final String? appId;

  MemberProfileFormBloc(this.appId, {this.formAction})
      : super(MemberProfileFormUninitialized()) {
    on<InitialiseNewMemberProfileFormEvent>((event, emit) {
      MemberProfileFormLoaded loaded = MemberProfileFormLoaded(
          value: MemberProfileModel(
        documentID: "",
        appId: "",
        feedId: "",
        authorId: "",
        profile: "",
        profileOverride: "",
        nameOverride: "",
        accessibleByMembers: [],
        readAccess: [],
        memberMedia: [],
      ));
      emit(loaded);
    });

    on<InitialiseMemberProfileFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      MemberProfileFormLoaded loaded = MemberProfileFormLoaded(
          value: await memberProfileRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseMemberProfileFormNoLoadEvent>((event, emit) async {
      MemberProfileFormLoaded loaded =
          MemberProfileFormLoaded(value: event.value);
      emit(loaded);
    });
    MemberProfileModel? newValue;
    on<ChangedMemberProfileDocumentID>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMemberProfileForm(value: newValue));
        }
      }
    });
    on<ChangedMemberProfileFeedId>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(feedId: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileAuthorId>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileProfile>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(profile: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileProfileBackground>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              profileBackground:
                  await memberMediumRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileProfileOverride>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(profileOverride: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileNameOverride>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(nameOverride: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileAccessibleByGroup>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(accessibleByGroup: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
    on<ChangedMemberProfileMemberMedia>((event, emit) async {
      if (state is MemberProfileFormInitialized) {
        final currentState = state as MemberProfileFormInitialized;
        newValue = currentState.value!.copyWith(memberMedia: event.value);
        emit(SubmittableMemberProfileForm(value: newValue));
      }
    });
  }

  DocumentIDMemberProfileFormError error(
          String message, MemberProfileModel newValue) =>
      DocumentIDMemberProfileFormError(message: message, value: newValue);

  Future<MemberProfileFormState> _isDocumentIDValid(
      String? value, MemberProfileModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<MemberProfileModel?> findDocument =
        memberProfileRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberProfileForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
