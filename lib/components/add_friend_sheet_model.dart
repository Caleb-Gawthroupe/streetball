import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/incoming_request_widget.dart';
import '/components/user_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'add_friend_sheet_widget.dart' show AddFriendSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddFriendSheetModel extends FlutterFlowModel<AddFriendSheetWidget> {
  ///  Local state fields for this component.

  String? searchQuery;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - hasPendingFriendRequests] action in AddFriendSheet widget.
  bool? hasPendingRequests;
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
