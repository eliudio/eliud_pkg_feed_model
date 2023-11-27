/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_list_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/labelled_body_component_repository.dart';
import 'package:eliud_pkg_feed_model/model/labelled_body_component_list_event.dart';
import 'package:eliud_pkg_feed_model/model/labelled_body_component_list_state.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'labelled_body_component_model.dart';

typedef FilterLabelledBodyComponentModels = List<LabelledBodyComponentModel?>
    Function(List<LabelledBodyComponentModel?> values);

class LabelledBodyComponentListBloc extends Bloc<LabelledBodyComponentListEvent,
    LabelledBodyComponentListState> {
  final FilterLabelledBodyComponentModels? filter;
  final LabelledBodyComponentRepository _labelledBodyComponentRepository;
  StreamSubscription? _labelledBodyComponentsListSubscription;
  EliudQuery? eliudQuery;
  int pages = 1;
  final bool? paged;
  final String? orderBy;
  final bool? descending;
  final bool? detailed;
  final int labelledBodyComponentLimit;

  LabelledBodyComponentListBloc(
      {this.filter,
      this.paged,
      this.orderBy,
      this.descending,
      this.detailed,
      this.eliudQuery,
      required LabelledBodyComponentRepository labelledBodyComponentRepository,
      this.labelledBodyComponentLimit = 5})
      : _labelledBodyComponentRepository = labelledBodyComponentRepository,
        super(LabelledBodyComponentListLoading()) {
    on<LoadLabelledBodyComponentList>((event, emit) {
      if ((detailed == null) || (!detailed!)) {
        _mapLoadLabelledBodyComponentListToState();
      } else {
        _mapLoadLabelledBodyComponentListWithDetailsToState();
      }
    });

    on<NewPage>((event, emit) {
      pages = pages +
          1; // it doesn't matter so much if we increase pages beyond the end
      _mapLoadLabelledBodyComponentListWithDetailsToState();
    });

    on<LabelledBodyComponentChangeQuery>((event, emit) {
      eliudQuery = event.newQuery;
      if ((detailed == null) || (!detailed!)) {
        _mapLoadLabelledBodyComponentListToState();
      } else {
        _mapLoadLabelledBodyComponentListWithDetailsToState();
      }
    });

    on<AddLabelledBodyComponentList>((event, emit) async {
      await _mapAddLabelledBodyComponentListToState(event);
    });

    on<UpdateLabelledBodyComponentList>((event, emit) async {
      await _mapUpdateLabelledBodyComponentListToState(event);
    });

    on<DeleteLabelledBodyComponentList>((event, emit) async {
      await _mapDeleteLabelledBodyComponentListToState(event);
    });

    on<LabelledBodyComponentListUpdated>((event, emit) {
      emit(_mapLabelledBodyComponentListUpdatedToState(event));
    });
  }

  List<LabelledBodyComponentModel?> _filter(
      List<LabelledBodyComponentModel?> original) {
    if (filter != null) {
      return filter!(original);
    } else {
      return original;
    }
  }

  Future<void> _mapLoadLabelledBodyComponentListToState() async {
    int amountNow = (state is LabelledBodyComponentListLoaded)
        ? (state as LabelledBodyComponentListLoaded).values!.length
        : 0;
    _labelledBodyComponentsListSubscription?.cancel();
    _labelledBodyComponentsListSubscription =
        _labelledBodyComponentRepository.listen(
            (list) => add(LabelledBodyComponentListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * labelledBodyComponentLimit
                : null);
  }

  Future<void> _mapLoadLabelledBodyComponentListWithDetailsToState() async {
    int amountNow = (state is LabelledBodyComponentListLoaded)
        ? (state as LabelledBodyComponentListLoaded).values!.length
        : 0;
    _labelledBodyComponentsListSubscription?.cancel();
    _labelledBodyComponentsListSubscription =
        _labelledBodyComponentRepository.listenWithDetails(
            (list) => add(LabelledBodyComponentListUpdated(
                value: _filter(list), mightHaveMore: amountNow != list.length)),
            orderBy: orderBy,
            descending: descending,
            eliudQuery: eliudQuery,
            limit: ((paged != null) && paged!)
                ? pages * labelledBodyComponentLimit
                : null);
  }

  Future<void> _mapAddLabelledBodyComponentListToState(
      AddLabelledBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _labelledBodyComponentRepository.add(value);
    }
  }

  Future<void> _mapUpdateLabelledBodyComponentListToState(
      UpdateLabelledBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _labelledBodyComponentRepository.update(value);
    }
  }

  Future<void> _mapDeleteLabelledBodyComponentListToState(
      DeleteLabelledBodyComponentList event) async {
    var value = event.value;
    if (value != null) {
      await _labelledBodyComponentRepository.delete(value);
    }
  }

  LabelledBodyComponentListLoaded _mapLabelledBodyComponentListUpdatedToState(
          LabelledBodyComponentListUpdated event) =>
      LabelledBodyComponentListLoaded(
          values: event.value, mightHaveMore: event.mightHaveMore);

  @override
  Future<void> close() {
    _labelledBodyComponentsListSubscription?.cancel();
    return super.close();
  }
}
