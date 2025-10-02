import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_friend_sheet_widget.dart';
import '/components/friend_bar_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'friends_page_widget.dart' show FriendsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FriendsPageModel extends FlutterFlowModel<FriendsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for friendBar dynamic component.
  late FlutterFlowDynamicModels<FriendBarModel> friendBarModels;

  @override
  void initState(BuildContext context) {
    friendBarModels = FlutterFlowDynamicModels(() => FriendBarModel());
  }

  @override
  void dispose() {
    friendBarModels.dispose();
  }
}
