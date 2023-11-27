/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/profile_repository.dart';
import 'package:eliud_pkg_feed_model/model/profile_list_event.dart';
import 'package:eliud_pkg_feed_model/model/profile_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'profile_model.dart';

typedef FilterProfileModels = List<ProfileModel?> Function(
    List<ProfileModel?> values);

class ProfileListBloc extends Bloc<ProfileListEvent, ProfileListState> {
  final FilterProfileModels? filter;
  final ProfileRepository _profileRepository;
  StreamSubscription? _profilesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int profileLimit;

  ProfileListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required ProfileRepository profileRepository,
      this.profileLimit = 5})
      : _profileRepository = profileRepository,
        super(ProfileListLoading()) {
    on<LoadProfileList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProfileListToState();
      } else {
        _mapLoadProfileListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadProfileListWithDetailsToState();
    });

    on<ProfileChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadProfileListToState();
      } else {
        _mapLoadProfileListWithDetailsToState();
      }
    });

    on<AddProfileList>((event, emit) async {
      await _mapAddProfileListToState(event);
    });

    on<UpdateProfileList>((event, emit) async {
      await _mapUpdateProfileListToState(event);
    });

    on<DeleteProfileList>((event, emit) async {
      await _mapDeleteProfileListToState(event);
    });

    on<ProfileListUpdated>((event, emit) {
      emit(_mapProfileListUpdatedToState(event));
    });
  }

  List<ProfileModel?> _filter(List<ProfileModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadProfileListToState() async {
    int amountNow = (state is ProfileListLoaded)
        ? (state as ProfileListLoaded).values!.length
        : 0;
    _profilesListSubscription?.cancel();
    _profilesListSubscription = _profileRepository.listen(
        (list) => add(ProfileListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * profileLimit : null);
  }

  Future<void> _mapLoadProfileListWithDetailsToState() async {
    int amountNow = (state is ProfileListLoaded)
        ? (state as ProfileListLoaded).values!.length
        : 0;
    _profilesListSubscription?.cancel();
    _profilesListSubscription = _profileRepository.listenWithDetails(
        (list) => add(ProfileListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * profileLimit : null);
  }

  Future<void> _mapAddProfileListToState(AddProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _profileRepository.add(value);
    }
  }

  Future<void> _mapUpdateProfileListToState(UpdateProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _profileRepository.update(value);
    }
  }

  Future<void> _mapDeleteProfileListToState(DeleteProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _profileRepository.delete(value);
    }
  }

  ProfileListLoaded _mapProfileListUpdatedToState(ProfileListUpdated event) =>
      ProfileListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _profilesListSubscription?.cancel();
    return super.close();
  }
}
