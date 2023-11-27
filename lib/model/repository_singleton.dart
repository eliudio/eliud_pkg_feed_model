/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/feed_firestore.dart';
import '../model/feed_repository.dart';
import '../model/feed_cache.dart';
import '../model/feed_front_firestore.dart';
import '../model/feed_front_repository.dart';
import '../model/feed_front_cache.dart';
import '../model/feed_menu_firestore.dart';
import '../model/feed_menu_repository.dart';
import '../model/feed_menu_cache.dart';
import '../model/member_profile_firestore.dart';
import '../model/member_profile_repository.dart';
import '../model/post_firestore.dart';
import '../model/post_repository.dart';
import '../model/post_cache.dart';
import '../model/post_comment_firestore.dart';
import '../model/post_comment_repository.dart';
import '../model/post_comment_cache.dart';
import '../model/post_like_firestore.dart';
import '../model/post_like_repository.dart';
import '../model/post_like_cache.dart';
import '../model/profile_firestore.dart';
import '../model/profile_repository.dart';
import '../model/profile_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _feedRepository = HashMap<String, FeedRepository>();
  final _feedFrontRepository = HashMap<String, FeedFrontRepository>();
  final _feedMenuRepository = HashMap<String, FeedMenuRepository>();
  final _memberProfileRepository = HashMap<String, MemberProfileRepository>();
  final _postRepository = HashMap<String, PostRepository>();
  final _postCommentRepository = HashMap<String, PostCommentRepository>();
  final _postLikeRepository = HashMap<String, PostLikeRepository>();
  final _profileRepository = HashMap<String, ProfileRepository>();

  @override
  FeedRepository? feedRepository(String? appId) {
    if ((appId != null) && (_feedRepository[appId] == null)) {
      _feedRepository[appId] = FeedCache(FeedFirestore(
          () => appRepository()!.getSubCollection(appId, 'feed'), appId));
    }
    return _feedRepository[appId];
  }

  @override
  FeedFrontRepository? feedFrontRepository(String? appId) {
    if ((appId != null) && (_feedFrontRepository[appId] == null)) {
      _feedFrontRepository[appId] = FeedFrontCache(FeedFrontFirestore(
          () => appRepository()!.getSubCollection(appId, 'feedfront'), appId));
    }
    return _feedFrontRepository[appId];
  }

  @override
  FeedMenuRepository? feedMenuRepository(String? appId) {
    if ((appId != null) && (_feedMenuRepository[appId] == null)) {
      _feedMenuRepository[appId] = FeedMenuCache(FeedMenuFirestore(
          () => appRepository()!.getSubCollection(appId, 'feedmenu'), appId));
    }
    return _feedMenuRepository[appId];
  }

  @override
  MemberProfileRepository? memberProfileRepository(String? appId) {
    if ((appId != null) && (_memberProfileRepository[appId] == null)) {
      _memberProfileRepository[appId] = MemberProfileFirestore(
          () => appRepository()!.getSubCollection(appId, 'memberprofile'),
          appId);
    }
    return _memberProfileRepository[appId];
  }

  @override
  PostRepository? postRepository(String? appId) {
    if ((appId != null) && (_postRepository[appId] == null)) {
      _postRepository[appId] = PostCache(PostFirestore(
          () => appRepository()!.getSubCollection(appId, 'post'), appId));
    }
    return _postRepository[appId];
  }

  @override
  PostCommentRepository? postCommentRepository(String? appId) {
    if ((appId != null) && (_postCommentRepository[appId] == null)) {
      _postCommentRepository[appId] = PostCommentCache(PostCommentFirestore(
          () => appRepository()!.getSubCollection(appId, 'postcomment'),
          appId));
    }
    return _postCommentRepository[appId];
  }

  @override
  PostLikeRepository? postLikeRepository(String? appId) {
    if ((appId != null) && (_postLikeRepository[appId] == null)) {
      _postLikeRepository[appId] = PostLikeCache(PostLikeFirestore(
          () => appRepository()!.getSubCollection(appId, 'postlike'), appId));
    }
    return _postLikeRepository[appId];
  }

  @override
  ProfileRepository? profileRepository(String? appId) {
    if ((appId != null) && (_profileRepository[appId] == null)) {
      _profileRepository[appId] = ProfileCache(ProfileFirestore(
          () => appRepository()!.getSubCollection(appId, 'profile'), appId));
    }
    return _profileRepository[appId];
  }
}
