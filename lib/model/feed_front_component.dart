/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/feed_front_component_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_component_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractFeedFrontComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractFeedFrontComponent extends StatelessWidget {
  static String componentName = "feedFronts";
  final AppModel app;
  final String feedFrontId;

  /*
   * Construct AbstractFeedFrontComponent
   */
  AbstractFeedFrontComponent(
      {super.key, required this.app, required this.feedFrontId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedFrontComponentBloc>(
      create: (context) => FeedFrontComponentBloc(
          feedFrontRepository: feedFrontRepository(appId: app.documentID)!)
        ..add(FetchFeedFrontComponent(id: feedFrontId)),
      child: _feedFrontBlockBuilder(context),
    );
  }

  Widget _feedFrontBlockBuilder(BuildContext context) {
    return BlocBuilder<FeedFrontComponentBloc, FeedFrontComponentState>(
        builder: (context, state) {
      if (state is FeedFrontComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is FeedFrontComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is FeedFrontComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, FeedFrontModel value);
}
