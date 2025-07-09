import '/backend/api_requests/api_calls.dart';
import '/components/column_setting_widget.dart';
import '/components/drawer_component_widget.dart';
import '/components/expiring_devices_drawer_widget.dart';
import '/components/list_view_bottom_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'list_model.dart';
export 'list_model.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({
    super.key,
    this.carListFilterValueParam,
    String? filterValueParam,
  }) : this.filterValueParam = filterValueParam ?? 'All';

  final String? carListFilterValueParam;
  final String filterValueParam;

  static String routeName = 'List';
  static String routePath = '/list';

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late ListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showSearch = true;
      safeSetState(() {});
      FFAppState().carListFilterValue = widget.carListFilterValueParam!;
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
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: Container(
                height: 650.0,
                child: ExpiringDevicesDrawerWidget(
                  expiringDevices: FFAppState().expiringDevicesList,
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      drawer: Drawer(
        elevation: 16.0,
        child: wrapWithModel(
          model: _model.drawerComponentModel,
          updateCallback: () => safeSetState(() {}),
          child: DrawerComponentWidget(),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
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
                                19.0, 15.0, 19.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 1.0, 0.0, 1.0),
                                    child: Container(
                                      width: 374.0,
                                      height: 41.0,
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
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  scaffoldKey.currentState!
                                                      .openDrawer();
                                                },
                                                child: Image.asset(
                                                  'assets/images/Group_1000007328_(1).png',
                                                  width: 21.0,
                                                  height: 20.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                if (_model.showSearch == true) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    FFAppState()
                                                                        .userSelfData,
                                                                    r'''$.username''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            20.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        _model.showSearch =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/Group_(1).png',
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            20.1,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                        alignment: Alignment(
                                                                            1.0,
                                                                            0.0),
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
                                                            .fromSTEB(15.0, 0.0,
                                                                0.0, 0.0),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .searchTextfieldColor,
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/Group.png',
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
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
                                                                          _model
                                                                              .textController,
                                                                      focusNode:
                                                                          _model
                                                                              .textFieldFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.textController',
                                                                        Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () async {
                                                                          _model.searchValue = _model
                                                                              .textController
                                                                              .text;
                                                                          safeSetState(
                                                                              () {});
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
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'ud00yfbe' /* Search */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0x00000000),
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).searchTextfieldColor,
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
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .textControllerValidator
                                                                          .asValidator(
                                                                              context),
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
                                                                  child: Column(
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
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(
                                                                              () {
                                                                            _model.textController?.clear();
                                                                          });
                                                                        },
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Group_1000006570.png',
                                                                            width:
                                                                                17.0,
                                                                            height:
                                                                                17.0,
                                                                            fit:
                                                                                BoxFit.contain,
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
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              child: Image.asset(
                                                'assets/images/Group_1723.png',
                                                width: 20.4,
                                                height: 20.4,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              child: Image.asset(
                                                'assets/images/Group_1000008742.png',
                                                width: 20.4,
                                                height: 20.4,
                                                fit: BoxFit.contain,
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
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        11.0, 0.0, 11.0, 0.0),
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
                                                          width: 68.0,
                                                          height: 27.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .filterValue ==
                                                                    'all'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : Color(
                                                                    0xFFF8F9FC),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                            border: Border.all(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'all'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                                    'esc9mrri' /* All  */,
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
                                                                        color: _model.filterValue ==
                                                                                'all'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).textfieldColor,
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
                                                                child: Padding(
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
                                                                              : FlutterFlowTheme.of(context).textfieldColor,
                                                                          letterSpacing:
                                                                              0.0,
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
                                                          highlightColor: Colors
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
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .carListFilterValue =
                                                                'Moving';
                                                            FFAppState()
                                                                .deviceSearchValue = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 78.0,
                                                            height: 27.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'moving'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'hvc8d711' /* Moving  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color: _model.filterValue == 'moving'
                                                                                ? Colors.white
                                                                                : FlutterFlowTheme.of(context).textfieldColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .trackingData,
                                                                          r'''$.moving''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: _model.filterValue ==
                                                                                'moving'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).textfieldColor,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
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
                                                          highlightColor: Colors
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
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .carListFilterValue =
                                                                'Engine idle';
                                                            FFAppState()
                                                                .deviceSearchValue = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 78.0,
                                                            height: 27.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'engine-idle'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ngdy8y4s' /* Idling  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color: _model.filterValue == 'idle'
                                                                                ? Colors.white
                                                                                : FlutterFlowTheme.of(context).textfieldColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .trackingData,
                                                                          r'''$.idle''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: _model.filterValue ==
                                                                                'idle'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).secondary,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
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
                                                          highlightColor: Colors
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
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .carListFilterValue =
                                                                'Stopped';
                                                            FFAppState()
                                                                .deviceSearchValue = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 78.0,
                                                            height: 27.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'stopped'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'm7sa7bqm' /* Stop  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color: _model.filterValue == 'stop'
                                                                                ? Colors.white
                                                                                : FlutterFlowTheme.of(context).textfieldColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .trackingData,
                                                                          r'''$.stopped''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: _model.filterValue ==
                                                                                'stop'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).textfieldColor,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
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
                                                          highlightColor: Colors
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
                                                            safeSetState(() {});
                                                            FFAppState()
                                                                    .carListFilterValue =
                                                                'Offline';
                                                            FFAppState()
                                                                .deviceSearchValue = '';
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 78.0,
                                                            height: 27.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .filterValue ==
                                                                      'offline'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
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
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'trdwrtce' /* Offline  */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color: _model.filterValue == 'offline'
                                                                                ? Colors.white
                                                                                : FlutterFlowTheme.of(context).textfieldColor,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .trackingData,
                                                                          r'''$.offline''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: _model.filterValue ==
                                                                                'offline'
                                                                            ? Colors.white
                                                                            : FlutterFlowTheme.of(context).textfieldColor,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
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
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final groupList = functions
                                                  .returnFilteredDeviceList(
                                                      valueOrDefault<String>(
                                                        _model.filterValue,
                                                        'all',
                                                      ),
                                                      getJsonField(
                                                        FFAppState()
                                                            .trackingData,
                                                        r'''$.result''',
                                                        true,
                                                      )!,
                                                      _model.searchValue)
                                                  ?.toList() ??
                                              [];

                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  groupList.length,
                                                  (groupListIndex) {
                                                final groupListItem =
                                                    groupList[groupListIndex];
                                                return Container(
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    child: ExpandableNotifier(
                                                      initialExpanded: true,
                                                      child: ExpandablePanel(
                                                        header: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Opacity(
                                                                opacity: 0.6,
                                                                child: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
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
                                                                        text:
                                                                            getJsonField(
                                                                          groupListItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        style:
                                                                            TextStyle(),
                                                                      )
                                                                    ],
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              16.0,
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
                                                        collapsed: Container(
                                                          width: 100.0,
                                                          height: 1.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        expanded: Container(
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        50.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final devicesList =
                                                                    getJsonField(
                                                                  groupListItem,
                                                                  r'''$.devices''',
                                                                ).toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      devicesList
                                                                          .length,
                                                                      (devicesListIndex) {
                                                                    final devicesListItem =
                                                                        devicesList[
                                                                            devicesListIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                          children: [
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              height: getJsonField(
                                                                                                        devicesListItem,
                                                                                                        r'''$.sensors''',
                                                                                                      ) !=
                                                                                                      null
                                                                                                  ? 276.0
                                                                                                  : 250.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(6.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
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
                                                                                                              child: Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 104.4,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Builder(
                                                                                                                            builder: (context) {
                                                                                                                              if (getJsonField(
                                                                                                                                    devicesListItem,
                                                                                                                                    r'''$.status''',
                                                                                                                                  ) ==
                                                                                                                                  getJsonField(
                                                                                                                                    <String, String?>{
                                                                                                                                      'val': 'Moving',
                                                                                                                                    },
                                                                                                                                    r'''$.val''',
                                                                                                                                  )) {
                                                                                                                                return ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1__dragged__copy_2-1-removebg-preview.png',
                                                                                                                                    width: 57.3,
                                                                                                                                    height: 57.3,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              } else if (getJsonField(
                                                                                                                                    devicesListItem,
                                                                                                                                    r'''$.status''',
                                                                                                                                  ) ==
                                                                                                                                  getJsonField(
                                                                                                                                    <String, String?>{
                                                                                                                                      'val': 'Stopped',
                                                                                                                                    },
                                                                                                                                    r'''$.val''',
                                                                                                                                  )) {
                                                                                                                                return ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1__dragged__copy_4-1-removebg-preview.png',
                                                                                                                                    width: 57.3,
                                                                                                                                    height: 57.3,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              } else if (getJsonField(
                                                                                                                                    devicesListItem,
                                                                                                                                    r'''$.status''',
                                                                                                                                  ) ==
                                                                                                                                  getJsonField(
                                                                                                                                    <String, String?>{
                                                                                                                                      'val': 'Engine idle',
                                                                                                                                    },
                                                                                                                                    r'''$.val''',
                                                                                                                                  )) {
                                                                                                                                return Container(
                                                                                                                                  width: 57.3,
                                                                                                                                  height: 57.3,
                                                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    shape: BoxShape.circle,
                                                                                                                                  ),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1__dragged__copy_3-1-removebg-preview.png',
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              } else {
                                                                                                                                return ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  child: Image.asset(
                                                                                                                                    'assets/images/MR.GPS_-_ALL_ICONS_-_1__dragged__9-1-removebg-preview.png',
                                                                                                                                    width: 57.3,
                                                                                                                                    height: 57.3,
                                                                                                                                    fit: BoxFit.cover,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              }
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 163.0,
                                                                                                                            height: 22.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Visibility(
                                                                                                                              visible: FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICENAME),
                                                                                                                              child: Text(
                                                                                                                                getJsonField(
                                                                                                                                  devicesListItem,
                                                                                                                                  r'''$.name''',
                                                                                                                                ).toString(),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      fontFamily: 'arial',
                                                                                                                                      fontSize: 18.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          if (FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICEIMEI))
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                getJsonField(
                                                                                                                                  devicesListItem,
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
                                                                                                                          if (FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICEMODEL))
                                                                                                                            Text(
                                                                                                                              getJsonField(
                                                                                                                                devicesListItem,
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
                                                                                                                    ),
                                                                                                                    Expanded(
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Image.asset(
                                                                                                                              'assets/images/Vector_486.png',
                                                                                                                              width: 1.0,
                                                                                                                              height: 73.0,
                                                                                                                              fit: BoxFit.cover,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                      child: Container(
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                          child: Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  getJsonField(
                                                                                                                                    devicesListItem,
                                                                                                                                    r'''$.location_data.speed''',
                                                                                                                                  )?.toString(),
                                                                                                                                  '0',
                                                                                                                                ),
                                                                                                                                textAlign: TextAlign.center,
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
                                                                                                                                    'xy0p5qvs' /* Km/h */,
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
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                child: RichText(
                                                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                                                  text: TextSpan(
                                                                                                                    children: [
                                                                                                                      TextSpan(
                                                                                                                        text: getJsonField(
                                                                                                                          devicesListItem,
                                                                                                                          r'''$.status_time''',
                                                                                                                        ).toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                                          'rbhzdx3x' /*  -  */,
                                                                                                                        ),
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                          fontSize: 14.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      TextSpan(
                                                                                                                        text: getJsonField(
                                                                                                                          devicesListItem,
                                                                                                                          r'''$.status''',
                                                                                                                        ).toString(),
                                                                                                                        style: TextStyle(),
                                                                                                                      )
                                                                                                                    ],
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: () {
                                                                                                                            if (getJsonField(
                                                                                                                                  devicesListItem,
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
                                                                                                                                  devicesListItem,
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
                                                                                                                                  devicesListItem,
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
                                                                                                                          letterSpacing: 0.0,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 387.9,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                      child: RichText(
                                                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                                                        text: TextSpan(
                                                                                                                          children: [
                                                                                                                            TextSpan(
                                                                                                                              text: getJsonField(
                                                                                                                                devicesListItem,
                                                                                                                                r'''$.address''',
                                                                                                                              ).toString(),
                                                                                                                              style: TextStyle(),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 12.0,
                                                                                                                                letterSpacing: 0.0,
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
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              if (getJsonField(
                                                                                                                    devicesListItem,
                                                                                                                    r'''$.sensors''',
                                                                                                                  ) !=
                                                                                                                  null)
                                                                                                                Expanded(
                                                                                                                  child: Container(
                                                                                                                    width: 350.0,
                                                                                                                    decoration: BoxDecoration(),
                                                                                                                    child: Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final sensorList = getJsonField(
                                                                                                                          devicesListItem,
                                                                                                                          r'''$.sensors''',
                                                                                                                        ).toList();

                                                                                                                        return SingleChildScrollView(
                                                                                                                          scrollDirection: Axis.horizontal,
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: List.generate(sensorList.length, (sensorListIndex) {
                                                                                                                              final sensorListItem = sensorList[sensorListIndex];
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
                                                                                                                                                sensorListItem,
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
                                                                                                                                                valueOrDefault<String>(
                                                                                                                                                  getJsonField(
                                                                                                                                                    sensorListItem,
                                                                                                                                                    r'''$.valueFull''',
                                                                                                                                                  )?.toString(),
                                                                                                                                                  '0',
                                                                                                                                                ).maybeHandleOverflow(
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
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                                                              devicesListItem,
                                                                                                                              ParamType.JSON,
                                                                                                                            ),
                                                                                                                          }.withoutNulls,
                                                                                                                        );
                                                                                                                      },
                                                                                                                      child: Container(
                                                                                                                        width: double.infinity,
                                                                                                                        height: 33.0,
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
                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'kqg61phb' /* Tracking */,
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
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: double.infinity,
                                                                                                                        height: 33.0,
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
                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'mte44lj0' /* Playback */,
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
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: double.infinity,
                                                                                                                        height: 33.0,
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
                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                          border: Border.all(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'b8ghpstx' /* Share */,
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
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await launchURL(functions.returnGoogleMapNavigateLink(
                                                                                                                              valueOrDefault<String>(
                                                                                                                                getJsonField(
                                                                                                                                  devicesListItem,
                                                                                                                                  r'''$.location_data.lat''',
                                                                                                                                )?.toString(),
                                                                                                                                '0',
                                                                                                                              ),
                                                                                                                              valueOrDefault<String>(
                                                                                                                                getJsonField(
                                                                                                                                  devicesListItem,
                                                                                                                                  r'''$.location_data.lng''',
                                                                                                                                )?.toString(),
                                                                                                                                '0',
                                                                                                                              )));
                                                                                                                        },
                                                                                                                        child: Container(
                                                                                                                          width: double.infinity,
                                                                                                                          height: 33.0,
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
                                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                                            border: Border.all(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              width: 1.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          child: Align(
                                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                                'hgwnzzm7' /* Navigate */,
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
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
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
                                                                                                                                    deviceData: devicesListItem,
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ).then((value) => safeSetState(() {}));
                                                                                                                          },
                                                                                                                          child: Container(
                                                                                                                            width: 33.0,
                                                                                                                            height: 33.0,
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
                                                                                                                              shape: BoxShape.circle,
                                                                                                                              border: Border.all(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            child: Icon(
                                                                                                                              Icons.more_vert,
                                                                                                                              color: Color(0xFF808184),
                                                                                                                              size: 24.0,
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
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: true,
                                                          iconSize: 24.0,
                                                          iconColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
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
          ],
        ),
      ),
    );
  }
}
