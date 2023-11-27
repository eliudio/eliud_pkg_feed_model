/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_front_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/model/internal_component.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/feed_front_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_model.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_form_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_front_form_state.dart';

class FeedFrontForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final FeedFrontModel? value;
  final ActionModel? submitAction;

  FeedFrontForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the FeedFrontForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<FeedFrontFormBloc>(
        create: (context) => FeedFrontFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedFrontFormEvent(value: value)),
        child: _MyFeedFrontForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<FeedFrontFormBloc>(
        create: (context) => FeedFrontFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedFrontFormNoLoadEvent(value: value)),
        child: _MyFeedFrontForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update FeedFront'
                      : 'Add FeedFront'),
          body: BlocProvider<FeedFrontFormBloc>(
            create: (context) => FeedFrontFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseFeedFrontFormEvent(value: value)
                : InitialiseNewFeedFrontFormEvent())),
            child: _MyFeedFrontForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyFeedFrontForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyFeedFrontForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyFeedFrontForm> createState() => _MyFeedFrontFormState(formAction);
}

class _MyFeedFrontFormState extends State<_MyFeedFrontForm> {
  final FormAction? formAction;
  late FeedFrontFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _feed;

  _MyFeedFrontFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FeedFrontFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedFrontFormBloc, FeedFrontFormState>(
        builder: (context, state) {
      if (state is FeedFrontFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is FeedFrontFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.feed != null) {
          _feed = state.value!.feed!.documentID;
        } else {
          _feed = "";
        }
      }
      if (state is FeedFrontFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

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
                validator: (_) => state is DocumentIDFeedFrontFormError
                    ? state.message
                    : null,
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
                    state is AppIdFeedFrontFormError ? state.message : null,
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
                validator: (_) => state is DescriptionFeedFrontFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "feeds",
              value: _feed,
              trigger: (value, privilegeLevel) => _onFeedSelected(value),
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
                        if (state is FeedFrontFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<FeedFrontListBloc>(context)
                                .add(UpdateFeedFrontList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              feed: state.value!.feed,
                              backgroundOverridePosts:
                                  state.value!.backgroundOverridePosts,
                              backgroundOverrideProfile:
                                  state.value!.backgroundOverrideProfile,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<FeedFrontListBloc>(context)
                                .add(AddFeedFrontList(
                                    value: FeedFrontModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              feed: state.value!.feed,
                              backgroundOverridePosts:
                                  state.value!.backgroundOverridePosts,
                              backgroundOverrideProfile:
                                  state.value!.backgroundOverrideProfile,
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
        .add(ChangedFeedFrontDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFeedFrontAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedFeedFrontDescription(value: _descriptionController.text));
  }

  void _onFeedSelected(String? val) {
    setState(() {
      _feed = val;
    });
    _myFormBloc.add(ChangedFeedFrontFeed(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, FeedFrontFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
