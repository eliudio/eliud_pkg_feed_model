/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_menu_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:eliud_core_helpers/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';
import 'package:eliud_pkg_feed_model/model/embedded_component.dart';
import 'package:eliud_core_main/tools/bespoke_formfields.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_menu_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_model.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_form_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_menu_form_state.dart';

class FeedMenuForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final FeedMenuModel? value;
  final ActionModel? submitAction;

  FeedMenuForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the FeedMenuForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<FeedMenuFormBloc>(
        create: (context) => FeedMenuFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedMenuFormEvent(value: value)),
        child: _MyFeedMenuForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<FeedMenuFormBloc>(
        create: (context) => FeedMenuFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedMenuFormNoLoadEvent(value: value)),
        child: _MyFeedMenuForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update FeedMenu'
                      : 'Add FeedMenu'),
          body: BlocProvider<FeedMenuFormBloc>(
            create: (context) => FeedMenuFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseFeedMenuFormEvent(value: value)
                : InitialiseNewFeedMenuFormEvent())),
            child: _MyFeedMenuForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyFeedMenuForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyFeedMenuForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyFeedMenuForm> createState() => _MyFeedMenuFormState(formAction);
}

class _MyFeedMenuFormState extends State<_MyFeedMenuForm> {
  final FormAction? formAction;
  late FeedMenuFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _feedFront;

  _MyFeedMenuFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FeedMenuFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedMenuFormBloc, FeedMenuFormState>(
        builder: (context, state) {
      if (state is FeedMenuFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is FeedMenuFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.feedFront != null) {
          _feedFront = state.value!.feedFront!.documentID;
        } else {
          _feedFront = "";
        }
      }
      if (state is FeedMenuFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: labelledBodyComponentsList(
                widget.app,
                context,
                state.value!.bodyComponentsCurrentMember,
                _onBodyComponentsCurrentMemberChanged)));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: labelledBodyComponentsList(
                widget.app,
                context,
                state.value!.bodyComponentsOtherMember,
                _onBodyComponentsOtherMemberChanged)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDFeedMenuFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AppIdFeedMenuFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionFeedMenuFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "feedFronts",
              value: _feedFront,
              trigger: (value, privilegeLevel) => _onFeedFrontSelected(value),
              optional: false),
        );

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Icon Colors')));

        children.add(RgbField(widget.app, "Text color", state.value!.itemColor,
            _onItemColorChanged));

        children.add(RgbField(widget.app, "Selected Item Color",
            state.value!.selectedItemColor, _onSelectedItemColorChanged));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Menu Colors')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Conditions')));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is FeedMenuFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<FeedMenuListBloc>(context)
                                .add(UpdateFeedMenuList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              bodyComponentsCurrentMember:
                                  state.value!.bodyComponentsCurrentMember,
                              bodyComponentsOtherMember:
                                  state.value!.bodyComponentsOtherMember,
                              itemColor: state.value!.itemColor,
                              selectedItemColor: state.value!.selectedItemColor,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              feedFront: state.value!.feedFront,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<FeedMenuListBloc>(context)
                                .add(AddFeedMenuList(
                                    value: FeedMenuModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              bodyComponentsCurrentMember:
                                  state.value!.bodyComponentsCurrentMember,
                              bodyComponentsOtherMember:
                                  state.value!.bodyComponentsOtherMember,
                              itemColor: state.value!.itemColor,
                              selectedItemColor: state.value!.selectedItemColor,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              feedFront: state.value!.feedFront,
                              conditions: state.value!.conditions,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedFeedMenuDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFeedMenuAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedFeedMenuDescription(value: _descriptionController.text));
  }

  void _onBodyComponentsCurrentMemberChanged(value) {
    _myFormBloc.add(ChangedFeedMenuBodyComponentsCurrentMember(value: value));
    setState(() {});
  }

  void _onBodyComponentsOtherMemberChanged(value) {
    _myFormBloc.add(ChangedFeedMenuBodyComponentsOtherMember(value: value));
    setState(() {});
  }

  void _onItemColorChanged(value) {
    _myFormBloc.add(ChangedFeedMenuItemColor(value: value));
  }

  void _onSelectedItemColorChanged(value) {
    _myFormBloc.add(ChangedFeedMenuSelectedItemColor(value: value));
  }

  void _onFeedFrontSelected(String? val) {
    setState(() {
      _feedFront = val;
    });
    _myFormBloc.add(ChangedFeedMenuFeedFront(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, FeedMenuFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
