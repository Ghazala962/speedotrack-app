import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'new_tracking_screen_model.dart';
export 'new_tracking_screen_model.dart';

class NewTrackingScreenWidget extends StatefulWidget {
  const NewTrackingScreenWidget({
    super.key,
    this.singleDeviceData,
  });

  final dynamic singleDeviceData;

  static String routeName = 'New_Tracking_Screen';
  static String routePath = '/newTrackingScreen';

  @override
  State<NewTrackingScreenWidget> createState() =>
      _NewTrackingScreenWidgetState();
}

class _NewTrackingScreenWidgetState extends State<NewTrackingScreenWidget> {
  late NewTrackingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewTrackingScreenModel());

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

    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: custom_widgets.FlutterMapWidget(
                                        width: double.infinity,
                                        height: double.infinity,
                                        selectedDeviceImei: getJsonField(
                                          widget.singleDeviceData,
                                          r'''$.imei''',
                                        ).toString(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (_model.showCard == true)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 5.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft:
                                                      Radius.circular(25.0),
                                                  topRight:
                                                      Radius.circular(25.0),
                                                ),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: 310.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 8.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(25.0),
                                                    topRight:
                                                        Radius.circular(25.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                        19.0,
                                                                        10.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        104.4,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                widget.singleDeviceData,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'arial',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  widget.singleDeviceData,
                                                                                  r'''$.imei''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                widget.singleDeviceData,
                                                                                r'''$.prot''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'arial',
                                                                                    color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        functions
                                                                                            .findSpecficVehicleWithImei(
                                                                                                FFAppState().allDeviceData,
                                                                                                getJsonField(
                                                                                                  widget.singleDeviceData,
                                                                                                  r'''$.imei''',
                                                                                                ).toString())
                                                                                            .firstOrNull,
                                                                                        r'''$.location_data.speed''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 3,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 22.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'tl5hh70o' /* Km/h */,
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
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        0.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Opacity(
                                                                    opacity:
                                                                        0.3,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          0.5,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        8.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            functions
                                                                                .findSpecficVehicleWithImei(
                                                                                    FFAppState().allDeviceData,
                                                                                    getJsonField(
                                                                                      widget.singleDeviceData,
                                                                                      r'''$.imei''',
                                                                                    ).toString())
                                                                                .firstOrNull,
                                                                            r'''$.status_time''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'rdep75u3' /*  -  */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            functions
                                                                                .findSpecficVehicleWithImei(
                                                                                    FFAppState().allDeviceData,
                                                                                    getJsonField(
                                                                                      widget.singleDeviceData,
                                                                                      r'''$.imei''',
                                                                                    ).toString())
                                                                                .firstOrNull,
                                                                            r'''$.status''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                () {
                                                                              if (getJsonField(
                                                                                    widget.singleDeviceData,
                                                                                    r'''$.status''',
                                                                                  ) ==
                                                                                  getJsonField(
                                                                                    <String, String?>{
                                                                                      'val': 'Engine Idle',
                                                                                    },
                                                                                    r'''$.val''',
                                                                                  )) {
                                                                                return FlutterFlowTheme.of(context).warning;
                                                                              } else if (getJsonField(
                                                                                    widget.singleDeviceData,
                                                                                    r'''$.status''',
                                                                                  ) ==
                                                                                  getJsonField(
                                                                                    <String, String?>{
                                                                                      'val': 'Moving',
                                                                                    },
                                                                                    r'''$.val''',
                                                                                  )) {
                                                                                return Color(0xFF2DE100);
                                                                              } else if (getJsonField(
                                                                                    widget.singleDeviceData,
                                                                                    r'''$.status''',
                                                                                  ) ==
                                                                                  getJsonField(
                                                                                    <String, String?>{
                                                                                      'val': 'Stopped',
                                                                                    },
                                                                                    r'''$.val''',
                                                                                  )) {
                                                                                return Color(0xFFEC1C24);
                                                                              } else {
                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                              }
                                                                            }(),
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        10.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'i4hy47sv' /* Last GPS Position */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                functions
                                                                                    .findSpecficVehicleWithImei(
                                                                                        FFAppState().allDeviceData,
                                                                                        getJsonField(
                                                                                          widget.singleDeviceData,
                                                                                          r'''$.imei''',
                                                                                        ).toString())
                                                                                    .firstOrNull,
                                                                                r'''$.location_data.dt_tracker''',
                                                                              )?.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'arial',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8227ku9q' /* Last Server Update */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                    RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                functions
                                                                                    .findSpecficVehicleWithImei(
                                                                                        FFAppState().allDeviceData,
                                                                                        getJsonField(
                                                                                          widget.singleDeviceData,
                                                                                          r'''$.imei''',
                                                                                        ).toString())
                                                                                    .firstOrNull,
                                                                                r'''$.location_data.dt_server''',
                                                                              )?.toString(),
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'arial',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        6.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              functions
                                                                                  .findSpecficVehicleWithImei(
                                                                                      FFAppState().allDeviceData,
                                                                                      getJsonField(
                                                                                        widget.singleDeviceData,
                                                                                        r'''$.imei''',
                                                                                      ).toString())
                                                                                  .firstOrNull,
                                                                              r'''$.address''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'arial',
                                                                                  color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        6.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              functions
                                                                                  .findSpecficVehicleWithImei(
                                                                                      FFAppState().allDeviceData,
                                                                                      getJsonField(
                                                                                        widget.singleDeviceData,
                                                                                        r'''$.imei''',
                                                                                      ).toString())
                                                                                  .firstOrNull,
                                                                              r'''$.location_data.lat''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'arial',
                                                                                  color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'qxhm78lf' /* ,  */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).textfieldColor,
                                                                            ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              functions
                                                                                  .findSpecficVehicleWithImei(
                                                                                      FFAppState().allDeviceData,
                                                                                      getJsonField(
                                                                                        widget.singleDeviceData,
                                                                                        r'''$.imei''',
                                                                                      ).toString())
                                                                                  .firstOrNull,
                                                                              r'''$.location_data.lng''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      maxLines:
                                                                          1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        0.0,
                                                                        19.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        350.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final sensorlist =
                                                                              getJsonField(
                                                                            functions
                                                                                .findSpecficVehicleWithImei(
                                                                                    FFAppState().allDeviceData,
                                                                                    getJsonField(
                                                                                      widget.singleDeviceData,
                                                                                      r'''$.imei''',
                                                                                    ).toString())
                                                                                .firstOrNull,
                                                                            r'''$.sensors''',
                                                                          ).toList();

                                                                          return SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(sensorlist.length, (sensorlistIndex) {
                                                                                final sensorlistItem = sensorlist[sensorlistIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 75.0,
                                                                                    height: 52.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 2.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 22.0,
                                                                                            height: 22.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                              child: Image.network(
                                                                                                getJsonField(
                                                                                                  sensorlistItem,
                                                                                                  r'''$.icon''',
                                                                                                ).toString(),
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    sensorlistItem,
                                                                                                    r'''$.valueFull''',
                                                                                                  ).toString().maybeHandleOverflow(
                                                                                                        maxChars: 10,
                                                                                                      ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
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
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (_model.showCard == true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00FFFFFF),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 5.0),
                                                ),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
