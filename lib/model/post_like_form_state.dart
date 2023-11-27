/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'post_like_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostLikeFormState extends Equatable {
  const PostLikeFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PostLikeFormUninitialized extends PostLikeFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PostLikeFormState()''';
  }
}

// PostLikeModel has been initialised and hence PostLikeModel is available
class PostLikeFormInitialized extends PostLikeFormState {
  final PostLikeModel? value;

  @override
  List<Object?> get props => [value];

  const PostLikeFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PostLikeFormError extends PostLikeFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PostLikeFormError({this.message, super.value});

  @override
  String toString() {
    return '''PostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPostLikeFormError extends PostLikeFormError {
  const DocumentIDPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostIdPostLikeFormError extends PostLikeFormError {
  const PostIdPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostIdPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostCommentIdPostLikeFormError extends PostLikeFormError {
  const PostCommentIdPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostCommentIdPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberIdPostLikeFormError extends PostLikeFormError {
  const MemberIdPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberIdPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimestampPostLikeFormError extends PostLikeFormError {
  const TimestampPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimestampPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPostLikeFormError extends PostLikeFormError {
  const AppIdPostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LikeTypePostLikeFormError extends PostLikeFormError {
  const LikeTypePostLikeFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LikeTypePostLikeFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostLikeFormLoaded extends PostLikeFormInitialized {
  const PostLikeFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PostLikeFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePostLikeForm extends PostLikeFormInitialized {
  const SubmittablePostLikeForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePostLikeForm {
      value: $value,
    }''';
  }
}
