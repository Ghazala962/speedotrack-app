import '/backend/api_requests/api_calls.dart';
import '/components/bottom_share_location_widget.dart';
import '/components/column_setting_widget.dart';
import '/components/drawer_component_widget.dart';
import '/components/list_view_bottom_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:math' as math;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'list_view_design_model.dart';
export 'list_view_design_model.dart';

class ListViewDesignWidget extends StatefulWidget {
  const ListViewDesignWidget({
    super.key,
    this.carListFilterValueParam,
    String? filterValueParam,
    this.playbackDevicedata,
  }) : this.filterValueParam = filterValueParam ?? 'All';

  final String? carListFilterValueParam;
  final String filterValueParam;
  final dynamic playbackDevicedata;

  static String routeName = 'ListViewDesign';
  static String routePath = '/listViewDesign';

  @override
  State<ListViewDesignWidget> createState() => _ListViewDesignWidgetState();
}

class _ListViewDesignWidgetState extends State<ListViewDesignWidget> {
  late ListViewDesignModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewDesignModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.groupResult = await NewSpeedotrackJSApiGroup.groupGetAPICall.call(
        jwt: FFAppState().userJwt,
      );

      if ((_model.groupResult?.succeeded ?? true)) {
        FFAppState().groupData = getJsonField(
          (_model.groupResult?.jsonBody ?? ''),
          r'''$.result''',
        );
        safeSetState(() {});
      }
      _model.showSearch = true;
      safeSetState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.initialPeriodicDeviceDataRes =
              await NewSpeedotrackJSApiGroup.loadDeviceDataApiCall.call(
            jwt: FFAppState().userJwt,
            filter: _model.filterValue,
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
            FFAppState().allDeviceData = getJsonField(
              FFAppState().allDeviceData,
              r'''$[:].imei''',
            );
            FFAppState().update(() {});
            FFAppState().insertAtIndexInPieChartValues(
                1,
                getJsonField(
                  (_model.initialPeriodicDeviceDataRes?.jsonBody ?? ''),
                  r'''$.stopped''',
                ));
            safeSetState(() {});
            FFAppState().insertAtIndexInPieChartValues(
                2,
                getJsonField(
                  (_model.initialPeriodicDeviceDataRes?.jsonBody ?? ''),
                  r'''$.idle''',
                ));
            safeSetState(() {});
            FFAppState().insertAtIndexInPieChartValues(
                3,
                getJsonField(
                  (_model.initialPeriodicDeviceDataRes?.jsonBody ?? ''),
                  r'''$.offline''',
                ));
            safeSetState(() {});
          }
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      _model.instantTimer?.cancel();
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      drawer: Container(
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerComponentModel,
            updateCallback: () => safeSetState(() {}),
            child: DrawerComponentWidget(),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    19.0, 15.0, 19.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 374.0,
                                        height: 42.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                    scaffoldKey.currentState!
                                                        .openDrawer();
                                                  },
                                                  child: Icon(
                                                    FFIcons.kgroup10000087461,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 17.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Builder(
                                                builder: (context) {
                                                  if (_model.showSearch ==
                                                      true) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 42.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .userSelfData,
                                                                        r'''$.username''',
                                                                      )?.toString(),
                                                                      'Device Name',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.showSearch =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kmagnifyingGlassSvgrepoCom,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20.0,
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
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            24.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                          FFIcons
                                                                              .kmagnifyingGlassSvgrepoCom,
                                                                          color:
                                                                              Color(0xFF636363),
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.textController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            _model.searchValue =
                                                                                _model.textController.text;
                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          isDense:
                                                                              true,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                color: Color(0xFF636363),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'x8volvrr' /* Search Vehicle */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                color: Color(0xFF636363),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          filled:
                                                                              true,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: Color(0xFF636363),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        validator: _model
                                                                            .textControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
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
                                                                          onTap:
                                                                              () async {
                                                                            _model.showSearch =
                                                                                true;
                                                                            _model.searchValue =
                                                                                null;
                                                                            safeSetState(() {});
                                                                            safeSetState(() {
                                                                              _model.textController?.clear();
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.kcross,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                17.0,
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
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      ChangeAccountWidget
                                                          .routeName);
                                                },
                                                child: Icon(
                                                  FFIcons.kviTOyw01,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      14.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            ColumnSettingWidget(),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Icon(
                                                  FFIcons.kcolumnSettingIcon,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 18.0,
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 6.0, 5.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.filterValue =
                                                                'all';
                                                            _model.isExpiredFilter =
                                                                false;
                                                            _model.isOfflineFilter =
                                                                false;
                                                            _model.isOnlineFilter =
                                                                false;
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .carListFilterValue =
                                                                'All';
                                                            FFAppState()
                                                                .deviceSearchValue = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 55.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'all'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : Color(
                                                                      0xECFAF8F8),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              border:
                                                                  Border.all(
                                                                color: _model
                                                                            .filterValue ==
                                                                        'all'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0xECFAF8F8),
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kofa2h4u' /* All  */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color: _model.filterValue == 'all'
                                                                              ? Colors.white
                                                                              : Color(0xFF636363),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .trackingData,
                                                                          r'''$.total''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color: _model.filterValue == 'all'
                                                                                ? Colors.white
                                                                                : FlutterFlowTheme.of(context).secondary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.filterValue =
                                                                  'moving';
                                                              _model.isExpiredFilter =
                                                                  false;
                                                              _model.isOfflineFilter =
                                                                  false;
                                                              _model.isOnlineFilter =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .carListFilterValue =
                                                                  'Moving';
                                                              FFAppState()
                                                                  .deviceSearchValue = '';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 76.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .filterValue ==
                                                                        'moving'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0xECFAF8F8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .filterValue ==
                                                                          'moving'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xECFAF8F8),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          '37ub9sti' /* Moving  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: _model.filterValue == 'moving' ? Colors.white : Color(0xFF636363),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            FFAppState().trackingData,
                                                                            r'''$.moving''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color: _model.filterValue == 'moving'
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondary,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.filterValue =
                                                                  'engine-idle';
                                                              _model.isExpiredFilter =
                                                                  false;
                                                              _model.isOfflineFilter =
                                                                  false;
                                                              _model.isOnlineFilter =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .carListFilterValue =
                                                                  'Engine idle';
                                                              FFAppState()
                                                                  .deviceSearchValue = '';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 65.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .filterValue ==
                                                                        'engine-idle'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0xF1FAF8F8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .filterValue ==
                                                                          'engine-idle'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xF1FAF8F8),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'esneisqq' /* Idling  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: _model.filterValue == 'engine-idle' ? Colors.white : Color(0xFF636363),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            FFAppState().trackingData,
                                                                            r'''$.idle''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color: _model.filterValue == 'engine-idle'
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondary,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.filterValue =
                                                                  'stopped';
                                                              _model.isExpiredFilter =
                                                                  false;
                                                              _model.isOfflineFilter =
                                                                  false;
                                                              _model.isOnlineFilter =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .carListFilterValue =
                                                                  'Stopped';
                                                              FFAppState()
                                                                  .deviceSearchValue = '';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 70.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .filterValue ==
                                                                        'stopped'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0xECFAF8F8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .filterValue ==
                                                                          'stopped'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xECFAF8F8),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'os2dqhza' /* Stop  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: _model.filterValue == 'stopped' ? Colors.white : Color(0xFF636363),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            FFAppState().trackingData,
                                                                            r'''$.stopped''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color: _model.filterValue == 'stopped'
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondary,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.filterValue =
                                                                  'offline';
                                                              _model.isExpiredFilter =
                                                                  false;
                                                              _model.isOfflineFilter =
                                                                  false;
                                                              _model.isOnlineFilter =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .carListFilterValue =
                                                                  'Offline';
                                                              FFAppState()
                                                                  .deviceSearchValue = '';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 70.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .filterValue ==
                                                                        'offline'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : Color(
                                                                        0xECFAF8F8),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0),
                                                                border:
                                                                    Border.all(
                                                                  color: _model
                                                                              .filterValue ==
                                                                          'offline'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0xECFAF8F8),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: RichText(
                                                                  textScaler: MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                                  text:
                                                                      TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'zcuakxvq' /* Offline  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: _model.filterValue == 'offline' ? Colors.white : Color(0xFF636363),
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      TextSpan(
                                                                        text: valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            FFAppState().trackingData,
                                                                            r'''$.offline''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color: _model.filterValue == 'offline'
                                                                              ? FlutterFlowTheme.of(context).primaryBackground
                                                                              : FlutterFlowTheme.of(context).secondary,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).textfieldColor,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
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
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Builder(
                                        builder: (context) {
                                          final groupList = functions
                                                  .returnFilteredDeviceList(
                                                      _model.filterValue,
                                                      getJsonField(
                                                        FFAppState()
                                                            .trackingData,
                                                        r'''$.result''',
                                                        true,
                                                      )!,
                                                      _model
                                                          .textController.text)
                                                  ?.toList() ??
                                              [];

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: groupList.length,
                                            itemBuilder:
                                                (context, groupListIndex) {
                                              final groupListItem =
                                                  groupList[groupListIndex];
                                              return Container(
                                                child: Container(
                                                  width: double.infinity,
                                                  color: Color(0x00000000),
                                                  child: ExpandableNotifier(
                                                    initialExpanded: true,
                                                    child: ExpandablePanel(
                                                      header: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        2.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                getJsonField(
                                                                  groupListItem,
                                                                  r'''$.name''',
                                                                )?.toString(),
                                                                'Default Group',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'arial',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      collapsed: Container(
                                                        width: 100.0,
                                                        height: 0.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                      ),
                                                      expanded: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final vehicleList =
                                                                getJsonField(
                                                              groupListItem,
                                                              r'''$.devices''',
                                                            ).toList();

                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  vehicleList
                                                                      .length,
                                                                  (vehicleListIndex) {
                                                                final vehicleListItem =
                                                                    vehicleList[
                                                                        vehicleListIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 131.8,
                                                                                      decoration: BoxDecoration(
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: Image.network(
                                                                                            valueOrDefault<String>(
                                                                                              functions.returnGoogleMapTile(
                                                                                                  '15',
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      vehicleListItem,
                                                                                                      r'''$.location_data.lat''',
                                                                                                    )?.toString(),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      vehicleListItem,
                                                                                                      r'''$.location_data.lng''',
                                                                                                    )?.toString(),
                                                                                                    '0',
                                                                                                  )),
                                                                                              'https://imgs.search.brave.com/2AGGtxrfmuvNsPXxeIAsJItBHb4zq6e8MIqi7p65d5s/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAxLzI3LzgzLzMz/LzM2MF9GXzEyNzgz/MzM3MV9yWktBSnBP/aDl2MFU1OFVUR3pn/N3BtdlppZVA0RkM5/dy5qcGc',
                                                                                            ),
                                                                                          ).image,
                                                                                        ),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 135.7,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              Color(0x00FFFFFF),
                                                                                              Color(0x00FFFFFF)
                                                                                            ],
                                                                                            stops: [0.0, 1.0],
                                                                                            begin: AlignmentDirectional(0.0, -1.0),
                                                                                            end: AlignmentDirectional(0, 1.0),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 1.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    FFButtonWidget(
                                                                                                      onPressed: () {
                                                                                                        print('Button pressed ...');
                                                                                                      },
                                                                                                      text: getJsonField(
                                                                                                        vehicleListItem,
                                                                                                        r'''$.status''',
                                                                                                      ).toString(),
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 80.0,
                                                                                                        height: 28.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: valueOrDefault<Color>(
                                                                                                          () {
                                                                                                            if (getJsonField(
                                                                                                                  vehicleListItem,
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
                                                                                                                  vehicleListItem,
                                                                                                                  r'''$.status''',
                                                                                                                ) ==
                                                                                                                getJsonField(
                                                                                                                  <String, String?>{
                                                                                                                    'val': 'Stopped',
                                                                                                                  },
                                                                                                                  r'''$.val''',
                                                                                                                )) {
                                                                                                              return Color(0xFFFF000D);
                                                                                                            } else if (getJsonField(
                                                                                                                  vehicleListItem,
                                                                                                                  r'''$.status''',
                                                                                                                ) ==
                                                                                                                getJsonField(
                                                                                                                  <String, String?>{
                                                                                                                    'val': 'Engine idle',
                                                                                                                  },
                                                                                                                  r'''$.val''',
                                                                                                                )) {
                                                                                                              return Color(0xFFFFCA2A);
                                                                                                            } else {
                                                                                                              return FlutterFlowTheme.of(context).grayTextMiddle;
                                                                                                            }
                                                                                                          }(),
                                                                                                          FlutterFlowTheme.of(context).grayTextMiddle,
                                                                                                        ),
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'arial',
                                                                                                              color: Colors.white,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderRadius: BorderRadius.circular(3.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 10.0),
                                                                                                child: Container(
                                                                                                  width: 45.0,
                                                                                                  height: 45.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            vehicleListItem,
                                                                                                            r'''$.speed''',
                                                                                                          )?.toString(),
                                                                                                          '0',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'arial',
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'gjov3mfo' /* Km/h */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'arial',
                                                                                                              fontSize: 9.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
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
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(1.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'mdzfhxr0' /* Overspeed */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'arial',
                                                                                                  color: FlutterFlowTheme.of(context).redColor,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 6.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                if (getJsonField(
                                                                                                      vehicleListItem,
                                                                                                      r'''$.sensors''',
                                                                                                    ) !=
                                                                                                    null)
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        final sensorLists = getJsonField(
                                                                                                          vehicleListItem,
                                                                                                          r'''$.sensors''',
                                                                                                        ).toList();

                                                                                                        return SingleChildScrollView(
                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: List.generate(sensorLists.length, (sensorListsIndex) {
                                                                                                              final sensorListsItem = sensorLists[sensorListsIndex];
                                                                                                              return Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                ),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                                                      child: InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          _model.filterValue = 'all';
                                                                                                                          _model.isExpiredFilter = false;
                                                                                                                          _model.isOfflineFilter = false;
                                                                                                                          _model.isOnlineFilter = false;
                                                                                                                          safeSetState(() {});
                                                                                                                          FFAppState().carListFilterValue = 'All';
                                                                                                                          FFAppState().deviceSearchValue = '';
                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        child: Container(
                                                                                                                          width: 88.1,
                                                                                                                          height: 30.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: Color(0xECFAF8F8),
                                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                                            border: Border.all(
                                                                                                                              color: Color(0xECFAF8F8),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Image.network(
                                                                                                                                getJsonField(
                                                                                                                                  sensorListsItem,
                                                                                                                                  r'''$.icon''',
                                                                                                                                ).toString(),
                                                                                                                                width: 16.0,
                                                                                                                                height: 16.0,
                                                                                                                                fit: BoxFit.contain,
                                                                                                                              ),
                                                                                                                              Align(
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    getJsonField(
                                                                                                                                      sensorListsItem,
                                                                                                                                      r'''$.valueFull''',
                                                                                                                                    ).toString(),
                                                                                                                                    textAlign: TextAlign.center,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'arial',
                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                          fontSize: 12.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                        ),
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
                                                                                                              );
                                                                                                            }),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'z5tbgtjm' /* Overspeed */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).redColor,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              vehicleListItem,
                                                                                              r'''$.name''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'arial',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          ),
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'lbee85w9' /* Overspeed */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).redColor,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 12.0, 4.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          if (getJsonField(
                                                                                                vehicleListItem,
                                                                                                r'''$.device_driver.name''',
                                                                                              ) !=
                                                                                              null)
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  vehicleListItem,
                                                                                                  r'''$.device_driver.name''',
                                                                                                )?.toString(),
                                                                                                'NA',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'arial',
                                                                                                    color: Color(0xFF636363),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                  ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          RichText(
                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                            text: TextSpan(
                                                                                              children: [
                                                                                                TextSpan(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    getJsonField(
                                                                                                      vehicleListItem,
                                                                                                      r'''$.status''',
                                                                                                    )?.toString(),
                                                                                                    'NA',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: Color(0xFF636363),
                                                                                                        fontSize: 13.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                    'n1pav1e0' /*    */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                      ),
                                                                                                ),
                                                                                                TextSpan(
                                                                                                  text: valueOrDefault<String>(
                                                                                                    functions.breakStringOnSpace(valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        vehicleListItem,
                                                                                                        r'''$.status_time''',
                                                                                                      )?.toString(),
                                                                                                      'NA',
                                                                                                    )),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: Color(0xFF636363),
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                )
                                                                                              ],
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'arial',
                                                                                                    color: Color(0xFF636363),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              functions.formateDtTracker(valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  vehicleListItem,
                                                                                                  r'''$.location_data.dt_tracker''',
                                                                                                )?.toString(),
                                                                                                '30-05-2025 09:38:01 AM',
                                                                                              )),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'arial',
                                                                                                    color: Color(0xFF636363),
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                        child: SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        context.pushNamed(
                                                                                                          NewTrackingScreenWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'singleDeviceData': serializeParam(
                                                                                                              vehicleListItem,
                                                                                                              ParamType.JSON,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            kTransitionInfoKey: TransitionInfo(
                                                                                                              hasTransition: true,
                                                                                                              transitionType: PageTransitionType.fade,
                                                                                                              duration: Duration(milliseconds: 0),
                                                                                                            ),
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 93.73,
                                                                                                        height: 35.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                          border: Border.all(
                                                                                                            color: Color(0xFFABAAAA),
                                                                                                            width: 0.5,
                                                                                                          ),
                                                                                                        ),
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Icon(
                                                                                                              FFIcons.knXeQD201,
                                                                                                              color: Color(0xFF636363),
                                                                                                              size: 20.0,
                                                                                                            ),
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(2.0, 1.0, 0.0, 2.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'badcbqzd' /* Tracking */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
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
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            PlaybackLoadingWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'deviceImei': serializeParam(
                                                                                                                getJsonField(
                                                                                                                  vehicleListItem,
                                                                                                                  r'''$.imei''',
                                                                                                                ).toString(),
                                                                                                                ParamType.String,
                                                                                                              ),
                                                                                                              'startDate': serializeParam(
                                                                                                                functions.returnCurrentDate(),
                                                                                                                ParamType.String,
                                                                                                              ),
                                                                                                              'endDate': serializeParam(
                                                                                                                functions.returnTommorowDate(),
                                                                                                                ParamType.String,
                                                                                                              ),
                                                                                                              'minStopDuration': serializeParam(
                                                                                                                '10',
                                                                                                                ParamType.String,
                                                                                                              ),
                                                                                                              'deviceData': serializeParam(
                                                                                                                vehicleListItem,
                                                                                                                ParamType.JSON,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 93.0,
                                                                                                          height: 35.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                            border: Border.all(
                                                                                                              color: Color(0xFFABAAAA),
                                                                                                              width: 0.5,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                FFIcons.kuDbiBK01,
                                                                                                                color: Color(0xFF636363),
                                                                                                                size: 16.0,
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 1.0, 0.0, 2.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '3o5i43yu' /* Playback */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 13.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
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
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: BottomShareLocationWidget(
                                                                                                                  deviceData: vehicleListItem,
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 93.0,
                                                                                                          height: 35.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                                            border: Border.all(
                                                                                                              color: Color(0xFFABAAAA),
                                                                                                              width: 0.5,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.share_sharp,
                                                                                                                color: Color(0xFF636363),
                                                                                                                size: 16.0,
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 0.0, 2.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'z4toh6q1' /* Share */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          fontSize: 13.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
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
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      SizedBox(
                                                                                                        height: 20.0,
                                                                                                        child: VerticalDivider(
                                                                                                          thickness: 1.0,
                                                                                                          color: Color(0xFFD2D2D0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: ListViewBottomCardWidget(
                                                                                                              deviceData: vehicleListItem,
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      width: 93.4,
                                                                                                      height: 35.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(30.0),
                                                                                                        border: Border.all(
                                                                                                          color: Color(0xFFABAAAA),
                                                                                                          width: 0.5,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Icon(
                                                                                                            Icons.more_vert,
                                                                                                            color: Color(0xFF636363),
                                                                                                            size: 16.0,
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 1.0, 0.0, 2.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  '4c94u5gb' /* Action */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'arial',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                    ),
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
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 42.0, 0.0, 0.0),
                                                                                  child: Transform.rotate(
                                                                                    angle: 26.0 * (math.pi / 180),
                                                                                    child: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          vehicleListItem,
                                                                                          r'''$.marker''',
                                                                                        )?.toString(),
                                                                                        'https://speedotrack.in/img/markers/objects/m_2_.png',
                                                                                      ),
                                                                                      width: 19.2,
                                                                                      height: 31.7,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      theme:
                                                          ExpandableThemeData(
                                                        tapHeaderToExpand: true,
                                                        tapBodyToExpand: false,
                                                        tapBodyToCollapse:
                                                            false,
                                                        headerAlignment:
                                                            ExpandablePanelHeaderAlignment
                                                                .center,
                                                        hasIcon: true,
                                                        expandIcon: Icons
                                                            .keyboard_arrow_down_rounded,
                                                        collapseIcon: Icons
                                                            .keyboard_arrow_up_rounded,
                                                        iconSize: 22.0,
                                                        iconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
