/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_constructor.dart';
import 'package:eliud_core_main/apis/apis.dart';

import 'feed_front_component_selector.dart';
import 'feed_menu_component_selector.dart';
import 'profile_component_selector.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init(
    ComponentConstructor feedFrontComponentConstructorDefault,
    ComponentEditorConstructor feedFrontComponentEditorConstructor,
    ComponentConstructor feedMenuComponentConstructorDefault,
    ComponentEditorConstructor feedMenuComponentEditorConstructor,
    ComponentConstructor profileComponentConstructorDefault,
    ComponentEditorConstructor profileComponentEditorConstructor,
  ) {
    Apis.apis().getRegistryApi().addInternalComponents('eliud_pkg_feed_model', [
      "feeds",
      "feedFronts",
      "feedMenus",
      "posts",
      "postComments",
      "postLikes",
      "profiles",
    ]);

    Apis.apis().getRegistryApi().register(
        componentName: "eliud_pkg_feed_model_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("feedFronts", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "feedFronts",
        componentConstructor: feedFrontComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("feedMenus", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "feedMenus",
        componentConstructor: feedMenuComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addDropDownSupporter("profiles", DropdownButtonComponentFactory());
    Apis.apis().getRegistryApi().register(
        componentName: "profiles",
        componentConstructor: profileComponentConstructorDefault);
    Apis.apis()
        .getRegistryApi()
        .addComponentSpec('eliud_pkg_feed_model', 'feed', [
      ComponentSpec(
          'feedFronts',
          feedFrontComponentConstructorDefault,
          FeedFrontComponentSelector(),
          feedFrontComponentEditorConstructor,
          ({String? appId}) => feedFrontRepository(appId: appId)!),
      ComponentSpec(
          'feedMenus',
          feedMenuComponentConstructorDefault,
          FeedMenuComponentSelector(),
          feedMenuComponentEditorConstructor,
          ({String? appId}) => feedMenuRepository(appId: appId)!),
      ComponentSpec(
          'profiles',
          profileComponentConstructorDefault,
          ProfileComponentSelector(),
          profileComponentEditorConstructor,
          ({String? appId}) => profileRepository(appId: appId)!),
    ]);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'feeds',
        ({String? appId}) => feedRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'feedFronts',
        ({String? appId}) => feedFrontRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'feedMenus',
        ({String? appId}) => feedMenuRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'memberProfiles',
        ({String? appId}) => memberProfileRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'posts',
        ({String? appId}) => postRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'postComments',
        ({String? appId}) => postCommentRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'postLikes',
        ({String? appId}) => postLikeRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_pkg_feed_model',
        'profiles',
        ({String? appId}) => profileRepository(appId: appId)!);
  }
}
