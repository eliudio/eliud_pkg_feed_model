/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/feed_repository.dart';
import '../model/feed_front_repository.dart';
import '../model/feed_menu_repository.dart';
import '../model/member_profile_repository.dart';
import '../model/post_repository.dart';
import '../model/post_comment_repository.dart';
import '../model/post_like_repository.dart';
import '../model/profile_repository.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

FeedRepository? feedRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.feedRepository(appId);
FeedFrontRepository? feedFrontRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.feedFrontRepository(appId);
FeedMenuRepository? feedMenuRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.feedMenuRepository(appId);
MemberProfileRepository? memberProfileRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.memberProfileRepository(appId);
PostRepository? postRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.postRepository(appId);
PostCommentRepository? postCommentRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.postCommentRepository(appId);
PostLikeRepository? postLikeRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.postLikeRepository(appId);
ProfileRepository? profileRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.profileRepository(appId);

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
    MemberCollectionInfo('memberprofile', 'authorId'),
    MemberCollectionInfo('post', 'authorId'),
    MemberCollectionInfo('postcomment', 'memberId'),
    MemberCollectionInfo('postlike', 'memberId'),
  ];
  static late AbstractRepositorySingleton singleton;

  FeedRepository? feedRepository(String? appId);
  FeedFrontRepository? feedFrontRepository(String? appId);
  FeedMenuRepository? feedMenuRepository(String? appId);
  MemberProfileRepository? memberProfileRepository(String? appId);
  PostRepository? postRepository(String? appId);
  PostCommentRepository? postCommentRepository(String? appId);
  PostLikeRepository? postLikeRepository(String? appId);
  ProfileRepository? profileRepository(String? appId);

  void flush(String? appId) {
    feedRepository(appId)!.flush();
    feedFrontRepository(appId)!.flush();
    feedMenuRepository(appId)!.flush();
    memberProfileRepository(appId)!.flush();
    postRepository(appId)!.flush();
    postCommentRepository(appId)!.flush();
    postLikeRepository(appId)!.flush();
    profileRepository(appId)!.flush();
  }
}
