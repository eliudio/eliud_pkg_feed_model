/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'post_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PostFormState extends Equatable {
  const PostFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class PostFormUninitialized extends PostFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''PostFormState()''';
  }
}

// PostModel has been initialised and hence PostModel is available
class PostFormInitialized extends PostFormState {
  final PostModel? value;

  @override
  List<Object?> get props => [value];

  const PostFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class PostFormError extends PostFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const PostFormError({this.message, super.value});

  @override
  String toString() {
    return '''PostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDPostFormError extends PostFormError {
  const DocumentIDPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdPostFormError extends PostFormError {
  const AuthorIdPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimestampPostFormError extends PostFormError {
  const TimestampPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimestampPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdPostFormError extends PostFormError {
  const AppIdPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FeedIdPostFormError extends PostFormError {
  const FeedIdPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''FeedIdPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostAppIdPostFormError extends PostFormError {
  const PostAppIdPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostAppIdPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostPageIdPostFormError extends PostFormError {
  const PostPageIdPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PostPageIdPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PageParametersPostFormError extends PostFormError {
  const PageParametersPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PageParametersPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class HtmlPostFormError extends PostFormError {
  const HtmlPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''HtmlPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionPostFormError extends PostFormError {
  const DescriptionPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class LikesPostFormError extends PostFormError {
  const LikesPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''LikesPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DislikesPostFormError extends PostFormError {
  const DislikesPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DislikesPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByGroupPostFormError extends PostFormError {
  const AccessibleByGroupPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByGroupPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByMembersPostFormError extends PostFormError {
  const AccessibleByMembersPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByMembersPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReadAccessPostFormError extends PostFormError {
  const ReadAccessPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReadAccessPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ArchivedPostFormError extends PostFormError {
  const ArchivedPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ArchivedPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ExternalLinkPostFormError extends PostFormError {
  const ExternalLinkPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ExternalLinkPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MemberMediaPostFormError extends PostFormError {
  const MemberMediaPostFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MemberMediaPostFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PostFormLoaded extends PostFormInitialized {
  const PostFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''PostFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittablePostForm extends PostFormInitialized {
  const SubmittablePostForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittablePostForm {
      value: $value,
    }''';
  }
}
