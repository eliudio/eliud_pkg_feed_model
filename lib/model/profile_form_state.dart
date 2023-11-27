/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ProfileFormState extends Equatable {
  const ProfileFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ProfileFormUninitialized extends ProfileFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ProfileFormState()''';
  }
}

// ProfileModel has been initialised and hence ProfileModel is available
class ProfileFormInitialized extends ProfileFormState {
  final ProfileModel? value;

  @override
  List<Object?> get props => [value];

  const ProfileFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ProfileFormError extends ProfileFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ProfileFormError({this.message, super.value});

  @override
  String toString() {
    return '''ProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDProfileFormError extends ProfileFormError {
  const DocumentIDProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdProfileFormError extends ProfileFormError {
  const AppIdProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionProfileFormError extends ProfileFormError {
  const DescriptionProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FeedProfileFormError extends ProfileFormError {
  const FeedProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''FeedProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class BackgroundOverrideProfileFormError extends ProfileFormError {
  const BackgroundOverrideProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''BackgroundOverrideProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ConditionsProfileFormError extends ProfileFormError {
  const ConditionsProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ConditionsProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProfileFormLoaded extends ProfileFormInitialized {
  const ProfileFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ProfileFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableProfileForm extends ProfileFormInitialized {
  const SubmittableProfileForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableProfileForm {
      value: $value,
    }''';
  }
}
