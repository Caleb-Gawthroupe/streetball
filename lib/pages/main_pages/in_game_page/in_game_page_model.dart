import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/confirm_force_start_widget.dart';
import '/components/player_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'in_game_page_widget.dart' show InGamePageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InGamePageModel extends FlutterFlowModel<InGamePageWidget> {
  ///  Local state fields for this page.

  bool hasShownStartPopup = false;

  bool scoreSubmitted = false;

  bool hasUpdatedRank = false;

  bool downloadedNewRank = false;

  bool allPlayersReady = false;

  bool isHost = false;

  bool hasPushedExpectedResult = false;

  bool hasVoted = false;

  ///  State fields for stateful widgets in this page.

  GamesRecord? inGamePagePreviousSnapshot;
  InstantTimer? checkDownloads;
  // Models for playerCard dynamic component.
  late FlutterFlowDynamicModels<PlayerCardModel> playerCardModels1;
  // Models for playerCard dynamic component.
  late FlutterFlowDynamicModels<PlayerCardModel> playerCardModels2;
  // State field(s) for team1score widget.
  FocusNode? team1scoreFocusNode;
  TextEditingController? team1scoreTextController;
  String? Function(BuildContext, String?)? team1scoreTextControllerValidator;
  // State field(s) for team2score widget.
  FocusNode? team2scoreFocusNode;
  TextEditingController? team2scoreTextController;
  String? Function(BuildContext, String?)? team2scoreTextControllerValidator;
  List<UsersRecord>? allUserDataPreviousSnapshot;
  // Stores action output result for [Custom Action - areAllUsersReady] action in allUserData widget.
  bool? areAllReady;

  @override
  void initState(BuildContext context) {
    playerCardModels1 = FlutterFlowDynamicModels(() => PlayerCardModel());
    playerCardModels2 = FlutterFlowDynamicModels(() => PlayerCardModel());
  }

  @override
  void dispose() {
    checkDownloads?.cancel();
    playerCardModels1.dispose();
    playerCardModels2.dispose();
    team1scoreFocusNode?.dispose();
    team1scoreTextController?.dispose();

    team2scoreFocusNode?.dispose();
    team2scoreTextController?.dispose();
  }
}
