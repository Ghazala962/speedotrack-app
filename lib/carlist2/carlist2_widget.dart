import '/backend/api_requests/api_calls.dart';
import '/components/car_list_bottom_card_widget.dart';
import '/components/expiring_devices_drawer_widget.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'carlist2_model.dart';
export 'carlist2_model.dart';

class Carlist2Widget extends StatefulWidget {
  const Carlist2Widget({
    super.key,
    String? filterValueParam,
    String? carListFilterValueParam,
  })  : this.filterValueParam = filterValueParam ?? 'All',
        this.carListFilterValueParam = carListFilterValueParam ?? 'All';

  final String filterValueParam;
  final String carListFilterValueParam;

  static String routeName = 'carlist2';
  static String routePath = '/carlist2';

  @override
  State<Carlist2Widget> createState() => _Carlist2WidgetState();
}

class _Carlist2WidgetState extends State<Carlist2Widget>
    with TickerProviderStateMixin {
  late Carlist2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Carlist2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showSearch = false;
      _model.filterValue = valueOrDefault<String>(
        widget.filterValueParam,
        'All',
      );
      safeSetState(() {});
      FFAppState().carListFilterValue = widget.carListFilterValueParam;
      safeSetState(() {});
      if (functions
              .retunArrayLength(FFAppState().expiringDevicesList.toList())
              .toString() !=
          '0') {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 650.0,
                  child: ExpiringDevicesDrawerWidget(
                    expiringDevices: FFAppState().expiringDevicesList,
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.initialPeriodicDeviceDataRes =
              await NewSpeedotrackJSApiGroup.loadDeviceDataApiCall.call(
            jwt: FFAppState().userJwt,
          );

          if ((_model.initialPeriodicDeviceDataRes?.succeeded ?? true)) {
            FFAppState().allDeviceData =
                functions.returnDevicesList(getJsonField(
              (_model.initialPeriodicDeviceDataRes?.jsonBody ?? ''),
              r'''$.result''',
              true,
            )!);
            FFAppState().isLoadingVehicleData = false;
            FFAppState().trackingData =
                (_model.initialPeriodicDeviceDataRes?.jsonBody ?? '');
            FFAppState().update(() {});
            FFAppState().singleDeviceLocationData = functions
                .findSpecficVehicleWithImei(
                    getJsonField(
                      (_model.initialPeriodicDeviceDataRes?.jsonBody ?? ''),
                      r'''$.result''',
                    ),
                    FFAppState().selectedDeviceForData)
                .firstOrNull!;
            FFAppState().update(() {});
          }
        },
        startImmediately: true,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.filterValue =
                                                            'All';
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: 70.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: _model
                                                                      .filterValue ==
                                                                  'All'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: RichText(
                                                            textScaler:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hc67w78m' /* All  */,
                                                                  ),
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
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'o2rs1mx4' /* ( */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .trackingData,
                                                                    r'''$.total_''',
                                                                  ).toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bzqldfwm' /* ) */,
                                                                  ),
                                                                  style:
                                                                      TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'arial',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.filterValue =
                                                              'Moving';
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 93.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .filterValue ==
                                                                    'Moving'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '3c23hyrs' /* Moving  */,
                                                                    ),
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
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nhpoptv4' /* ( */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF0BB525),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .trackingData,
                                                                      r'''$.moving''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF0BB525),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'qq7f7rmx' /* ) */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xFF0BB525),
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.filterValue =
                                                              'Stopped';
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 93.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .filterValue ==
                                                                    'Stopped'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'y7xlf2cq' /* Stopped  */,
                                                                    ),
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
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'bihsizc0' /* ( */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .trackingData,
                                                                      r'''$.stopped''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wb9wwdqf' /* ) */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.filterValue =
                                                              'Engine Idle';
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 93.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .filterValue ==
                                                                    'Engine Idle'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'wsthzgll' /* Idle  */,
                                                                    ),
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
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '766ntkr5' /* ( */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .trackingData,
                                                                      r'''$.idle''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'nf0ibkr5' /* ) */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          _model.filterValue =
                                                              'Offline';
                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          width: 93.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .filterValue ==
                                                                    'Offline'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6z0z1i7x' /* Offline  */,
                                                                    ),
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
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'pd6m8df9' /* ( */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayTextMiddle,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text:
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .trackingData,
                                                                      r'''$.offline''',
                                                                    ).toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayTextMiddle,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'lzel8arq' /* ) */,
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .grayTextMiddle,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment(0.0, 0),
                                              child: FlutterFlowButtonTabBar(
                                                useToggleButtonStyle: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                unselectedLabelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                unselectedBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                unselectedBorderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                elevation: 0.0,
                                                buttonMargin:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            8.0, 0.0, 8.0, 0.0),
                                                padding: EdgeInsets.all(4.0),
                                                tabs: [
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'lv9vzpdg' /* List View */,
                                                    ),
                                                  ),
                                                  Tab(
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'zzmi0yhn' /* Map View */,
                                                    ),
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final deviceListTableData =
                                                                FFAppState()
                                                                    .allDeviceData
                                                                    .toList();

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  deviceListTableData
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  deviceListTableDataIndex) {
                                                                final deviceListTableDataItem =
                                                                    deviceListTableData[
                                                                        deviceListTableDataIndex];
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          6.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    deviceListTableDataItem,
                                                                                    r'''$.location_data.speed''',
                                                                                  )?.toString(),
                                                                                  '26',
                                                                                ).maybeHandleOverflow(
                                                                                  maxChars: 3,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      color: Color(0xFF2E7304),
                                                                                      fontSize: 25.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 6.0, 0.0),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'lf436v2y' /* KM/H */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          color: Color(0xFF2E7304),
                                                                                          fontSize: 10.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 8.0, 0.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          deviceListTableDataItem,
                                                                                          r'''$.marker''',
                                                                                        )?.toString(),
                                                                                        'image',
                                                                                      ),
                                                                                      width: 35.0,
                                                                                      height: 45.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: double.infinity,
                                                                                    height: 135.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 8.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        deviceListTableDataItem,
                                                                                                        r'''$.name''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            letterSpacing: 0.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Icon(
                                                                                                                      Icons.pin_drop,
                                                                                                                      color: Color(0xFF2E7304),
                                                                                                                      size: 18.0,
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          '9ij7rgok' /* GPS */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 11.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Icon(
                                                                                                                      Icons.wifi_rounded,
                                                                                                                      color: Color(0xFF2E7304),
                                                                                                                      size: 18.0,
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                          'th7lraem' /* GSM */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              fontSize: 11.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Icon(
                                                                                                                    Icons.key,
                                                                                                                    color: Color(0xFF2E7304),
                                                                                                                    size: 18.0,
                                                                                                                  ),
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '6fndwmcp' /* Ignition */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 11.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                        child: Material(
                                                                                                          color: Colors.transparent,
                                                                                                          elevation: 0.0,
                                                                                                          shape: RoundedRectangleBorder(
                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                          ),
                                                                                                          child: Container(
                                                                                                            width: 80.0,
                                                                                                            height: 20.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: () {
                                                                                                                if (getJsonField(
                                                                                                                      deviceListTableDataItem,
                                                                                                                      r'''$.status''',
                                                                                                                    ) ==
                                                                                                                    getJsonField(
                                                                                                                      <String, String>{
                                                                                                                        'val': 'Stopped',
                                                                                                                      },
                                                                                                                      r'''$.val''',
                                                                                                                    )) {
                                                                                                                  return FlutterFlowTheme.of(context).error;
                                                                                                                } else if (getJsonField(
                                                                                                                      deviceListTableDataItem,
                                                                                                                      r'''$.status''',
                                                                                                                    ) ==
                                                                                                                    getJsonField(
                                                                                                                      <String, String>{
                                                                                                                        'val': 'Moving',
                                                                                                                      },
                                                                                                                      r'''$.val''',
                                                                                                                    )) {
                                                                                                                  return Color(0xFF1B703A);
                                                                                                                } else if (getJsonField(
                                                                                                                      deviceListTableDataItem,
                                                                                                                      r'''$.status''',
                                                                                                                    ) ==
                                                                                                                    getJsonField(
                                                                                                                      <String, String>{
                                                                                                                        'val': 'Engine idle',
                                                                                                                      },
                                                                                                                      r'''$.val''',
                                                                                                                    )) {
                                                                                                                  return Color(0xFF98781C);
                                                                                                                } else {
                                                                                                                  return FlutterFlowTheme.of(context).secondaryText;
                                                                                                                }
                                                                                                              }(),
                                                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 5.0, 1.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: valueOrDefault<String>(
                                                                                                                          () {
                                                                                                                            if (getJsonField(
                                                                                                                                  deviceListTableDataItem,
                                                                                                                                  r'''$.status''',
                                                                                                                                ) ==
                                                                                                                                getJsonField(
                                                                                                                                  <String, String>{
                                                                                                                                    'val': 'Stopped',
                                                                                                                                  },
                                                                                                                                  r'''$.val''',
                                                                                                                                )) {
                                                                                                                              return 'Stopped';
                                                                                                                            } else if (getJsonField(
                                                                                                                                  deviceListTableDataItem,
                                                                                                                                  r'''$.status''',
                                                                                                                                ) ==
                                                                                                                                getJsonField(
                                                                                                                                  <String, String>{
                                                                                                                                    'val': 'Moving',
                                                                                                                                  },
                                                                                                                                  r'''$.val''',
                                                                                                                                )) {
                                                                                                                              return 'Moving';
                                                                                                                            } else if (getJsonField(
                                                                                                                                  deviceListTableDataItem,
                                                                                                                                  r'''$.status''',
                                                                                                                                ) ==
                                                                                                                                getJsonField(
                                                                                                                                  <String, String>{
                                                                                                                                    'val': 'Idle',
                                                                                                                                  },
                                                                                                                                  r'''$.val''',
                                                                                                                                )) {
                                                                                                                              return 'Idle';
                                                                                                                            } else {
                                                                                                                              return 'Engine is Off';
                                                                                                                            }
                                                                                                                          }(),
                                                                                                                          'Status',
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              fontSize: 10.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Text(
                                                                                                        getJsonField(
                                                                                                          deviceListTableDataItem,
                                                                                                          r'''$.address''',
                                                                                                        ).toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'arial',
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final deviceList =
                                                                FFAppState()
                                                                    .allDeviceData
                                                                    .toList();

                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    deviceList
                                                                        .length,
                                                                    (deviceListIndex) {
                                                                  final deviceListItem =
                                                                      deviceList[
                                                                          deviceListIndex];
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (!valueOrDefault<
                                                                          bool>(
                                                                        functions
                                                                            .checkIfTrue(getJsonField(
                                                                          deviceListItem,
                                                                          r'''$.object_expire''',
                                                                        ).toString()),
                                                                        true,
                                                                      )) {
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                10.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 3.0,
                                                                                                  height: 280.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(50.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(50.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 398.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      boxShadow: [
                                                                                                        BoxShadow(
                                                                                                          blurRadius: 4.0,
                                                                                                          color: Color(0x33000000),
                                                                                                          offset: Offset(
                                                                                                            0.0,
                                                                                                            2.0,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                                          child: Stack(
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                width: double.infinity,
                                                                                                                                height: 168.0,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  image: DecorationImage(
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                    image: Image.network(
                                                                                                                                      functions.returnGoogleMapTile(
                                                                                                                                          '12',
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            getJsonField(
                                                                                                                                              deviceListItem,
                                                                                                                                              r'''$.location_data.lat''',
                                                                                                                                            )?.toString(),
                                                                                                                                            '0',
                                                                                                                                          ),
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            getJsonField(
                                                                                                                                              deviceListItem,
                                                                                                                                              r'''$.location_data.lng''',
                                                                                                                                            )?.toString(),
                                                                                                                                            '0',
                                                                                                                                          )),
                                                                                                                                    ).image,
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.only(
                                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                                    topLeft: Radius.circular(10.0),
                                                                                                                                    topRight: Radius.circular(10.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await showModalBottomSheet(
                                                                                                                                    isScrollControlled: true,
                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                    context: context,
                                                                                                                                    builder: (context) {
                                                                                                                                      return GestureDetector(
                                                                                                                                        onTap: () {
                                                                                                                                          FocusScope.of(context).unfocus();
                                                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                        },
                                                                                                                                        child: Padding(
                                                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                          child: CarListBottomCardWidget(
                                                                                                                                            deviceData: deviceListItem,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  width: double.infinity,
                                                                                                                                  height: 183.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    borderRadius: BorderRadius.only(
                                                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                                                      topLeft: Radius.circular(12.0),
                                                                                                                                      topRight: Radius.circular(12.0),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                  child: ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    child: Image.network(
                                                                                                                                      getJsonField(
                                                                                                                                        deviceListItem,
                                                                                                                                        r'''$.marker''',
                                                                                                                                      ).toString(),
                                                                                                                                      width: 26.0,
                                                                                                                                      height: 38.0,
                                                                                                                                      fit: BoxFit.contain,
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
                                                                                                              Container(
                                                                                                                width: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0x1BFFFFFF),
                                                                                                                ),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                              child: Container(
                                                                                                                                width: 200.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: RichText(
                                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                  text: TextSpan(
                                                                                                                                    children: [
                                                                                                                                      TextSpan(
                                                                                                                                        text: valueOrDefault<String>(
                                                                                                                                          getJsonField(
                                                                                                                                            deviceListItem,
                                                                                                                                            r'''$.location_data.speed''',
                                                                                                                                          )?.toString(),
                                                                                                                                          '0',
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'arial',
                                                                                                                                              color: Color(0xFF13B513),
                                                                                                                                              fontSize: 18.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                      TextSpan(
                                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                                          'inlp87my' /*  KM/H */,
                                                                                                                                        ),
                                                                                                                                        style: TextStyle(),
                                                                                                                                      )
                                                                                                                                    ],
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'arial',
                                                                                                                                          fontSize: 18.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.w600,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                              child: Container(
                                                                                                                                width: 200.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                                child: AutoSizeText(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    getJsonField(
                                                                                                                                      deviceListItem,
                                                                                                                                      r'''$.name''',
                                                                                                                                    )?.toString(),
                                                                                                                                    'Device Name',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'arial',
                                                                                                                                        color: FlutterFlowTheme.of(context).success,
                                                                                                                                        fontSize: 16.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                              child: Container(
                                                                                                                                width: 200.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: RichText(
                                                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                    text: TextSpan(
                                                                                                                                      children: [
                                                                                                                                        TextSpan(
                                                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                                                            '7lx750b8' /* IMEI :  */,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'arial',
                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                fontSize: 10.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                        TextSpan(
                                                                                                                                          text: valueOrDefault<String>(
                                                                                                                                            getJsonField(
                                                                                                                                              deviceListItem,
                                                                                                                                              r'''$.imei''',
                                                                                                                                            )?.toString(),
                                                                                                                                            '00',
                                                                                                                                          ),
                                                                                                                                          style: TextStyle(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            fontSize: 10.0,
                                                                                                                                          ),
                                                                                                                                        )
                                                                                                                                      ],
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'arial',
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                              child: Container(
                                                                                                                                width: 200.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                  children: [
                                                                                                                                    Text(
                                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                                        'npr99nvf' /* Expires On */,
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'arial',
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            fontSize: 10.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                                                                                                                                      child: Icon(
                                                                                                                                        Icons.timelapse,
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        size: 16.0,
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
                                                                                                                    Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              width: 200.0,
                                                                                                                              height: 20.0,
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                child: RichText(
                                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                                  text: TextSpan(
                                                                                                                                    children: [
                                                                                                                                      TextSpan(
                                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                                          'r23io1fe' /* Moving :  */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'arial',
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              fontSize: 10.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                      TextSpan(
                                                                                                                                        text: valueOrDefault<String>(
                                                                                                                                          getJsonField(
                                                                                                                                            deviceListItem,
                                                                                                                                            r'''$.status''',
                                                                                                                                          )?.toString(),
                                                                                                                                          '0',
                                                                                                                                        ),
                                                                                                                                        style: TextStyle(
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                          fontSize: 10.0,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      TextSpan(
                                                                                                                                        text: getJsonField(
                                                                                                                                          deviceListItem,
                                                                                                                                          r'''$.status_time''',
                                                                                                                                        ).toString(),
                                                                                                                                        style: TextStyle(
                                                                                                                                          fontSize: 10.0,
                                                                                                                                        ),
                                                                                                                                      )
                                                                                                                                    ],
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'arial',
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        Expanded(
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                            child: Container(
                                                                                                                              width: 200.0,
                                                                                                                              height: 20.0,
                                                                                                                              decoration: BoxDecoration(),
                                                                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                                  'cv0p4q2h' /* 2024-07-06 */,
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'arial',
                                                                                                                                      color: Color(0xFFA6252E),
                                                                                                                                      fontSize: 10.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                                                                                                                  child: SingleChildScrollView(
                                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      children: [
                                                                                                                        Container(
                                                                                                                          width: 386.0,
                                                                                                                          decoration: BoxDecoration(),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                                                                                                            child: Builder(
                                                                                                                              builder: (context) {
                                                                                                                                final sensorsList = getJsonField(
                                                                                                                                  deviceListItem,
                                                                                                                                  r'''$.sensors''',
                                                                                                                                ).toList();

                                                                                                                                return SingleChildScrollView(
                                                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: List.generate(sensorsList.length, (sensorsListIndex) {
                                                                                                                                      final sensorsListItem = sensorsList[sensorsListIndex];
                                                                                                                                      return Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                            ),
                                                                                                                                            Container(
                                                                                                                                              decoration: BoxDecoration(),
                                                                                                                                              child: ClipRRect(
                                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                child: Image.network(
                                                                                                                                                  getJsonField(
                                                                                                                                                    sensorsListItem,
                                                                                                                                                    r'''$.icon''',
                                                                                                                                                  ).toString(),
                                                                                                                                                  width: 15.0,
                                                                                                                                                  height: 20.0,
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                            AutoSizeText(
                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                getJsonField(
                                                                                                                                                  sensorsListItem,
                                                                                                                                                  r'''$.name''',
                                                                                                                                                )?.toString(),
                                                                                                                                                'name',
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'arial',
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                    fontSize: 10.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            AutoSizeText(
                                                                                                                                              valueOrDefault<String>(
                                                                                                                                                getJsonField(
                                                                                                                                                  sensorsListItem,
                                                                                                                                                  r'''$.sensors.valueFull''',
                                                                                                                                                )?.toString(),
                                                                                                                                                '0',
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
                                                                                                                                      );
                                                                                                                                    }),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 0.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              context.pushNamed(
                                                                                                                                NewTrackingScreenWidget.routeName,
                                                                                                                                queryParameters: {
                                                                                                                                  'singleDeviceData': serializeParam(
                                                                                                                                    deviceListItem,
                                                                                                                                    ParamType.JSON,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                              children: [
                                                                                                                                Icon(
                                                                                                                                  Icons.gps_fixed,
                                                                                                                                  color: Color(0xFF798A97),
                                                                                                                                  size: 18.0,
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 4.0),
                                                                                                                                  child: Text(
                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                      'coco38z6' /* Live Tracking */,
                                                                                                                                    ),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'arial',
                                                                                                                                          color: Color(0xFF798A97),
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                        ),
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
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                            child: InkWell(
                                                                                                                              splashColor: Colors.transparent,
                                                                                                                              focusColor: Colors.transparent,
                                                                                                                              hoverColor: Colors.transparent,
                                                                                                                              highlightColor: Colors.transparent,
                                                                                                                              onTap: () async {
                                                                                                                                context.pushNamed(
                                                                                                                                  PlaybackInputWidget.routeName,
                                                                                                                                  queryParameters: {
                                                                                                                                    'selectedDeviceData': serializeParam(
                                                                                                                                      deviceListItem,
                                                                                                                                      ParamType.JSON,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Icon(
                                                                                                                                    Icons.play_circle,
                                                                                                                                    color: Color(0xFF798A97),
                                                                                                                                    size: 18.0,
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 4.0),
                                                                                                                                    child: Text(
                                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                                        '4d3z9kaj' /* Playback */,
                                                                                                                                      ),
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: 'arial',
                                                                                                                                            color: Color(0xFF798A97),
                                                                                                                                            fontSize: 12.0,
                                                                                                                                            letterSpacing: 0.0,
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
                                                                                                                    Expanded(
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  context.pushNamed(
                                                                                                                                    AdvanceInfoWidget.routeName,
                                                                                                                                    queryParameters: {
                                                                                                                                      'singleDeviceData': serializeParam(
                                                                                                                                        deviceListItem,
                                                                                                                                        ParamType.JSON,
                                                                                                                                      ),
                                                                                                                                    }.withoutNulls,
                                                                                                                                  );
                                                                                                                                },
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                  children: [
                                                                                                                                    Icon(
                                                                                                                                      Icons.dashboard_rounded,
                                                                                                                                      color: Color(0xFF798A97),
                                                                                                                                      size: 18.0,
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 4.0),
                                                                                                                                      child: Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'r97u72ap' /* Dashboard */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'arial',
                                                                                                                                              color: Color(0xFF798A97),
                                                                                                                                              fontSize: 12.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Align(
                                                                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  await showModalBottomSheet(
                                                                                                                                    isScrollControlled: true,
                                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                                    context: context,
                                                                                                                                    builder: (context) {
                                                                                                                                      return GestureDetector(
                                                                                                                                        onTap: () {
                                                                                                                                          FocusScope.of(context).unfocus();
                                                                                                                                          FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                        },
                                                                                                                                        child: Padding(
                                                                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                          child: CarListBottomCardWidget(
                                                                                                                                            deviceData: deviceListItem,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      );
                                                                                                                                    },
                                                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  decoration: BoxDecoration(),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                                    child: Icon(
                                                                                                                                      Icons.read_more,
                                                                                                                                      color: Color(0xFF9AA4AB),
                                                                                                                                      size: 18.0,
                                                                                                                                    ),
                                                                                                                                  ),
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
                                                                                                      ],
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Padding(
                                                                          padding:
                                                                              EdgeInsets.all(12.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                140.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    2.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '0es86pbx' /* Device Expired */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: Color(0xFF9E1C13),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(12.0),
                                                                                  child: RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'sqfmqxp7' /* Your Device  */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'arial',
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              deviceListItem,
                                                                                              r'''$.name''',
                                                                                            )?.toString(),
                                                                                            'not found ',
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'oczlocg3' /*  is Expired Please contact to ... */,
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            await launchUrl(Uri(
                                                                                              scheme: 'tel',
                                                                                              path: '+8801683200939',
                                                                                            ));
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 7.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.call,
                                                                                                  color: Color(0xFF437020),
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'laadumo7' /* Call for renewal */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'arial',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await launchURL('https://mygpsbd.com/paynow');
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          '96xc92mg' /* Pay Now */,
                                                                                        ),
                                                                                        icon: Icon(
                                                                                          Icons.payments_sharp,
                                                                                          size: 15.0,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 35.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: 'arial',
                                                                                                color: Colors.white,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(8.0),
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
                                                                    },
                                                                  );
                                                                }),
                                                              ),
                                                            );
                                                          },
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
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.newNavigationMenuModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NewNavigationMenuWidget(),
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
      ),
    );
  }
}
