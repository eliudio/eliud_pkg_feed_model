/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'member_profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MemberProfileFormState extends Equatable {
  const MemberProfileFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class MemberProfileFormUninitialized extends MemberProfileFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''MemberProfileFormState()''';
  }
}

// MemberProfileModel has been initialised and hence MemberProfileModel is available
class MemberProfileFormInitialized extends MemberProfileFormState {
  final MemberProfileModel? value;

  @override
  List<Object?> get props => [value];

  const MemberProfileFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class MemberProfileFormError extends MemberProfileFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const MemberProfileFormError({this.message, super.value});

  @override
  String toString() {
    return '''MemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDMemberProfileFormError extends MemberProfileFormError {
  const DocumentIDMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdMemberProfileFormError extends MemberProfileFormError {
  const AppIdMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FeedIdMemberProfileFormError extends MemberProfileFormError {
  const FeedIdMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''FeedIdMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdMemberProfileFormError extends MemberProfileFormError {
  const AuthorIdMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProfileMemberProfileFormError extends MemberProfileFormError {
  const ProfileMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProfileMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProfileBackgroundMemberProfileFormError extends MemberProfileFormError {
  const ProfileBackgroundMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProfileBackgroundMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ProfileOverrideMemberProfileFormError extends MemberProfileFormError {
  const ProfileOverrideMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ProfileOverrideMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class NameOverrideMemberProfileFormError extends MemberProfileFormError {
  const NameOverrideMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''NameOverrideMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByGroupMemberProfileFormError extends MemberProfileFormError {
  const AccessibleByGroupMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByGroupMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByMembersMemberProfileFormError extends MemberProfileFormError {
  const AccessibleByMembersMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByMembersMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReadAccessMemberProfileFormError extends MemberProfileFormError {
  const ReadAccessMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReadAccessMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberMediaMemberProfileFormError extends MemberProfileFormError {
  const MemberMediaMemberProfileFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberMediaMemberProfileFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberProfileFormLoaded extends MemberProfileFormInitialized {
  const MemberProfileFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''MemberProfileFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableMemberProfileForm extends MemberProfileFormInitialized {
  const SubmittableMemberProfileForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableMemberProfileForm {
      value: $value,
    }''';
  }
}
