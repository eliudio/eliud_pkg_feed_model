/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_profile_form.dart
                       
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

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_model/model/embedded_component.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/member_profile_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_list_event.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_model.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_form_event.dart';
import 'package:eliud_pkg_feed_model/model/member_profile_form_state.dart';

class MemberProfileForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MemberProfileModel? value;
  final ActionModel? submitAction;

  MemberProfileForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MemberProfileForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MemberProfileFormBloc>(
        create: (context) => MemberProfileFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberProfileFormEvent(value: value)),
        child: _MyMemberProfileForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MemberProfileFormBloc>(
        create: (context) => MemberProfileFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMemberProfileFormNoLoadEvent(value: value)),
        child: _MyMemberProfileForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MemberProfile'
                      : 'Add MemberProfile'),
          body: BlocProvider<MemberProfileFormBloc>(
            create: (context) => MemberProfileFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMemberProfileFormEvent(value: value)
                : InitialiseNewMemberProfileFormEvent())),
            child: _MyMemberProfileForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMemberProfileForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMemberProfileForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMemberProfileForm> createState() =>
      _MyMemberProfileFormState(formAction);
}

class _MyMemberProfileFormState extends State<_MyMemberProfileForm> {
  final FormAction? formAction;
  late MemberProfileFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _feedIdController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _profileController = TextEditingController();
  String? _profileBackground;
  final TextEditingController _profileOverrideController =
      TextEditingController();
  final TextEditingController _nameOverrideController = TextEditingController();
  int? _accessibleByGroupSelectedRadioTile;

  _MyMemberProfileFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MemberProfileFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _feedIdController.addListener(_onFeedIdChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _profileController.addListener(_onProfileChanged);
    _profileOverrideController.addListener(_onProfileOverrideChanged);
    _nameOverrideController.addListener(_onNameOverrideChanged);
    _accessibleByGroupSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberProfileFormBloc, MemberProfileFormState>(
        builder: (context, state) {
      if (state is MemberProfileFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MemberProfileFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _feedIdController.text = state.value!.feedId.toString();
        _authorIdController.text = state.value!.authorId.toString();
        _profileController.text = state.value!.profile.toString();
        if (state.value!.profileBackground != null) {
          _profileBackground = state.value!.profileBackground!.documentID;
        } else {
          _profileBackground = "";
        }
        _profileOverrideController.text =
            state.value!.profileOverride.toString();
        _nameOverrideController.text = state.value!.nameOverride.toString();
        if (state.value!.accessibleByGroup != null) {
          _accessibleByGroupSelectedRadioTile =
              state.value!.accessibleByGroup!.index;
        } else {
          _accessibleByGroupSelectedRadioTile = 0;
        }
      }
      if (state is MemberProfileFormInitialized) {
        List<Widget> children = [];
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
                labelText: 'Author ID',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _authorIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AuthorIdMemberProfileFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "memberMediums",
              value: _profileBackground,
              trigger: (value, privilegeLevel) =>
                  _onProfileBackgroundSelected(value),
              optional: true),
        );

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Profile Override',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _profileOverrideController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ProfileOverrideMemberProfileFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'public',
                'public',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'followers',
                'followers',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'me',
                'me',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _accessibleByGroupSelectedRadioTile,
                'specificMembers',
                'specificMembers',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAccessibleByGroup(val)));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: memberMediumContainersList(widget.app, context,
                state.value!.memberMedia, _onMemberMediaChanged)));

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
                validator: (_) => state is DocumentIDMemberProfileFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Feed Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _feedIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is FeedIdMemberProfileFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Profile',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _profileController,
                keyboardType: TextInputType.text,
                validator: (_) => state is ProfileMemberProfileFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name override',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _nameOverrideController,
                keyboardType: TextInputType.text,
                validator: (_) => state is NameOverrideMemberProfileFormError
                    ? state.message
                    : null,
                hintText: null));

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
                .groupTitle(widget.app, context, 'Source')));

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
                .groupTitle(widget.app, context, 'Photo')));

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
                        if (state is MemberProfileFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MemberProfileListBloc>(context)
                                .add(UpdateMemberProfileList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              feedId: state.value!.feedId,
                              authorId: state.value!.authorId,
                              profile: state.value!.profile,
                              profileBackground: state.value!.profileBackground,
                              profileOverride: state.value!.profileOverride,
                              nameOverride: state.value!.nameOverride,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
                              readAccess: state.value!.readAccess,
                              memberMedia: state.value!.memberMedia,
                            )));
                          } else {
                            BlocProvider.of<MemberProfileListBloc>(context)
                                .add(AddMemberProfileList(
                                    value: MemberProfileModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              feedId: state.value!.feedId,
                              authorId: state.value!.authorId,
                              profile: state.value!.profile,
                              profileBackground: state.value!.profileBackground,
                              profileOverride: state.value!.profileOverride,
                              nameOverride: state.value!.nameOverride,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
                              readAccess: state.value!.readAccess,
                              memberMedia: state.value!.memberMedia,
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
        .add(ChangedMemberProfileDocumentID(value: _documentIDController.text));
  }

  void _onFeedIdChanged() {
    _myFormBloc.add(ChangedMemberProfileFeedId(value: _feedIdController.text));
  }

  void _onAuthorIdChanged() {
    _myFormBloc
        .add(ChangedMemberProfileAuthorId(value: _authorIdController.text));
  }

  void _onProfileChanged() {
    _myFormBloc
        .add(ChangedMemberProfileProfile(value: _profileController.text));
  }

  void _onProfileBackgroundSelected(String? val) {
    setState(() {
      _profileBackground = val;
    });
    _myFormBloc.add(ChangedMemberProfileProfileBackground(value: val));
  }

  void _onProfileOverrideChanged() {
    _myFormBloc.add(ChangedMemberProfileProfileOverride(
        value: _profileOverrideController.text));
  }

  void _onNameOverrideChanged() {
    _myFormBloc.add(
        ChangedMemberProfileNameOverride(value: _nameOverrideController.text));
  }

  void setSelectionAccessibleByGroup(int? val) {
    setState(() {
      _accessibleByGroupSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedMemberProfileAccessibleByGroup(
        value: toMemberProfileAccessibleByGroup(val)));
  }

  void _onMemberMediaChanged(value) {
    _myFormBloc.add(ChangedMemberProfileMemberMedia(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _feedIdController.dispose();
    _authorIdController.dispose();
    _profileController.dispose();
    _profileOverrideController.dispose();
    _nameOverrideController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, MemberProfileFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
