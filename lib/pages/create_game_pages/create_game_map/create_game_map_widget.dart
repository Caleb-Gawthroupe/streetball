import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'create_game_map_model.dart';
export 'create_game_map_model.dart';

class CreateGameMapWidget extends StatefulWidget {
  const CreateGameMapWidget({super.key});

  static String routeName = 'CreateGameMap';
  static String routePath = '/createGameMap';

  @override
  State<CreateGameMapWidget> createState() => _CreateGameMapWidgetState();
}

class _CreateGameMapWidgetState extends State<CreateGameMapWidget>
    with TickerProviderStateMixin {
  late CreateGameMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGameMapModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.textController ??=
        TextEditingController(text: FFAppState().createGameName);
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'googleMapOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    context.watch<FFAppState>();
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
                  onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                  initialLocation: _model.googleMapsCenter ??=
                      currentUserLocationValue!,
                  markerColor: GoogleMarkerColor.violet,
                  mapType: MapType.normal,
                  style: GoogleMapStyle.standard,
                  initialZoom: 16.0,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: true,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                  mapTakesGesturePreference: false,
                ).animateOnPageLoad(
                    animationsMap['googleMapOnPageLoadAnimation']!),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: 75.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).tertiary,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 1.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                hintStyle: FlutterFlowTheme.of(context)
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
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
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                              textAlign: TextAlign.center,
                              minLines: 1,
                              cursorColor:
                                  FlutterFlowTheme.of(context).secondary,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.05,
                          0.0,
                        ),
                        15.0,
                        valueOrDefault<double>(
                          MediaQuery.sizeOf(context).width * 0.05,
                          0.0,
                        ),
                        15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              CreateGameWidget.routeName,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          text: 'Back',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.sairaSemiCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                            elevation: 5.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        FFButtonWidget(
                          onPressed: () async {
                            FFAppState().gameLocation = _model.googleMapsCenter;
                            safeSetState(() {});

                            var gamesRecordReference =
                                GamesRecord.collection.doc();
                            await gamesRecordReference.set({
                              ...createGamesRecordData(
                                name: FFAppState().createGameName,
                                location: FFAppState().gameLocation,
                                scoreCap: FFAppState().gameScoreCap,
                                winByTwo: FFAppState().winByTwo,
                                minRep: FFAppState().minRep,
                                minRating: FFAppState().minRating,
                                isPrivate: FFAppState().isPrivate,
                                password: FFAppState().gamePassword,
                                maxPlayers: FFAppState().gameMaxPlayer,
                                currentPlayers: 1,
                                teamSize: FFAppState().gameTeamSize,
                                description: FFAppState().gameDescription,
                                team1Score: 0,
                                team2Score: 0,
                                gameStatus: 'lobby',
                                createTime: getCurrentTimestamp,
                                hostUid: currentUserUid,
                                expectedResultTeam1: null,
                              ),
                              ...mapToFirestore(
                                {
                                  'players': [currentUserUid],
                                },
                              ),
                            });
                            _model.game = GamesRecord.getDocumentFromData({
                              ...createGamesRecordData(
                                name: FFAppState().createGameName,
                                location: FFAppState().gameLocation,
                                scoreCap: FFAppState().gameScoreCap,
                                winByTwo: FFAppState().winByTwo,
                                minRep: FFAppState().minRep,
                                minRating: FFAppState().minRating,
                                isPrivate: FFAppState().isPrivate,
                                password: FFAppState().gamePassword,
                                maxPlayers: FFAppState().gameMaxPlayer,
                                currentPlayers: 1,
                                teamSize: FFAppState().gameTeamSize,
                                description: FFAppState().gameDescription,
                                team1Score: 0,
                                team2Score: 0,
                                gameStatus: 'lobby',
                                createTime: getCurrentTimestamp,
                                hostUid: currentUserUid,
                                expectedResultTeam1: null,
                              ),
                              ...mapToFirestore(
                                {
                                  'players': [currentUserUid],
                                },
                              ),
                            }, gamesRecordReference);
                            _model.gameID = _model.game?.reference;
                            safeSetState(() {});

                            await currentUserReference!
                                .update(createUsersRecordData(
                              team: 1,
                              currentGameID: _model.game?.reference.id,
                              isReady: false,
                              vote: '',
                              hasDownloadedNewRank: false,
                            ));

                            context.pushNamed(
                              InGamePageWidget.routeName,
                              queryParameters: {
                                'gameID': serializeParam(
                                  _model.gameID,
                                  ParamType.DocumentReference,
                                ),
                                'isHost': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                            );

                            safeSetState(() {});
                          },
                          text: 'Create',
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 60.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.sairaSemiCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                            elevation: 5.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: PointerInterceptor(
                  intercepting: isWeb,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/map_pin.png',
                      width: 40.0,
                      height: 40.0,
                      fit: BoxFit.cover,
                    ),
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
