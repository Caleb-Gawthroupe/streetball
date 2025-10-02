import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friend_bar_model.dart';
export 'friend_bar_model.dart';

class FriendBarWidget extends StatefulWidget {
  const FriendBarWidget({
    super.key,
    required this.user,
  });

  final UsersRecord? user;

  @override
  State<FriendBarWidget> createState() => _FriendBarWidgetState();
}

class _FriendBarWidgetState extends State<FriendBarWidget> {
  late FriendBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 400.0,
        height: 80.0,
        constraints: BoxConstraints(
          minWidth: 300.0,
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).tertiary,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    height: 50.0,
                    constraints: BoxConstraints(
                      minWidth: 140.0,
                      maxWidth: 160.0,
                    ),
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: AutoSizeText(
                      valueOrDefault<String>(
                        widget!.user?.displayName,
                        'Name',
                      ),
                      textAlign: TextAlign.center,
                      minFontSize: 4.0,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                font: GoogleFonts.sairaSemiCondensed(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: valueOrDefault<Color>(
                                  (String currentGameID) {
                                    return currentGameID == "";
                                  }(widget!.user!.currentGameID)
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).accent3,
                                  FlutterFlowTheme.of(context).secondary,
                                ),
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: 140.0,
                    maxWidth: 280.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  () {
                                    if (widget!.user!.rank < 200) {
                                      return FFAppConstants
                                          .rankIcons.firstOrNull!;
                                    } else if (199 < widget!.user!.rank &&
                                        widget!.user!.rank < 300) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(1)!;
                                    } else if (299 < widget!.user!.rank &&
                                        widget!.user!.rank < 400) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(2)!;
                                    } else if (399 < widget!.user!.rank &&
                                        widget!.user!.rank < 500) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(3)!;
                                    } else if (499 < widget!.user!.rank &&
                                        widget!.user!.rank < 600) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(4)!;
                                    } else if (599 < widget!.user!.rank &&
                                        widget!.user!.rank < 700) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(5)!;
                                    } else if (699 < widget!.user!.rank &&
                                        widget!.user!.rank < 800) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(6)!;
                                    } else if (799 < widget!.user!.rank &&
                                        widget!.user!.rank < 900) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(7)!;
                                    } else if (899 < widget!.user!.rank &&
                                        widget!.user!.rank < 1000) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(8)!;
                                    } else if (999 < widget!.user!.rank &&
                                        widget!.user!.rank < 1100) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(9)!;
                                    } else if (1099 < widget!.user!.rank &&
                                        widget!.user!.rank < 1200) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(10)!;
                                    } else if (1199 < widget!.user!.rank &&
                                        widget!.user!.rank < 1300) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(11)!;
                                    } else if (1299 < widget!.user!.rank &&
                                        widget!.user!.rank < 1400) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(12)!;
                                    } else if (1399 < widget!.user!.rank &&
                                        widget!.user!.rank < 1500) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(13)!;
                                    } else if (1499 < widget!.user!.rank &&
                                        widget!.user!.rank < 1600) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(14)!;
                                    } else if (1599 < widget!.user!.rank &&
                                        widget!.user!.rank < 1700) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(15)!;
                                    } else if (1699 < widget!.user!.rank &&
                                        widget!.user!.rank < 1800) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(16)!;
                                    } else if (1799 < widget!.user!.rank &&
                                        widget!.user!.rank < 1900) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(17)!;
                                    } else if (1899 < widget!.user!.rank &&
                                        widget!.user!.rank < 2000) {
                                      return FFAppConstants.rankIcons
                                          .elementAtOrNull(18)!;
                                    } else {
                                      return FFAppConstants
                                          .rankIcons.lastOrNull!;
                                    }
                                  }(),
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 28.0,
                            child: VerticalDivider(
                              thickness: 3.0,
                              color: valueOrDefault<Color>(
                                (String currentGameID) {
                                  return currentGameID == "";
                                }(widget!.user!.currentGameID)
                                    ? FlutterFlowTheme.of(context).secondary
                                    : FlutterFlowTheme.of(context).accent3,
                                FlutterFlowTheme.of(context).secondary,
                              ),
                            ),
                          ),
                          Container(
                            height: 40.0,
                            constraints: BoxConstraints(
                              minWidth: 40.0,
                              maxWidth: 80.0,
                            ),
                            decoration: BoxDecoration(),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 5.0, 0.0),
                              child: AutoSizeText(
                                '${widget!.user?.rank?.toString()} SR',
                                minFontSize: 4.0,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.sairaSemiCondensed(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: valueOrDefault<Color>(
                                        (String currentGameID) {
                                          return currentGameID == "";
                                        }(widget!.user!.currentGameID)
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .accent3,
                                        FlutterFlowTheme.of(context).secondary,
                                      ),
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
