import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'playback_model.dart';
export 'playback_model.dart';

class PlaybackWidget extends StatefulWidget {
  const PlaybackWidget({
    super.key,
    this.deviceIMEI,
    this.deviceName,
    this.deviceData,
  });

  final String? deviceIMEI;
  final String? deviceName;
  final dynamic deviceData;

  static String routeName = 'Playback';
  static String routePath = '/playback';

  @override
  State<PlaybackWidget> createState() => _PlaybackWidgetState();
}

class _PlaybackWidgetState extends State<PlaybackWidget> {
  late PlaybackModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaybackModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      _model.startDate = functions.getCurrentDate();
      _model.endDate = functions.returnTommorowDate();
      safeSetState(() {});
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: NewSpeedotrackJSApiGroup.playbackAPICall.call(
              imei: widget.deviceIMEI,
              dtf: _model.startDate,
              dtt: _model.endDate,
              minStopDuration: _model.stopDuration,
              jwt: FFAppState().userJwt,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitRing(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              final columnPlaybackAPIResponse = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 700.0,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: custom_widgets.PlaybackCustomCode(
                                      width: double.infinity,
                                      height: double.infinity,
                                      historyData: getJsonField(
                                        columnPlaybackAPIResponse.jsonBody,
                                        r'''$.route''',
                                      ),
                                      stopsData: getJsonField(
                                        columnPlaybackAPIResponse.jsonBody,
                                        r'''$.stops''',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 900.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(20.0),
                                                      topRight:
                                                          Radius.circular(20.0),
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          15.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .deviceName,
                                                                      'ABCD!@',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 400.0,
                                                              child: Divider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          4.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Image.asset(
                                                                    'assets/images/calendar_grey-01_7.png',
                                                                    width: 23.6,
                                                                    height:
                                                                        23.6,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'tvj3qq00' /* Today */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            columnPlaybackAPIResponse.jsonBody,
                                                                            r'''$.routeArrLength''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .info_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          8.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnPlaybackAPIResponse.jsonBody,
                                                                                      r'''$.routeLength''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'qh5p6jxf' /* Distance */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            18.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 40.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: Color(0xFFD9D9D9),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnPlaybackAPIResponse.jsonBody,
                                                                                      r'''$.stopDuration''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'owdin65m' /* Duration */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            18.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 40.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: Color(0xFFD9D9D9),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnPlaybackAPIResponse.jsonBody,
                                                                                      r'''$.engineIdleTime''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '8myrlnlt' /* Idling */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            18.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 40.0,
                                                                              child: VerticalDivider(
                                                                                thickness: 1.0,
                                                                                color: Color(0xFFD9D9D9),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              48.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      columnPlaybackAPIResponse.jsonBody,
                                                                                      r'''$.topSpeed''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'o96152ed' /* Max Speed */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          17.0,
                                                                          12.0,
                                                                          17.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.pin_drop_rounded,
                                                                                  color: Color(0xFF62E243),
                                                                                  size: 20.0,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 45.0,
                                                                                        child: StyledVerticalDivider(
                                                                                          thickness: 1.0,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          lineStyle: DividerLineStyle.dashed,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  Icons.pin_drop_rounded,
                                                                                  color: Color(0xFFFF0000),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'x8rs6d2o' /* Start 07:00 */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'arial',
                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'sbqts638' /* Lebuhraya Damansara - Puchong,... */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'arial',
                                                                                                  color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Divider(
                                                                                                thickness: 1.0,
                                                                                                color: Color(0xFFD9D9D9),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '3ak6hste' /* End 12:30 */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'arial',
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'iylmvh04' /* Lebuhraya Damansara - Puchong,... */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'arial',
                                                                                                  color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.showJourney = true;
                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  'qd8oy9rz' /* JOURNEY */,
                                                                                ),
                                                                                options: FFButtonOptions(
                                                                                  width: 136.9,
                                                                                  height: 36.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: _model.showJourney ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'arial',
                                                                                        color: _model.showJourney ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  elevation: 0.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                showLoadingIndicator: false,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.showJourney = false;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'k9lj2ef5' /* TRIP */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: 137.0,
                                                                                    height: 36.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: _model.showJourney ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'arial',
                                                                                          color: _model.showJourney ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                  showLoadingIndicator: false,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    height:
                                                                        600.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (_model
                                                                            .showJourney) {
                                                                          return ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final playbackData = getJsonField(
                                                                                    columnPlaybackAPIResponse.jsonBody,
                                                                                    r'''$.route''',
                                                                                  ).toList();

                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(playbackData.length, (playbackDataIndex) {
                                                                                        final playbackDataItem = playbackData[playbackDataIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(17.0, 20.0, 17.0, 20.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              playbackDataItem,
                                                                                                              r'''$[0]''',
                                                                                                            ).toString().maybeHandleOverflow(
                                                                                                                  maxChars: 10,
                                                                                                                ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'arial',
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  fontSize: 14.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              getJsonField(
                                                                                                                playbackDataItem,
                                                                                                                r'''$[0]''',
                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                    maxChars: 10,
                                                                                                                  ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'arial',
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Image.asset(
                                                                                                              'assets/images/Group_1000005203.png',
                                                                                                              width: 30.0,
                                                                                                              height: 30.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            SizedBox(
                                                                                                              height: 35.0,
                                                                                                              child: StyledVerticalDivider(
                                                                                                                thickness: 1.0,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                lineStyle: DividerLineStyle.dashed,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Image.asset(
                                                                                                              'assets/images/moving.png',
                                                                                                              width: 30.0,
                                                                                                              height: 30.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          '5yzh5r6m' /* Stop    */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'ttt8pemw' /* 10 h 0m */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'wko25bwd' /* Location: */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.w500,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: getJsonField(
                                                                                                                          playbackDataItem,
                                                                                                                          r'''$[1]''',
                                                                                                                        ).toString(),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          '0j41y94f' /* / */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'h8q8tko9' /* $[2] */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'og1m69qy' /* Moving   */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'i4kcji6e' /* No. 15 Taman Harmoni, 11020 Ge... */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
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
                                                                                        );
                                                                                      }),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else {
                                                                          return ListView(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            children: [
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final playbackData = getJsonField(
                                                                                    columnPlaybackAPIResponse.jsonBody,
                                                                                    r'''$.drives''',
                                                                                  ).toList();

                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(playbackData.length, (playbackDataIndex) {
                                                                                        final playbackDataItem = playbackData[playbackDataIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                                                                                          child: Container(
                                                                                            height: 135.0,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                              border: Border.all(
                                                                                                color: Color(0xFFD9D9D9),
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 80.0,
                                                                                                        height: 100.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFF1F3F8),
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(12.0),
                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                            topLeft: Radius.circular(12.0),
                                                                                                            topRight: Radius.circular(0.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            getJsonField(
                                                                                                                              playbackDataItem,
                                                                                                                              r'''$.st''',
                                                                                                                            ).toString().maybeHandleOverflow(
                                                                                                                                  maxChars: 10,
                                                                                                                                ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: 'arial',
                                                                                                                                  fontSize: 10.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Text(
                                                                                                                          getJsonField(
                                                                                                                            playbackDataItem,
                                                                                                                            r'''$.et''',
                                                                                                                          ).toString().maybeHandleOverflow(
                                                                                                                                maxChars: 10,
                                                                                                                              ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 10.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Container(
                                                                                                  width: 1.8,
                                                                                                  height: 154.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: Image.asset(
                                                                                                        'assets/images/Vector_342_(Stroke).png',
                                                                                                      ).image,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 15.0, 5.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 22.0,
                                                                                                                  height: 22.0,
                                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1_(dragged)_copy_2-1.png',
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    SizedBox(
                                                                                                                      height: 25.0,
                                                                                                                      child: VerticalDivider(
                                                                                                                        thickness: 1.0,
                                                                                                                        color: Color(0xFFD9D9D9),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'vw701kks' /* Moving */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 10.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          getJsonField(
                                                                                                                            playbackDataItem,
                                                                                                                            r'''$.st''',
                                                                                                                          ).toString(),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                fontSize: 10.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 5.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: 22.0,
                                                                                                                  height: 22.0,
                                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    shape: BoxShape.circle,
                                                                                                                  ),
                                                                                                                  child: Image.asset(
                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1_(dragged)_copy_4-1.png',
                                                                                                                    fit: BoxFit.cover,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '1xrn2zwv' /* Stop */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 10.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          getJsonField(
                                                                                                                            playbackDataItem,
                                                                                                                            r'''$.et''',
                                                                                                                          ).toString(),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                fontSize: 10.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Divider(
                                                                                                        thickness: 1.0,
                                                                                                        color: Color(0xFFD9D9D9),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  getJsonField(
                                                                                                                    playbackDataItem,
                                                                                                                    r'''$.rl''',
                                                                                                                  ).toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'zzen6hpk' /* Distance */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  getJsonField(
                                                                                                                    playbackDataItem,
                                                                                                                    r'''$.dt''',
                                                                                                                  ).toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'oorvj8xu' /* Duration */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  getJsonField(
                                                                                                                    playbackDataItem,
                                                                                                                    r'''$.e''',
                                                                                                                  ).toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'k7qe311l' /* Idling */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  getJsonField(
                                                                                                                    playbackDataItem,
                                                                                                                    r'''$.ts''',
                                                                                                                  ).toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'fyneyjw5' /* Max Speed */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 10.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
