/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_feed_model/model/profile_component_bloc.dart';
import 'package:eliud_pkg_feed_model/model/profile_component_event.dart';
import 'package:eliud_pkg_feed_model/model/profile_model.dart';
import 'package:eliud_pkg_feed_model/model/profile_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractProfileComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractProfileComponent extends StatelessWidget {
  static String componentName = "profiles";
  final AppModel app;
  final String profileId;

  /*
   * Construct AbstractProfileComponent
   */
  AbstractProfileComponent(
      {super.key, required this.app, required this.profileId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileComponentBloc>(
      create: (context) => ProfileComponentBloc(
          profileRepository: profileRepository(appId: app.documentID)!)
        ..add(FetchProfileComponent(id: profileId)),
      child: _profileBlockBuilder(context),
    );
  }

  Widget _profileBlockBuilder(BuildContext context) {
    return BlocBuilder<ProfileComponentBloc, ProfileComponentState>(
        builder: (context, state) {
      if (state is ProfileComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is ProfileComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is ProfileComponentError) {
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
  Widget yourWidget(BuildContext context, ProfileModel value);
}
