import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/game_box_widget.dart';
import '/components/rank_graph_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget>
    with TickerProviderStateMixin {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, -30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 5.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.settings_sharp,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pushNamed(SettingsWidget.routeName);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        width: 350.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
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
                                    maxWidth: 150.0,
                                    maxHeight: 40.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => AutoSizeText(
                                        currentUserDisplayName,
                                        textAlign: TextAlign.center,
                                        minFontSize: 4.0,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts
                                                  .sairaSemiCondensed(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            () {
                                              if (valueOrDefault(
                                                      currentUserDocument?.rank,
                                                      0) <
                                                  200) {
                                                return FFAppConstants
                                                    .rankIcons.firstOrNull!;
                                              } else if (199 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      300) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(1)!;
                                              } else if (299 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      400) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(2)!;
                                              } else if (399 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      500) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(3)!;
                                              } else if (499 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      600) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(4)!;
                                              } else if (599 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      700) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(5)!;
                                              } else if (699 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      800) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(6)!;
                                              } else if (799 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      900) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(7)!;
                                              } else if (899 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1000) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(8)!;
                                              } else if (999 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1100) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(9)!;
                                              } else if (1099 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1200) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(10)!;
                                              } else if (1199 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1300) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(11)!;
                                              } else if (1299 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1400) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(12)!;
                                              } else if (1399 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1500) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(13)!;
                                              } else if (1499 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1600) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(14)!;
                                              } else if (1599 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1700) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(15)!;
                                              } else if (1699 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1800) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(16)!;
                                              } else if (1799 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) <
                                                      1900) {
                                                return FFAppConstants.rankIcons
                                                    .elementAtOrNull(17)!;
                                              } else if (1899 <
                                                      valueOrDefault(
                                                          currentUserDocument?.rank,
                                                          0) &&
                                                  valueOrDefault(currentUserDocument?.rank, 0) < 2000) {
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
                                  ),
                                  SizedBox(
                                    height: 28.0,
                                    child: VerticalDivider(
                                      thickness: 3.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => AutoSizeText(
                                        '${valueOrDefault(currentUserDocument?.rank, 0).toString()} SR',
                                        minFontSize: 4.0,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: GoogleFonts
                                                  .sairaSemiCondensed(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 15.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 350.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).tertiary,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      '${valueOrDefault(currentUserDocument?.rep, 0).toString()} Reputation',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font:
                                                GoogleFonts.sairaSemiCondensed(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: StreamBuilder<List<MatchHistoryRecord>>(
                      stream: queryMatchHistoryRecord(
                        parent: currentUserReference,
                        queryBuilder: (matchHistoryRecord) =>
                            matchHistoryRecord.orderBy('timestamp'),
                        limit: 25,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<MatchHistoryRecord>
                            containerMatchHistoryRecordList = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.rankGraphModel,
                            updateCallback: () => safeSetState(() {}),
                            child: RankGraphWidget(
                              matchHistory: containerMatchHistoryRecordList,
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!);
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Container(
                        width: 350.0,
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<MatchHistoryRecord>>(
                          stream: queryMatchHistoryRecord(
                            parent: currentUserReference,
                            queryBuilder: (matchHistoryRecord) =>
                                matchHistoryRecord.orderBy('timestamp',
                                    descending: true),
                            limit: 25,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<MatchHistoryRecord>
                                listViewMatchHistoryRecordList = snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewMatchHistoryRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 20.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewMatchHistoryRecord =
                                    listViewMatchHistoryRecordList[
                                        listViewIndex];
                                return GameBoxWidget(
                                  key: Key(
                                      'Keyvoq_${listViewIndex}_of_${listViewMatchHistoryRecordList.length}'),
                                  gameData: listViewMatchHistoryRecord,
                                );
                              },
                            );
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
