/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 profile_form.dart
                       
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

import 'package:eliud_pkg_feed_model/model/profile_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/profile_list_event.dart';
import 'package:eliud_pkg_feed_model/model/profile_model.dart';
import 'package:eliud_pkg_feed_model/model/profile_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/profile_form_event.dart';
import 'package:eliud_pkg_feed_model/model/profile_form_state.dart';

class ProfileForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final ProfileModel? value;
  final ActionModel? submitAction;

  ProfileForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the ProfileForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<ProfileFormBloc>(
        create: (context) => ProfileFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProfileFormEvent(value: value)),
        child: _MyProfileForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<ProfileFormBloc>(
        create: (context) => ProfileFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseProfileFormNoLoadEvent(value: value)),
        child: _MyProfileForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Profile'
                      : 'Add Profile'),
          body: BlocProvider<ProfileFormBloc>(
            create: (context) => ProfileFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseProfileFormEvent(value: value)
                : InitialiseNewProfileFormEvent())),
            child: _MyProfileForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyProfileForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyProfileForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyProfileForm> createState() => _MyProfileFormState(formAction);
}

class _MyProfileFormState extends State<_MyProfileForm> {
  final FormAction? formAction;
  late ProfileFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _feed;

  _MyProfileFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<ProfileFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFormBloc, ProfileFormState>(
        builder: (context, state) {
      if (state is ProfileFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is ProfileFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.feed != null) {
          _feed = state.value!.feed!.documentID;
        } else {
          _feed = "";
        }
      }
      if (state is ProfileFormInitialized) {
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
                validator: (_) =>
                    state is DocumentIDProfileFormError ? state.message : null,
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
                    state is AppIdProfileFormError ? state.message : null,
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
                validator: (_) =>
                    state is DescriptionProfileFormError ? state.message : null,
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
                        if (state is ProfileFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<ProfileListBloc>(context)
                                .add(UpdateProfileList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              feed: state.value!.feed,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<ProfileListBloc>(context)
                                .add(AddProfileList(
                                    value: ProfileModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              feed: state.value!.feed,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
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
        .add(ChangedProfileDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedProfileAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc
        .add(ChangedProfileDescription(value: _descriptionController.text));
  }

  void _onFeedSelected(String? val) {
    setState(() {
      _feed = val;
    });
    _myFormBloc.add(ChangedProfileFeed(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, ProfileFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
