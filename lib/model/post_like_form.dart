/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_like_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/post_like_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_like_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_like_model.dart';
import 'package:eliud_pkg_feed_model/model/post_like_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_like_form_event.dart';
import 'package:eliud_pkg_feed_model/model/post_like_form_state.dart';

class PostLikeForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PostLikeModel? value;
  final ActionModel? submitAction;

  PostLikeForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PostLikeForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PostLikeFormBloc>(
        create: (context) => PostLikeFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostLikeFormEvent(value: value)),
        child: _MyPostLikeForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PostLikeFormBloc>(
        create: (context) => PostLikeFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostLikeFormNoLoadEvent(value: value)),
        child: _MyPostLikeForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update PostLike'
                      : 'Add PostLike'),
          body: BlocProvider<PostLikeFormBloc>(
            create: (context) => PostLikeFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePostLikeFormEvent(value: value)
                : InitialiseNewPostLikeFormEvent())),
            child: _MyPostLikeForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPostLikeForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPostLikeForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPostLikeForm> createState() => _MyPostLikeFormState(formAction);
}

class _MyPostLikeFormState extends State<_MyPostLikeForm> {
  final FormAction? formAction;
  late PostLikeFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _postIdController = TextEditingController();
  final TextEditingController _postCommentIdController =
      TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  int? _likeTypeSelectedRadioTile;

  _MyPostLikeFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PostLikeFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _postIdController.addListener(_onPostIdChanged);
    _postCommentIdController.addListener(_onPostCommentIdChanged);
    _memberIdController.addListener(_onMemberIdChanged);
    _appIdController.addListener(_onAppIdChanged);
    _likeTypeSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostLikeFormBloc, PostLikeFormState>(
        builder: (context, state) {
      if (state is PostLikeFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PostLikeFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _postIdController.text = state.value!.postId.toString();
        _postCommentIdController.text = state.value!.postCommentId.toString();
        _memberIdController.text = state.value!.memberId.toString();
        _appIdController.text = state.value!.appId.toString();
        if (state.value!.likeType != null) {
          _likeTypeSelectedRadioTile = state.value!.likeType!.index;
        } else {
          _likeTypeSelectedRadioTile = 0;
        }
      }
      if (state is PostLikeFormInitialized) {
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
            .radioListTile(
                widget.app,
                context,
                0,
                _likeTypeSelectedRadioTile,
                'like',
                'like',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionLikeType(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _likeTypeSelectedRadioTile,
                'dislike',
                'dislike',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionLikeType(val)));

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
                    state is DocumentIDPostLikeFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID of the post',
                icon: Icons.vpn_key,
                readOnly: _readOnly(context, state),
                textEditingController: _postIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PostIdPostLikeFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText:
                    'Document ID of the comment (in case of a like on a comment)',
                icon: Icons.vpn_key,
                readOnly: _readOnly(context, state),
                textEditingController: _postCommentIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is PostCommentIdPostLikeFormError
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
                    state is AppIdPostLikeFormError ? state.message : null,
                hintText: 'field.remark'));

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
                .groupTitle(widget.app, context, 'Member')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Member',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _memberIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is MemberIdPostLikeFormError ? state.message : null,
                hintText: null));

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
                        if (state is PostLikeFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PostLikeListBloc>(context)
                                .add(UpdatePostLikeList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              postId: state.value!.postId,
                              postCommentId: state.value!.postCommentId,
                              memberId: state.value!.memberId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              likeType: state.value!.likeType,
                            )));
                          } else {
                            BlocProvider.of<PostLikeListBloc>(context)
                                .add(AddPostLikeList(
                                    value: PostLikeModel(
                              documentID: state.value!.documentID,
                              postId: state.value!.postId,
                              postCommentId: state.value!.postCommentId,
                              memberId: state.value!.memberId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              likeType: state.value!.likeType,
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
        .add(ChangedPostLikeDocumentID(value: _documentIDController.text));
  }

  void _onPostIdChanged() {
    _myFormBloc.add(ChangedPostLikePostId(value: _postIdController.text));
  }

  void _onPostCommentIdChanged() {
    _myFormBloc.add(
        ChangedPostLikePostCommentId(value: _postCommentIdController.text));
  }

  void _onMemberIdChanged() {
    _myFormBloc.add(ChangedPostLikeMemberId(value: _memberIdController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPostLikeAppId(value: _appIdController.text));
  }

  void setSelectionLikeType(int? val) {
    setState(() {
      _likeTypeSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPostLikeLikeType(value: toLikeType(val)));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _postIdController.dispose();
    _postCommentIdController.dispose();
    _memberIdController.dispose();
    _appIdController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, PostLikeFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
