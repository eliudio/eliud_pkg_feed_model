import 'package:eliud_core/access/access_bloc.dart';
import 'package:eliud_core/access/state/logged_in.dart';
import 'package:eliud_core/core/navigate/router.dart' as eliudrouter;
import 'package:eliud_core/core/navigate/router.dart';
import 'package:eliud_core_main/apis/style/frontend/has_dialog.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_pkg_feed_model/tools/action/post_action_model.dart';
import 'package:flutter/material.dart';

import '../../model/abstract_repository_singleton.dart';
import '../../model/post_model.dart';

/*
 * Post the current page to the feed of the current user, for the user or for the user and his followers
 */
class PostActionHandler extends PackageActionHandler {
  @override
  Future<void> navigateTo(BuildContext context, ActionModel action,
      {Map<String, dynamic>? parameters}) async {
    if (action is PostActionModel) {
      var accessState = AccessBloc.getState(context);
      if (accessState is LoggedIn) {
        String name = action.app.documentID;

        openSelectionDialog(
            action.app, context, "${action.app.documentID}/_addpagetofeed",
            title: 'Add page to feed $name',
            options: ['Only Me', 'My followers', 'Public'],
            onSelection: (int choice) {
          switch (choice) {
            case 0:
              executePostIt(
                  context, action, accessState, PostAccessibleByGroup.me);
              break;
            case 1:
              executePostIt(context, action, accessState,
                  PostAccessibleByGroup.followers);
              break;
            case 2:
              executePostIt(
                  context, action, accessState, PostAccessibleByGroup.public);
              break;
          }
        });
      }
    }
  }

  Future<void> executePostIt(BuildContext context, PostActionModel action,
      LoggedIn accessState, PostAccessibleByGroup postAccessibleByGroup) async {
    var pageContextInfo = eliudrouter.Router.getPageContextInfo(context);
    var postAppId = pageContextInfo.appId;
    var postPageId = pageContextInfo.pageId;
    var parameters = pageContextInfo.parameters;
    // What is the current page?
    // Can we actually add the current page? (page should have an indicator if it's allowed to be added)

    postRepository(appId: action.app.documentID)!.add(PostModel(
        documentID: newRandomKey(),
        authorId: accessState.member.documentID,
        appId: action.app.documentID,
        postAppId: postAppId,
        feedId: action.feed!.documentID,
        postPageId: postPageId,
        archived: PostArchiveStatus.active,
        pageParameters: parameters,
        description: "Post added by Add To Post button",
        accessibleByGroup: postAccessibleByGroup,
        readAccess: [accessState.member.documentID]));
  }
}
