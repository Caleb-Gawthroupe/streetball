import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'incoming_request_model.dart';
export 'incoming_request_model.dart';

class IncomingRequestWidget extends StatefulWidget {
  const IncomingRequestWidget({
    super.key,
    required this.request,
    required this.incomingUser,
  });

  final FriendRequestsRecord? request;
  final DocumentReference? incomingUser;

  @override
  State<IncomingRequestWidget> createState() => _IncomingRequestWidgetState();
}

class _IncomingRequestWidgetState extends State<IncomingRequestWidget> {
  late IncomingRequestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncomingRequestModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 60.0,
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                height: 40.0,
                constraints: BoxConstraints(
                  minWidth: 100.0,
                  maxWidth: 180.0,
                ),
                decoration: BoxDecoration(),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget!.request?.fromName,
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
                          color: FlutterFlowTheme.of(context).secondary,
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
            Container(
              constraints: BoxConstraints(
                minWidth: 100.0,
              ),
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 12.0,
                      borderWidth: 2.0,
                      buttonSize: 40.0,
                      icon: FaIcon(
                        FontAwesomeIcons.userPlus,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        final firestoreBatch =
                            FirebaseFirestore.instance.batch();
                        try {
                          // Add Incoming Users Id to Friends List

                          firestoreBatch.update(currentUserReference!, {
                            ...mapToFirestore(
                              {
                                'friends': FieldValue.arrayUnion(
                                    [widget!.request?.fromUid]),
                              },
                            ),
                          });
                          // Add Id to Incoming Users Friends List

                          firestoreBatch.update(widget!.incomingUser!, {
                            ...mapToFirestore(
                              {
                                'friends':
                                    FieldValue.arrayUnion([currentUserUid]),
                              },
                            ),
                          });
                          firestoreBatch.delete(widget!.request!.reference);
                        } finally {
                          await firestoreBatch.commit();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 12.0,
                      borderWidth: 2.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        await widget!.request!.reference.delete();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
