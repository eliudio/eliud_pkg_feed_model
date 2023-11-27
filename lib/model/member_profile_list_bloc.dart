/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/member_profile_repository.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_list_event.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'member_profile_model.dart';

typedef FilterMemberProfileModels = List<MemberProfileModel?> Function(
    List<MemberProfileModel?> values);

class MemberProfileListBloc
    extends Bloc<MemberProfileListEvent, MemberProfileListState> {
  final FilterMemberProfileModels? filter;
  final MemberProfileRepository _memberProfileRepository;
  StreamSubscription? _memberProfilesListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int memberProfileLimit;

  MemberProfileListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required MemberProfileRepository memberProfileRepository,
      this.memberProfileLimit = 5})
      : _memberProfileRepository = memberProfileRepository,
        super(MemberProfileListLoading()) {
    on<LoadMemberProfileList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberProfileListToState();
      } else {
        _mapLoadMemberProfileListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadMemberProfileListWithDetailsToState();
    });

    on<MemberProfileChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadMemberProfileListToState();
      } else {
        _mapLoadMemberProfileListWithDetailsToState();
      }
    });

    on<AddMemberProfileList>((event, emit) async {
      await _mapAddMemberProfileListToState(event);
    });

    on<UpdateMemberProfileList>((event, emit) async {
      await _mapUpdateMemberProfileListToState(event);
    });

    on<DeleteMemberProfileList>((event, emit) async {
      await _mapDeleteMemberProfileListToState(event);
    });

    on<MemberProfileListUpdated>((event, emit) {
      emit(_mapMemberProfileListUpdatedToState(event));
    });
  }

  List<MemberProfileModel?> _filter(List<MemberProfileModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadMemberProfileListToState() async {
    int amountNow = (state is MemberProfileListLoaded)
        ? (state as MemberProfileListLoaded).values!.length
        : 0;
    _memberProfilesListSubscription?.cancel();
    _memberProfilesListSubscription = _memberProfileRepository.listen(
        (list) => add(MemberProfileListUpdated(
            value: _filter(list), mightHaveMore: amountNow != list.length)),
        orderBy: orderBy,
        descending: descending,
        eliudQuery: eliudQuery,
        limit: ((paged != null) && paged!) ? pages * memberProfileLimit : null);
  }

  Future<void> _mapLoadMemberProfileListWithDetailsToState() async {
    int amountNow = (state is MemberProfileListLoaded)
        ? (state as MemberProfileListLoaded).values!.length
        : 0;
    _memberProfilesListSubscription?.cancel();
    _memberProfilesListSubscription =
        _memberProfileRepository.listenWithDetails(
            (list) => add(MemberProfileListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * memberProfileLimit
                : null);
  }

  Future<void> _mapAddMemberProfileListToState(
      AddMemberProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _memberProfileRepository.add(value);
    }
  }

  Future<void> _mapUpdateMemberProfileListToState(
      UpdateMemberProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _memberProfileRepository.update(value);
    }
  }

  Future<void> _mapDeleteMemberProfileListToState(
      DeleteMemberProfileList event) async {
    var value = event.value;
    if (value != null) {
      await _memberProfileRepository.delete(value);
    }
  }

  MemberProfileListLoaded _mapMemberProfileListUpdatedToState(
          MemberProfileListUpdated event) =>
      MemberProfileListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _memberProfilesListSubscription?.cancel();
    return super.close();
  }
}
