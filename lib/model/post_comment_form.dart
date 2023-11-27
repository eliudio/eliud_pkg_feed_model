/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_comment_form.dart
                       
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

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/embedded_component.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/post_comment_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_model.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_form_event.dart';
import 'package:eliud_pkg_feed_model/model/post_comment_form_state.dart';

class PostCommentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PostCommentModel? value;
  final ActionModel? submitAction;

  PostCommentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PostCommentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PostCommentFormBloc>(
        create: (context) => PostCommentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostCommentFormEvent(value: value)),
        child: _MyPostCommentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PostCommentFormBloc>(
        create: (context) => PostCommentFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostCommentFormNoLoadEvent(value: value)),
        child: _MyPostCommentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update PostComment'
                      : 'Add PostComment'),
          body: BlocProvider<PostCommentFormBloc>(
            create: (context) => PostCommentFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePostCommentFormEvent(value: value)
                : InitialiseNewPostCommentFormEvent())),
            child: _MyPostCommentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPostCommentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPostCommentForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPostCommentForm> createState() =>
      _MyPostCommentFormState(formAction);
}

class _MyPostCommentFormState extends State<_MyPostCommentForm> {
  final FormAction? formAction;
  late PostCommentFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _postIdController = TextEditingController();
  final TextEditingController _postCommentIdController =
      TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _likesController = TextEditingController();
  final TextEditingController _dislikesController = TextEditingController();

  _MyPostCommentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PostCommentFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _postIdController.addListener(_onPostIdChanged);
    _postCommentIdController.addListener(_onPostCommentIdChanged);
    _memberIdController.addListener(_onMemberIdChanged);
    _appIdController.addListener(_onAppIdChanged);
    _commentController.addListener(_onCommentChanged);
    _likesController.addListener(_onLikesChanged);
    _dislikesController.addListener(_onDislikesChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCommentFormBloc, PostCommentFormState>(
        builder: (context, state) {
      if (state is PostCommentFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PostCommentFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _postIdController.text = state.value!.postId.toString();
        _postCommentIdController.text = state.value!.postCommentId.toString();
        _memberIdController.text = state.value!.memberId.toString();
        _appIdController.text = state.value!.appId.toString();
        _commentController.text = state.value!.comment.toString();
        _likesController.text = state.value!.likes.toString();
        _dislikesController.text = state.value!.dislikes.toString();
      }
      if (state is PostCommentFormInitialized) {
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
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DocumentIDPostCommentFormError
                    ? state.message
                    : null,
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
                    state is PostIdPostCommentFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText:
                    'Document ID of the comment (in case of a comment on comment)',
                icon: Icons.vpn_key,
                readOnly: _readOnly(context, state),
                textEditingController: _postCommentIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is PostCommentIdPostCommentFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Member',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _memberIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is MemberIdPostCommentFormError
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
                    state is AppIdPostCommentFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Comment',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _commentController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is CommentPostCommentFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Likes',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _likesController,
                keyboardType: TextInputType.number,
                validator: (_) =>
                    state is LikesPostCommentFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Dislikes',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _dislikesController,
                keyboardType: TextInputType.number,
                validator: (_) => state is DislikesPostCommentFormError
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
                .groupTitle(widget.app, context, 'Member')));

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
                .groupTitle(widget.app, context, 'Media')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: memberMediumsList(widget.app, context,
                state.value!.memberMedia, _onMemberMediaChanged)));

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
                        if (state is PostCommentFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PostCommentListBloc>(context)
                                .add(UpdatePostCommentList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              postId: state.value!.postId,
                              postCommentId: state.value!.postCommentId,
                              memberId: state.value!.memberId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              comment: state.value!.comment,
                              likes: state.value!.likes,
                              dislikes: state.value!.dislikes,
                              memberMedia: state.value!.memberMedia,
                            )));
                          } else {
                            BlocProvider.of<PostCommentListBloc>(context)
                                .add(AddPostCommentList(
                                    value: PostCommentModel(
                              documentID: state.value!.documentID,
                              postId: state.value!.postId,
                              postCommentId: state.value!.postCommentId,
                              memberId: state.value!.memberId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              comment: state.value!.comment,
                              likes: state.value!.likes,
                              dislikes: state.value!.dislikes,
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
        .add(ChangedPostCommentDocumentID(value: _documentIDController.text));
  }

  void _onPostIdChanged() {
    _myFormBloc.add(ChangedPostCommentPostId(value: _postIdController.text));
  }

  void _onPostCommentIdChanged() {
    _myFormBloc.add(
        ChangedPostCommentPostCommentId(value: _postCommentIdController.text));
  }

  void _onMemberIdChanged() {
    _myFormBloc
        .add(ChangedPostCommentMemberId(value: _memberIdController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPostCommentAppId(value: _appIdController.text));
  }

  void _onCommentChanged() {
    _myFormBloc.add(ChangedPostCommentComment(value: _commentController.text));
  }

  void _onLikesChanged() {
    _myFormBloc.add(ChangedPostCommentLikes(value: _likesController.text));
  }

  void _onDislikesChanged() {
    _myFormBloc
        .add(ChangedPostCommentDislikes(value: _dislikesController.text));
  }

  void _onMemberMediaChanged(value) {
    _myFormBloc.add(ChangedPostCommentMemberMedia(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _postIdController.dispose();
    _postCommentIdController.dispose();
    _memberIdController.dispose();
    _appIdController.dispose();
    _commentController.dispose();
    _likesController.dispose();
    _dislikesController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, PostCommentFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
