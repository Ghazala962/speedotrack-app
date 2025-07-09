import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'playback_final_model.dart';
export 'playback_final_model.dart';

class PlaybackFinalWidget extends StatefulWidget {
  const PlaybackFinalWidget({
    super.key,
    this.playbackHistoryData,
    this.deviceData,
  });

  final dynamic playbackHistoryData;
  final dynamic deviceData;

  static String routeName = 'PlaybackFinal';
  static String routePath = '/playbackFinal';

  @override
  State<PlaybackFinalWidget> createState() => _PlaybackFinalWidgetState();
}

class _PlaybackFinalWidgetState extends State<PlaybackFinalWidget> {
  late PlaybackFinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaybackFinalModel());

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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.PlaybackFlutterMap(
            width: double.infinity,
            height: double.infinity,
            historyData: widget.playbackHistoryData!,
            stopsData: getJsonField(
              widget.playbackHistoryData,
              r'''$.stops''',
            ),
            deviceData: widget.deviceData!,
            calenderOpen: () async {
              final _datePickedDate = await showDatePicker(
                context: context,
                initialDate: getCurrentTimestamp,
                firstDate: DateTime(1900),
                lastDate: DateTime(2050),
                builder: (context, child) {
                  return wrapInMaterialDatePickerTheme(
                    context,
                    child!,
                    headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                    headerForegroundColor: FlutterFlowTheme.of(context).info,
                    headerTextStyle:
                        FlutterFlowTheme.of(context).headlineLarge.override(
                              fontFamily: 'arial',
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                    pickerBackgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    pickerForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    selectedDateTimeBackgroundColor:
                        FlutterFlowTheme.of(context).primary,
                    selectedDateTimeForegroundColor:
                        FlutterFlowTheme.of(context).info,
                    actionButtonForegroundColor:
                        FlutterFlowTheme.of(context).primaryText,
                    iconSize: 24.0,
                  );
                },
              );

              if (_datePickedDate != null) {
                safeSetState(() {
                  _model.datePicked = DateTime(
                    _datePickedDate.year,
                    _datePickedDate.month,
                    _datePickedDate.day,
                  );
                });
              } else if (_model.datePicked != null) {
                safeSetState(() {
                  _model.datePicked = getCurrentTimestamp;
                });
              }
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
              context.pushNamed(
                PlaybackLoadingWidget.routeName,
                queryParameters: {
                  'deviceImei': serializeParam(
                    getJsonField(
                      widget.deviceData,
                      r'''$.imei''',
                    ).toString(),
                    ParamType.String,
                  ),
                  'startDate': serializeParam(
                    _model.datePicked?.toString(),
                    ParamType.String,
                  ),
                  'endDate': serializeParam(
                    functions.returnNextDay(_model.datePicked),
                    ParamType.String,
                  ),
                  'minStopDuration': serializeParam(
                    '10',
                    ParamType.String,
                  ),
                  'deviceData': serializeParam(
                    widget.deviceData,
                    ParamType.JSON,
                  ),
                }.withoutNulls,
              );
            },
            navigateDetail: () async {
              context.pushNamed(HistoryDetailsWidget.routeName);
            },
          ),
        ),
      ),
    );
  }
}
