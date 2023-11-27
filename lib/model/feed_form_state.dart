/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'feed_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FeedFormState extends Equatable {
  const FeedFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class FeedFormUninitialized extends FeedFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''FeedFormState()''';
  }
}

// FeedModel has been initialised and hence FeedModel is available
class FeedFormInitialized extends FeedFormState {
  final FeedModel? value;

  @override
  List<Object?> get props => [value];

  const FeedFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class FeedFormError extends FeedFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const FeedFormError({this.message, super.value});

  @override
  String toString() {
    return '''FeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDFeedFormError extends FeedFormError {
  const DocumentIDFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdFeedFormError extends FeedFormError {
  const AppIdFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DescriptionFeedFormError extends FeedFormError {
  const DescriptionFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DescriptionFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ThumbImageFeedFormError extends FeedFormError {
  const ThumbImageFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ThumbImageFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class PhotoPostFeedFormError extends FeedFormError {
  const PhotoPostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''PhotoPostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class VideoPostFeedFormError extends FeedFormError {
  const VideoPostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''VideoPostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class MessagePostFeedFormError extends FeedFormError {
  const MessagePostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''MessagePostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AudioPostFeedFormError extends FeedFormError {
  const AudioPostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AudioPostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AlbumPostFeedFormError extends FeedFormError {
  const AlbumPostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AlbumPostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ArticlePostFeedFormError extends FeedFormError {
  const ArticlePostFeedFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ArticlePostFeedFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class FeedFormLoaded extends FeedFormInitialized {
  const FeedFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''FeedFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableFeedForm extends FeedFormInitialized {
  const SubmittableFeedForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableFeedForm {
      value: $value,
    }''';
  }
}
