import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'email_change_widget.dart' show EmailChangeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmailChangeModel extends FlutterFlowModel<EmailChangeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailEntry widget.
  FocusNode? emailEntryFocusNode;
  TextEditingController? emailEntryTextController;
  String? Function(BuildContext, String?)? emailEntryTextControllerValidator;
  // State field(s) for confirmEntry widget.
  FocusNode? confirmEntryFocusNode;
  TextEditingController? confirmEntryTextController;
  String? Function(BuildContext, String?)? confirmEntryTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailEntryFocusNode?.dispose();
    emailEntryTextController?.dispose();

    confirmEntryFocusNode?.dispose();
    confirmEntryTextController?.dispose();
  }
}
