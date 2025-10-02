import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rank_graph_model.dart';
export 'rank_graph_model.dart';

class RankGraphWidget extends StatefulWidget {
  const RankGraphWidget({
    super.key,
    this.matchHistory,
  });

  final List<MatchHistoryRecord>? matchHistory;

  @override
  State<RankGraphWidget> createState() => _RankGraphWidgetState();
}

class _RankGraphWidgetState extends State<RankGraphWidget>
    with TickerProviderStateMixin {
  late RankGraphModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RankGraphModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.minGames = widget!.matchHistory!.length > 1;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 350.0,
          height: 250.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiary,
            borderRadius: BorderRadius.circular(12.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_model.minGames)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Street Rank History',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              if (_model.minGames)
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                      child: Container(
                        width: 300.0,
                        height: 200.0,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: widget!.matchHistory!
                                  .map((d) => d.timestamp)
                                  .toList(),
                              yData: widget!.matchHistory!
                                  .map((d) => d.elo)
                                  .toList(),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).secondary,
                                barWidth: 3.0,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: Color(0x86EB6F59),
                                ),
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                FlutterFlowTheme.of(context).tertiary,
                            backgroundColor: Color(0x00FFFFFF),
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            reservedSize: 32.0,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            reservedSize: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (!_model.minGames)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Play More Games To Unlock Rank Graph',
                    textAlign: TextAlign.center,
                    maxLines: 3,
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
                          fontSize: 36.0,
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
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
