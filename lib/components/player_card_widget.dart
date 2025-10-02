import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'player_card_model.dart';
export 'player_card_model.dart';

class PlayerCardWidget extends StatefulWidget {
  const PlayerCardWidget({
    super.key,
    required this.userDoc,
    required this.game,
  });

  final UsersRecord? userDoc;
  final DocumentReference? game;

  @override
  State<PlayerCardWidget> createState() => _PlayerCardWidgetState();
}

class _PlayerCardWidgetState extends State<PlayerCardWidget> {
  late PlayerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              height: 40.0,
              constraints: BoxConstraints(
                minWidth: 0.0,
                minHeight: 40.0,
                maxWidth: 125.0,
                maxHeight: 40.0,
              ),
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: AutoSizeText(
                  valueOrDefault<String>(
                    widget!.userDoc?.displayName,
                    'Name',
                  ),
                  textAlign: TextAlign.center,
                  minFontSize: 4.0,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.sairaSemiCondensed(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          (bool isReady, String vote) {
                            return (isReady || vote != "");
                          }(widget!.userDoc!.isReady, widget!.userDoc!.vote)
                              ? FlutterFlowTheme.of(context).accent3
                              : FlutterFlowTheme.of(context).secondary,
                          FlutterFlowTheme.of(context).secondary,
                        ),
                        fontSize: 22.0,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      () {
                        if (widget!.userDoc!.rank < 200) {
                          return FFAppConstants.rankIcons.firstOrNull!;
                        } else if (199 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 300) {
                          return FFAppConstants.rankIcons.elementAtOrNull(1)!;
                        } else if (299 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 400) {
                          return FFAppConstants.rankIcons.elementAtOrNull(2)!;
                        } else if (399 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 500) {
                          return FFAppConstants.rankIcons.elementAtOrNull(3)!;
                        } else if (499 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 600) {
                          return FFAppConstants.rankIcons.elementAtOrNull(4)!;
                        } else if (599 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 700) {
                          return FFAppConstants.rankIcons.elementAtOrNull(5)!;
                        } else if (699 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 800) {
                          return FFAppConstants.rankIcons.elementAtOrNull(6)!;
                        } else if (799 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 900) {
                          return FFAppConstants.rankIcons.elementAtOrNull(7)!;
                        } else if (899 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1000) {
                          return FFAppConstants.rankIcons.elementAtOrNull(8)!;
                        } else if (999 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1100) {
                          return FFAppConstants.rankIcons.elementAtOrNull(9)!;
                        } else if (1099 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1200) {
                          return FFAppConstants.rankIcons.elementAtOrNull(10)!;
                        } else if (1199 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1300) {
                          return FFAppConstants.rankIcons.elementAtOrNull(11)!;
                        } else if (1299 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1400) {
                          return FFAppConstants.rankIcons.elementAtOrNull(12)!;
                        } else if (1399 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1500) {
                          return FFAppConstants.rankIcons.elementAtOrNull(13)!;
                        } else if (1499 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1600) {
                          return FFAppConstants.rankIcons.elementAtOrNull(14)!;
                        } else if (1599 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1700) {
                          return FFAppConstants.rankIcons.elementAtOrNull(15)!;
                        } else if (1699 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1800) {
                          return FFAppConstants.rankIcons.elementAtOrNull(16)!;
                        } else if (1799 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 1900) {
                          return FFAppConstants.rankIcons.elementAtOrNull(17)!;
                        } else if (1899 < widget!.userDoc!.rank &&
                            widget!.userDoc!.rank < 2000) {
                          return FFAppConstants.rankIcons.elementAtOrNull(18)!;
                        } else {
                          return FFAppConstants.rankIcons.lastOrNull!;
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
                    (bool isReady, String vote) {
                      return (isReady || vote != "");
                    }(widget!.userDoc!.isReady, widget!.userDoc!.vote)
                        ? FlutterFlowTheme.of(context).accent3
                        : FlutterFlowTheme.of(context).secondary,
                    FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: AutoSizeText(
                  '${valueOrDefault<String>(
                    widget!.userDoc?.rank?.toString(),
                    'Rank',
                  )} SR',
                  minFontSize: 4.0,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.sairaSemiCondensed(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          (bool isReady, String vote) {
                            return (isReady || vote != "");
                          }(widget!.userDoc!.isReady, widget!.userDoc!.vote)
                              ? FlutterFlowTheme.of(context).accent3
                              : FlutterFlowTheme.of(context).secondary,
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
            ],
          ),
        ],
      ),
    );
  }
}
