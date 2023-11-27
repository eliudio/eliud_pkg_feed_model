/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:bloc/bloc.dart';

import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/labelled_body_component_form_event.dart';
import 'package:eliud_pkg_feed_model/model/labelled_body_component_form_state.dart';

class LabelledBodyComponentFormBloc extends Bloc<LabelledBodyComponentFormEvent,
    LabelledBodyComponentFormState> {
  final String? appId;

  LabelledBodyComponentFormBloc(
    this.appId,
  ) : super(LabelledBodyComponentFormUninitialized()) {
    on<InitialiseNewLabelledBodyComponentFormEvent>((event, emit) {
      LabelledBodyComponentFormLoaded loaded = LabelledBodyComponentFormLoaded(
          value: LabelledBodyComponentModel(
        documentID: "IDENTIFIER",
        label: "",
        componentName: "",
        componentId: "",
      ));
      emit(loaded);
    });

    on<InitialiseLabelledBodyComponentFormEvent>((event, emit) async {
      LabelledBodyComponentFormLoaded loaded =
          LabelledBodyComponentFormLoaded(value: event.value);
      emit(loaded);
    });
    on<InitialiseLabelledBodyComponentFormNoLoadEvent>((event, emit) async {
      LabelledBodyComponentFormLoaded loaded =
          LabelledBodyComponentFormLoaded(value: event.value);
      emit(loaded);
    });
    LabelledBodyComponentModel? newValue;
    on<ChangedLabelledBodyComponentComponentName>((event, emit) async {
      if (state is LabelledBodyComponentFormInitialized) {
        final currentState = state as LabelledBodyComponentFormInitialized;
        newValue = currentState.value!.copyWith(componentName: event.value);
        emit(SubmittableLabelledBodyComponentForm(value: newValue));
      }
    });
    on<ChangedLabelledBodyComponentComponentId>((event, emit) async {
      if (state is LabelledBodyComponentFormInitialized) {
        final currentState = state as LabelledBodyComponentFormInitialized;
        newValue = currentState.value!.copyWith(componentId: event.value);
        emit(SubmittableLabelledBodyComponentForm(value: newValue));
      }
    });
  }
}
