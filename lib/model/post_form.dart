/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 post_form.dart
                       
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

import 'package:eliud_core_model/model/embedded_component.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_feed_model/model/model_export.dart';

import 'package:eliud_pkg_feed_model/model/post_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_list_event.dart';
import 'package:eliud_pkg_feed_model/model/post_model.dart';
import 'package:eliud_pkg_feed_model/model/post_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/post_form_event.dart';
import 'package:eliud_pkg_feed_model/model/post_form_state.dart';

class PostForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PostModel? value;
  final ActionModel? submitAction;

  PostForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PostForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PostFormBloc>(
        create: (context) => PostFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostFormEvent(value: value)),
        child: _MyPostForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PostFormBloc>(
        create: (context) => PostFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePostFormNoLoadEvent(value: value)),
        child: _MyPostForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Post'
                      : 'Add Post'),
          body: BlocProvider<PostFormBloc>(
            create: (context) => PostFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePostFormEvent(value: value)
                : InitialiseNewPostFormEvent())),
            child: _MyPostForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPostForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPostForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPostForm> createState() => _MyPostFormState(formAction);
}

class _MyPostFormState extends State<_MyPostForm> {
  final FormAction? formAction;
  late PostFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _feedIdController = TextEditingController();
  final TextEditingController _postAppIdController = TextEditingController();
  final TextEditingController _postPageIdController = TextEditingController();
  final TextEditingController _htmlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _likesController = TextEditingController();
  final TextEditingController _dislikesController = TextEditingController();
  int? _accessibleByGroupSelectedRadioTile;
  int? _archivedSelectedRadioTile;
  final TextEditingController _externalLinkController = TextEditingController();

  _MyPostFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PostFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _appIdController.addListener(_onAppIdChanged);
    _feedIdController.addListener(_onFeedIdChanged);
    _postAppIdController.addListener(_onPostAppIdChanged);
    _postPageIdController.addListener(_onPostPageIdChanged);
    _htmlController.addListener(_onHtmlChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _likesController.addListener(_onLikesChanged);
    _dislikesController.addListener(_onDislikesChanged);
    _accessibleByGroupSelectedRadioTile = 0;
    _archivedSelectedRadioTile = 0;
    _externalLinkController.addListener(_onExternalLinkChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostFormBloc, PostFormState>(builder: (context, state) {
      if (state is PostFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PostFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _authorIdController.text = state.value!.authorId.toString();
        _appIdController.text = state.value!.appId.toString();
        _feedIdController.text = state.value!.feedId.toString();
        _postAppIdController.text = state.value!.postAppId.toString();
        _postPageIdController.text = state.value!.postPageId.toString();
        _htmlController.text = state.value!.html.toString();
        _descriptionController.text = state.value!.description.toString();
        _likesController.text = state.value!.likes.toString();
        _dislikesController.text = state.value!.dislikes.toString();
        if (state.value!.accessibleByGroup != null) {
          _accessibleByGroupSelectedRadioTile =
              state.value!.accessibleByGroup!.index;
        } else {
          _accessibleByGroupSelectedRadioTile = 0;
        }
        if (state.value!.archived != null) {
          _archivedSelectedRadioTile = state.value!.archived!.index;
        } else {
          _archivedSelectedRadioTile = 0;
        }
        _externalLinkController.text = state.value!.externalLink.toString();
      }
      if (state is PostFormInitialized) {
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

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _archivedSelectedRadioTile,
                'active',
                'active',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionArchived(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _archivedSelectedRadioTile,
                'archived',
                'archived',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionArchived(val)));

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
                    state is DocumentIDPostFormError ? state.message : null,
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
                    state is AppIdPostFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Feed Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _feedIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is FeedIdPostFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Post App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _postAppIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PostAppIdPostFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Post Page Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _postPageIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is PostPageIdPostFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Rich Text',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _htmlController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is HtmlPostFormError ? state.message : null,
                hintText: null));

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
                    state is DescriptionPostFormError ? state.message : null,
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
                    state is LikesPostFormError ? state.message : null,
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
                validator: (_) =>
                    state is DislikesPostFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'externalLink',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _externalLinkController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is ExternalLinkPostFormError ? state.message : null,
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

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Author ID',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _authorIdController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is AuthorIdPostFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Media')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: memberMediumContainersList(widget.app, context,
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
                        if (state is PostFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PostListBloc>(context)
                                .add(UpdatePostList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              authorId: state.value!.authorId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              feedId: state.value!.feedId,
                              postAppId: state.value!.postAppId,
                              postPageId: state.value!.postPageId,
                              pageParameters: state.value!.pageParameters,
                              html: state.value!.html,
                              description: state.value!.description,
                              likes: state.value!.likes,
                              dislikes: state.value!.dislikes,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
                              readAccess: state.value!.readAccess,
                              archived: state.value!.archived,
                              externalLink: state.value!.externalLink,
                              memberMedia: state.value!.memberMedia,
                            )));
                          } else {
                            BlocProvider.of<PostListBloc>(context)
                                .add(AddPostList(
                                    value: PostModel(
                              documentID: state.value!.documentID,
                              authorId: state.value!.authorId,
                              timestamp: state.value!.timestamp,
                              appId: state.value!.appId,
                              feedId: state.value!.feedId,
                              postAppId: state.value!.postAppId,
                              postPageId: state.value!.postPageId,
                              pageParameters: state.value!.pageParameters,
                              html: state.value!.html,
                              description: state.value!.description,
                              likes: state.value!.likes,
                              dislikes: state.value!.dislikes,
                              accessibleByGroup: state.value!.accessibleByGroup,
                              accessibleByMembers:
                                  state.value!.accessibleByMembers,
                              readAccess: state.value!.readAccess,
                              archived: state.value!.archived,
                              externalLink: state.value!.externalLink,
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
    _myFormBloc.add(ChangedPostDocumentID(value: _documentIDController.text));
  }

  void _onAuthorIdChanged() {
    _myFormBloc.add(ChangedPostAuthorId(value: _authorIdController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedPostAppId(value: _appIdController.text));
  }

  void _onFeedIdChanged() {
    _myFormBloc.add(ChangedPostFeedId(value: _feedIdController.text));
  }

  void _onPostAppIdChanged() {
    _myFormBloc.add(ChangedPostPostAppId(value: _postAppIdController.text));
  }

  void _onPostPageIdChanged() {
    _myFormBloc.add(ChangedPostPostPageId(value: _postPageIdController.text));
  }

  void _onHtmlChanged() {
    _myFormBloc.add(ChangedPostHtml(value: _htmlController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedPostDescription(value: _descriptionController.text));
  }

  void _onLikesChanged() {
    _myFormBloc.add(ChangedPostLikes(value: _likesController.text));
  }

  void _onDislikesChanged() {
    _myFormBloc.add(ChangedPostDislikes(value: _dislikesController.text));
  }

  void setSelectionAccessibleByGroup(int? val) {
    setState(() {
      _accessibleByGroupSelectedRadioTile = val;
    });
    _myFormBloc
        .add(ChangedPostAccessibleByGroup(value: toPostAccessibleByGroup(val)));
  }

  void setSelectionArchived(int? val) {
    setState(() {
      _archivedSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPostArchived(value: toPostArchiveStatus(val)));
  }

  void _onExternalLinkChanged() {
    _myFormBloc
        .add(ChangedPostExternalLink(value: _externalLinkController.text));
  }

  void _onMemberMediaChanged(value) {
    _myFormBloc.add(ChangedPostMemberMedia(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _authorIdController.dispose();
    _appIdController.dispose();
    _feedIdController.dispose();
    _postAppIdController.dispose();
    _postPageIdController.dispose();
    _htmlController.dispose();
    _descriptionController.dispose();
    _likesController.dispose();
    _dislikesController.dispose();
    _externalLinkController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, PostFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
