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
import 'friend_profile_model.dart';
export 'friend_profile_model.dart';

class FriendProfileWidget extends StatefulWidget {
  const FriendProfileWidget({
    super.key,
    required this.uid,
  });

  final UsersRecord? uid;

  static String routeName = 'FriendProfile';
  static String routePath = '/friendProfile';

  @override
  State<FriendProfileWidget> createState() => _FriendProfileWidgetState();
}

class _FriendProfileWidgetState extends State<FriendProfileWidget>
    with TickerProviderStateMixin {
  late FriendProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendProfileModel());

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 5.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          FriendsPageWidget.routeName,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.topToBottom,
                              duration: Duration(milliseconds: 250),
                            ),
                          },
                        );
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
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget!.uid?.displayName,
                                      'Name',
                                    ),
                                    textAlign: TextAlign.center,
                                    minFontSize: 4.0,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.sairaSemiCondensed(
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        () {
                                          if (widget!.uid!.rank < 200) {
                                            return FFAppConstants
                                                .rankIcons.firstOrNull!;
                                          } else if (199 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 300) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(1)!;
                                          } else if (299 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 400) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(2)!;
                                          } else if (399 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 500) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(3)!;
                                          } else if (499 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 600) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(4)!;
                                          } else if (599 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 700) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(5)!;
                                          } else if (699 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 800) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(6)!;
                                          } else if (799 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 900) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(7)!;
                                          } else if (899 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1000) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(8)!;
                                          } else if (999 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1100) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(9)!;
                                          } else if (1099 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1200) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(10)!;
                                          } else if (1199 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1300) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(11)!;
                                          } else if (1299 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1400) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(12)!;
                                          } else if (1399 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1500) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(13)!;
                                          } else if (1499 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1600) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(14)!;
                                          } else if (1599 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1700) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(15)!;
                                          } else if (1699 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1800) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(16)!;
                                          } else if (1799 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 1900) {
                                            return FFAppConstants.rankIcons
                                                .elementAtOrNull(17)!;
                                          } else if (1899 < widget!.uid!.rank &&
                                              widget!.uid!.rank < 2000) {
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: AutoSizeText(
                                    '${widget!.uid?.rank?.toString()} SR',
                                    minFontSize: 4.0,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          font: GoogleFonts.sairaSemiCondensed(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
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
                                Text(
                                  '${widget!.uid?.rep?.toString()} Reputation',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.sairaSemiCondensed(
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
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
                      parent: widget!.uid?.reference,
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
                      List<MatchHistoryRecord> containerMatchHistoryRecordList =
                          snapshot.data!;

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
                          parent: widget!.uid?.reference,
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
                              listViewMatchHistoryRecordList = snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewMatchHistoryRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 20.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewMatchHistoryRecord =
                                  listViewMatchHistoryRecordList[listViewIndex];
                              return GameBoxWidget(
                                key: Key(
                                    'Key2fu_${listViewIndex}_of_${listViewMatchHistoryRecordList.length}'),
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
    );
  }
}
