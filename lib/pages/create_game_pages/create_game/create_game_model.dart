import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'create_game_widget.dart' show CreateGameWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateGameModel extends FlutterFlowModel<CreateGameWidget> {
  ///  Local state fields for this page.

  int? minRep;

  int? minRating;

  bool minRatingToggle = false;

  bool minRepToggle = false;

  bool isPrivate = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for minRepToggle widget.
  bool? minRepToggleValue;
  // State field(s) for minRepInput widget.
  FocusNode? minRepInputFocusNode;
  TextEditingController? minRepInputTextController;
  String? Function(BuildContext, String?)? minRepInputTextControllerValidator;
  // State field(s) for minRatingToggle widget.
  bool? minRatingToggleValue;
  // State field(s) for minRatingInput widget.
  FocusNode? minRatingInputFocusNode;
  TextEditingController? minRatingInputTextController;
  String? Function(BuildContext, String?)?
      minRatingInputTextControllerValidator;
  // State field(s) for teamSizeCount widget.
  int? teamSizeCountValue;
  // State field(s) for maxScoreCount widget.
  int? maxScoreCountValue;
  // State field(s) for winByTwoToggle widget.
  bool? winByTwoToggleValue;
  // State field(s) for privateToggle widget.
  bool? privateToggleValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for descriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    minRepInputFocusNode?.dispose();
    minRepInputTextController?.dispose();

    minRatingInputFocusNode?.dispose();
    minRatingInputTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();
  }
}
