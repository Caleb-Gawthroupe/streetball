import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/game_info_sheet_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentGame = await queryGamesRecordOnce(
        queryBuilder: (gamesRecord) => gamesRecord.where(
          'players',
          arrayContains: currentUserReference?.id,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.currentGame?.players?.contains(currentUserUid) == true) {
        context.pushNamed(
          InGamePageWidget.routeName,
          queryParameters: {
            'gameID': serializeParam(
              _model.currentGame?.reference,
              ParamType.DocumentReference,
            ),
            'isHost': serializeParam(
              _model.currentGame!.hostUid == currentUserUid ? true : false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );

        await currentUserReference!.update(createUsersRecordData(
          team: 1,
        ));
      } else {
        await currentUserReference!.update(createUsersRecordData(
          isReady: false,
          vote: '',
          currentGameID: '',
          hasDownloadedNewRank: false,
        ));
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 350.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 350.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return FutureBuilder<List<GamesRecord>>(
      future: queryGamesRecordOnce(
        limit: 10,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 25.0,
                height: 25.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<GamesRecord> homePageGamesRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FlutterFlowGoogleMap(
                      controller: _model.googleMapsController,
                      onCameraIdle: (latLng) =>
                          _model.googleMapsCenter = latLng,
                      initialLocation: _model.googleMapsCenter ??=
                          currentUserLocationValue!,
                      markers: homePageGamesRecordList
                          .take(20)
                          .toList()
                          .map(
                            (marker) => FlutterFlowMarker(
                              marker.reference.path,
                              marker.location!,
                              () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: GameInfoSheetWidget(
                                          game: marker,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          )
                          .toList(),
                      markerColor: GoogleMarkerColor.magenta,
                      markerImage: MarkerImage(
                        imagePath: 'assets/images/map_pin.png',
                        isAssetImage: true,
                        size: 35.0 ?? 20,
                      ),
                      mapType: MapType.normal,
                      style: GoogleMapStyle.standard,
                      initialZoom: 16.0,
                      allowInteraction: true,
                      allowZoom: true,
                      showZoomControls: false,
                      showLocation: true,
                      showCompass: false,
                      showMapToolbar: false,
                      showTraffic: false,
                      centerMapOnMarkerTap: true,
                      mapTakesGesturePreference: false,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            25.0, 25.0, 25.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            height: 40.0,
                                            constraints: BoxConstraints(
                                              minWidth: 0.0,
                                              minHeight: 40.0,
                                              maxWidth: 150.0,
                                              maxHeight: 40.0,
                                            ),
                                            decoration: BoxDecoration(),
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    AutoSizeText(
                                                  currentUserDisplayName,
                                                  textAlign: TextAlign.center,
                                                  minFontSize: 4.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .sairaSemiCondensed(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) =>
                                                      ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      () {
                                                        if (valueOrDefault(currentUserDocument?.rank, 0) <
                                                            200) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .firstOrNull!;
                                                        } else if (199 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                300) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  1)!;
                                                        } else if (299 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                400) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  2)!;
                                                        } else if (399 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                500) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  3)!;
                                                        } else if (499 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                600) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  4)!;
                                                        } else if (599 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                700) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  5)!;
                                                        } else if (699 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                800) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  6)!;
                                                        } else if (799 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                900) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  7)!;
                                                        } else if (899 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1000) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  8)!;
                                                        } else if (999 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1100) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  9)!;
                                                        } else if (1099 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1200) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  10)!;
                                                        } else if (1199 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1300) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  11)!;
                                                        } else if (1299 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1400) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  12)!;
                                                        } else if (1399 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1500) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  13)!;
                                                        } else if (1499 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1600) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  14)!;
                                                        } else if (1599 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1700) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  15)!;
                                                        } else if (1699 < valueOrDefault(currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1800) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  16)!;
                                                        } else if (1799 <
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.rank,
                                                                    0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) <
                                                                1900) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  17)!;
                                                        } else if (1899 <
                                                                valueOrDefault(
                                                                    currentUserDocument?.rank, 0) &&
                                                            valueOrDefault(currentUserDocument?.rank, 0) < 2000) {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .elementAtOrNull(
                                                                  18)!;
                                                        } else {
                                                          return FFAppConstants
                                                              .rankIcons
                                                              .lastOrNull!;
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    AutoSizeText(
                                                  '${valueOrDefault(currentUserDocument?.rank, 0).toString()} SR',
                                                  minFontSize: 4.0,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        font: GoogleFonts
                                                            .sairaSemiCondensed(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 22.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            CreateGameWidget.routeName,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                      ).animateOnPageLoad(animationsMap[
                                          'iconButtonOnPageLoadAnimation']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FlutterFlowAdBanner(
                            showsTestAd: true,
                            iOSAdUnitID:
                                'ca-app-pub-2529001988506496~4948000887',
                            androidAdUnitID:
                                'ca-app-pub-2529001988506496/1882057689',
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
      },
    );
  }
}
