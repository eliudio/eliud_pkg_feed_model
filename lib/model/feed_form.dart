/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 feed_form.dart
                       
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

import 'package:eliud_pkg_feed_model/model/feed_list_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_list_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_model.dart';
import 'package:eliud_pkg_feed_model/model/feed_form_bloc.dart';
import 'package:eliud_pkg_feed_model/model/feed_form_event.dart';
import 'package:eliud_pkg_feed_model/model/feed_form_state.dart';

class FeedForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final FeedModel? value;
  final ActionModel? submitAction;

  FeedForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the FeedForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<FeedFormBloc>(
        create: (context) => FeedFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedFormEvent(value: value)),
        child: _MyFeedForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<FeedFormBloc>(
        create: (context) => FeedFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseFeedFormNoLoadEvent(value: value)),
        child: _MyFeedForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Feed'
                      : 'Add Feed'),
          body: BlocProvider<FeedFormBloc>(
            create: (context) => FeedFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseFeedFormEvent(value: value)
                : InitialiseNewFeedFormEvent())),
            child: _MyFeedForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyFeedForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyFeedForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyFeedForm> createState() => _MyFeedFormState(formAction);
}

class _MyFeedFormState extends State<_MyFeedForm> {
  final FormAction? formAction;
  late FeedFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _thumbImageSelectedRadioTile;
  bool? _photoPostSelection;
  bool? _videoPostSelection;
  bool? _messagePostSelection;
  bool? _audioPostSelection;
  bool? _albumPostSelection;
  bool? _articlePostSelection;

  _MyFeedFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<FeedFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _thumbImageSelectedRadioTile = 0;
    _photoPostSelection = false;
    _videoPostSelection = false;
    _messagePostSelection = false;
    _audioPostSelection = false;
    _albumPostSelection = false;
    _articlePostSelection = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedFormBloc, FeedFormState>(builder: (context, state) {
      if (state is FeedFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is FeedFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.thumbImage != null) {
          _thumbImageSelectedRadioTile = state.value!.thumbImage!.index;
        } else {
          _thumbImageSelectedRadioTile = 0;
        }
        if (state.value!.photoPost != null) {
          _photoPostSelection = state.value!.photoPost;
        } else {
          _photoPostSelection = false;
        }
        if (state.value!.videoPost != null) {
          _videoPostSelection = state.value!.videoPost;
        } else {
          _videoPostSelection = false;
        }
        if (state.value!.messagePost != null) {
          _messagePostSelection = state.value!.messagePost;
        } else {
          _messagePostSelection = false;
        }
        if (state.value!.audioPost != null) {
          _audioPostSelection = state.value!.audioPost;
        } else {
          _audioPostSelection = false;
        }
        if (state.value!.albumPost != null) {
          _albumPostSelection = state.value!.albumPost;
        } else {
          _albumPostSelection = false;
        }
        if (state.value!.articlePost != null) {
          _articlePostSelection = state.value!.articlePost;
        } else {
          _articlePostSelection = false;
        }
      }
      if (state is FeedFormInitialized) {
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
                _thumbImageSelectedRadioTile,
                'thumbs',
                'thumbs',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionThumbImage(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _thumbImageSelectedRadioTile,
                'banana',
                'banana',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionThumbImage(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Photo Post',
                _photoPostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionPhotoPost(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Video Post',
                _videoPostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionVideoPost(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Message Post',
                _messagePostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionMessagePost(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Audio Post',
                _audioPostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionAudioPost(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Album Post',
                _albumPostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionAlbumPost(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Article Post',
                _articlePostSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionArticlePost(val)));

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
                    state is DocumentIDFeedFormError ? state.message : null,
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
                    state is AppIdFeedFormError ? state.message : null,
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
                    state is DescriptionFeedFormError ? state.message : null,
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
                        if (state is FeedFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<FeedListBloc>(context)
                                .add(UpdateFeedList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              thumbImage: state.value!.thumbImage,
                              photoPost: state.value!.photoPost,
                              videoPost: state.value!.videoPost,
                              messagePost: state.value!.messagePost,
                              audioPost: state.value!.audioPost,
                              albumPost: state.value!.albumPost,
                              articlePost: state.value!.articlePost,
                            )));
                          } else {
                            BlocProvider.of<FeedListBloc>(context)
                                .add(AddFeedList(
                                    value: FeedModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              thumbImage: state.value!.thumbImage,
                              photoPost: state.value!.photoPost,
                              videoPost: state.value!.videoPost,
                              messagePost: state.value!.messagePost,
                              audioPost: state.value!.audioPost,
                              albumPost: state.value!.albumPost,
                              articlePost: state.value!.articlePost,
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
    _myFormBloc.add(ChangedFeedDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc.add(ChangedFeedAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedFeedDescription(value: _descriptionController.text));
  }

  void setSelectionThumbImage(int? val) {
    setState(() {
      _thumbImageSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedFeedThumbImage(value: toThumbStyle(val)));
  }

  void setSelectionPhotoPost(bool? val) {
    setState(() {
      _photoPostSelection = val;
    });
    _myFormBloc.add(ChangedFeedPhotoPost(value: val));
  }

  void setSelectionVideoPost(bool? val) {
    setState(() {
      _videoPostSelection = val;
    });
    _myFormBloc.add(ChangedFeedVideoPost(value: val));
  }

  void setSelectionMessagePost(bool? val) {
    setState(() {
      _messagePostSelection = val;
    });
    _myFormBloc.add(ChangedFeedMessagePost(value: val));
  }

  void setSelectionAudioPost(bool? val) {
    setState(() {
      _audioPostSelection = val;
    });
    _myFormBloc.add(ChangedFeedAudioPost(value: val));
  }

  void setSelectionAlbumPost(bool? val) {
    setState(() {
      _albumPostSelection = val;
    });
    _myFormBloc.add(ChangedFeedAlbumPost(value: val));
  }

  void setSelectionArticlePost(bool? val) {
    setState(() {
      _articlePostSelection = val;
    });
    _myFormBloc.add(ChangedFeedArticlePost(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, FeedFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
