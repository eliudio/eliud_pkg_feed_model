/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'post_comment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostCommentFormState extends Equatable {
  const PostCommentFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PostCommentFormUninitialized extends PostCommentFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PostCommentFormState()''';
  }
}

// PostCommentModel has been initialised and hence PostCommentModel is available
class PostCommentFormInitialized extends PostCommentFormState {
  final PostCommentModel? value;

  @override
  List<Object?> get props => [value];

  const PostCommentFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PostCommentFormError extends PostCommentFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PostCommentFormError({this.message, super.value});

  @override
  String toString() {
    return '''PostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPostCommentFormError extends PostCommentFormError {
  const DocumentIDPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostIdPostCommentFormError extends PostCommentFormError {
  const PostIdPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostIdPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostCommentIdPostCommentFormError extends PostCommentFormError {
  const PostCommentIdPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostCommentIdPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberIdPostCommentFormError extends PostCommentFormError {
  const MemberIdPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberIdPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimestampPostCommentFormError extends PostCommentFormError {
  const TimestampPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimestampPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPostCommentFormError extends PostCommentFormError {
  const AppIdPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class CommentPostCommentFormError extends PostCommentFormError {
  const CommentPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''CommentPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LikesPostCommentFormError extends PostCommentFormError {
  const LikesPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LikesPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DislikesPostCommentFormError extends PostCommentFormError {
  const DislikesPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DislikesPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberMediaPostCommentFormError extends PostCommentFormError {
  const MemberMediaPostCommentFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberMediaPostCommentFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostCommentFormLoaded extends PostCommentFormInitialized {
  const PostCommentFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PostCommentFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePostCommentForm extends PostCommentFormInitialized {
  const SubmittablePostCommentForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePostCommentForm {
      value: $value,
    }''';
  }
}
