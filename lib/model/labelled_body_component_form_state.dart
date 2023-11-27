/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 labelled_body_component_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'labelled_body_component_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LabelledBodyComponentFormState extends Equatable {
  const LabelledBodyComponentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class LabelledBodyComponentFormUninitialized
    extends LabelledBodyComponentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''LabelledBodyComponentFormState()''';
  }
}

// LabelledBodyComponentModel has been initialised and hence LabelledBodyComponentModel is available
class LabelledBodyComponentFormInitialized
    extends LabelledBodyComponentFormState {
  final LabelledBodyComponentModel? value;

  @override
  List<Object?> get props => [value];

  const LabelledBodyComponentFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class LabelledBodyComponentFormError
    extends LabelledBodyComponentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const LabelledBodyComponentFormError({this.message, super.value});

  @override
  String toString() {
    return '''LabelledBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDLabelledBodyComponentFormError
    extends LabelledBodyComponentFormError {
  const DocumentIDLabelledBodyComponentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDLabelledBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LabelLabelledBodyComponentFormError
    extends LabelledBodyComponentFormError {
  const LabelLabelledBodyComponentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LabelLabelledBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ComponentNameLabelledBodyComponentFormError
    extends LabelledBodyComponentFormError {
  const ComponentNameLabelledBodyComponentFormError(
      {super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ComponentNameLabelledBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ComponentIdLabelledBodyComponentFormError
    extends LabelledBodyComponentFormError {
  const ComponentIdLabelledBodyComponentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ComponentIdLabelledBodyComponentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LabelledBodyComponentFormLoaded
    extends LabelledBodyComponentFormInitialized {
  const LabelledBodyComponentFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''LabelledBodyComponentFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableLabelledBodyComponentForm
    extends LabelledBodyComponentFormInitialized {
  const SubmittableLabelledBodyComponentForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableLabelledBodyComponentForm {
      value: $value,
    }''';
  }
}
