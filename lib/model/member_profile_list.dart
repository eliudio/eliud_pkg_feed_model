/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/tools/route_builders/route_builders.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_helpers/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_helpers/tools/delete_snackbar.dart';
import 'package:eliud_core_main/tools/etc/etc.dart';
import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_feed_model/model/member_profile_list_event.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_list_state.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_model.dart';

import 'package:eliud_core_main/model/app_model.dart';

import 'member_profile_form.dart';

typedef MemberProfileWidgetProvider = Function(MemberProfileModel? value);

class MemberProfileListWidget extends StatefulWidget with HasFab {
  final AppModel app;
  final BackgroundModel? listBackground;
  final MemberProfileWidgetProvider? widgetProvider;
  final bool? readOnly;
  final String? form;
  //final MemberProfileListWidgetState? state;
  final bool? isEmbedded;

  MemberProfileListWidget(
      {super.key,
      required this.app,
      this.readOnly,
      this.form,
      this.widgetProvider,
      this.isEmbedded,
      this.listBackground});

  @override
  MemberProfileListWidgetState createState() {
    return MemberProfileListWidgetState();
  }

  @override
  Widget? fab(BuildContext context) {
    if ((readOnly != null) && readOnly!) return null;
    var state = MemberProfileListWidgetState();
    return state.fab(
      context,
    );
  }
}

class MemberProfileListWidgetState extends State<MemberProfileListWidget> {
  Widget? fab(BuildContext aContext) {
    return !Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID)
        ? null
        : StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .floatingActionButton(
            widget.app,
            context,
            'PageFloatBtnTag',
            Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                pageRouteBuilder(widget.app,
                    page: BlocProvider.value(
                        value: BlocProvider.of<MemberProfileListBloc>(context),
                        child: MemberProfileForm(
                            app: widget.app,
                            value: null,
                            formAction: FormAction.addAction))),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Apis.apis().getCoreApi().buildWhenAccessDetermined(widget.app,
        (context) {
      return BlocBuilder<MemberProfileListBloc, MemberProfileListState>(
          builder: (context, state) {
        if (state is MemberProfileListLoading) {
          return StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context);
        } else if (state is MemberProfileListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && widget.isEmbedded!) {
            var children = <Widget>[];
            children.add(theList(
              context,
              values,
            ));
            children.add(StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .button(
              widget.app,
              context,
              label: 'Add',
              onPressed: () {
                Navigator.of(context).push(
                  pageRouteBuilder(widget.app,
                      page: BlocProvider.value(
                          value:
                              BlocProvider.of<MemberProfileListBloc>(context),
                          child: MemberProfileForm(
                              app: widget.app,
                              value: null,
                              formAction: FormAction.addAction))),
                );
              },
            ));
            return ListView(
                padding: const EdgeInsets.all(8),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: children);
          } else {
            return theList(
              context,
              values,
            );
          }
        } else {
          return StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context);
        }
      });
    });
  }

  Widget theList(
    BuildContext context,
    values,
  ) {
    var member = Apis.apis().getCoreApi().getMember(context);
    return Container(
        decoration: widget.listBackground == null
            ? StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .boxDecorator(widget.app, context, member)
            : BoxDecorationHelper.boxDecoration(
                widget.app, member, widget.listBackground),
        child: ListView.separated(
            separatorBuilder: (context, index) => StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .divider(widget.app, context),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];

              if (widget.widgetProvider != null) {
                return widget.widgetProvider!(value);
              }

              return MemberProfileListItem(
                app: widget.app,
                value: value,
//            app: accessState.app,
                onDismissed: (direction) {
                  BlocProvider.of<MemberProfileListBloc>(context)
                      .add(DeleteMemberProfileList(value: value));
                  ScaffoldMessenger.of(context).showSnackBar(DeleteSnackBar(
                    message: "MemberProfile $value.documentID",
                    onUndo: () =>
                        BlocProvider.of<MemberProfileListBloc>(context)
                            .add(AddMemberProfileList(value: value)),
                  ));
                },
                onTap: () async {
                  final removedItem = await Navigator.of(context).push(
                      pageRouteBuilder(widget.app,
                          page: BlocProvider.value(
                              value: BlocProvider.of<MemberProfileListBloc>(
                                  context),
                              child: getForm(value, FormAction.updateAction))));
                  if (removedItem != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      DeleteSnackBar(
                        message: "MemberProfile $value.documentID",
                        onUndo: () =>
                            BlocProvider.of<MemberProfileListBloc>(context)
                                .add(AddMemberProfileList(value: value)),
                      ),
                    );
                  }
                },
              );
            }));
  }

  Widget? getForm(value, action) {
    if (widget.form == null) {
      return MemberProfileForm(
          app: widget.app, value: value, formAction: action);
    } else {
      return null;
    }
  }
}

class MemberProfileListItem extends StatelessWidget {
  final AppModel app;
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MemberProfileModel value;

  MemberProfileListItem({
    super.key,
    required this.app,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__MemberProfile_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Center(
            child: StyleRegistry.registry()
                .styleWithApp(app)
                .frontEndStyle()
                .textStyle()
                .text(app, context, value.documentID)),
      ),
    );
  }
}
