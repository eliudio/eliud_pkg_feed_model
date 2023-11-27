/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/profile_component_event.dart';
import 'package:eliud_pkg_feed_model/model/profile_component_state.dart';
import 'package:eliud_pkg_feed_model/model/profile_repository.dart';

class ProfileComponentBloc
    extends Bloc<ProfileComponentEvent, ProfileComponentState> {
  final ProfileRepository? profileRepository;
  StreamSubscription? _profileSubscription;

  void _mapLoadProfileComponentUpdateToState(String documentId) {
    _profileSubscription?.cancel();
    _profileSubscription = profileRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(ProfileComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct ProfileComponentBloc
   */
  ProfileComponentBloc({this.profileRepository})
      : super(ProfileComponentUninitialized()) {
    on<FetchProfileComponent>((event, emit) {
      _mapLoadProfileComponentUpdateToState(event.id!);
    });
    on<ProfileComponentUpdated>((event, emit) {
      emit(ProfileComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the ProfileComponentBloc
   */
  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    return super.close();
  }
}
