import '/backend/api_requests/api_calls.dart';
import '/components/add_groups_widget.dart';
import '/components/column_setting_widget.dart';
import '/components/drawer_component_widget.dart';
import '/components/expiring_devices_drawer_widget.dart';
import '/components/list_view_bottom_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'list_view_model.dart';
export 'list_view_model.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
    String? carListFilterValueParam,
    String? filterValueParam,
  })  : this.carListFilterValueParam = carListFilterValueParam ?? 'All',
        this.filterValueParam = filterValueParam ?? 'All';

  final String carListFilterValueParam;
  final String filterValueParam;

  static String routeName = 'ListView';
  static String routePath = '/listView';

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  late ListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showSearch = false;
      _model.filterValue = widget.filterValueParam;
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
            filter: _model.filterValue,
            searchval: _model.textController.text,
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
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.showSearch = false;
        safeSetState(() {});
      },
    );
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 0.0, 19.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kgroup10000087461,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.showSearch ?? false) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 0.0),
                                        child: Container(
                                          height: 42.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFAppState().userName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                                                    _model.showSearch = false;
                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Group_(1).png',
                                                      width: 22.0,
                                                      height: 22.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/Group.png',
                                                        width: 20.0,
                                                        height: 20.0,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 200.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'arial',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            'rshfqh1y' /* Search Vehicle */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'arial',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor:
                                                              Color(0x00FFFFFF),
                                                          hoverColor:
                                                              Color(0xFFF8F9FC),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  color: Color(
                                                                      0xFF808184),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 15.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        _model.showSearch =
                                                            true;
                                                        safeSetState(() {});
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Group_1000006570.png',
                                                          width: 17.0,
                                                          height: 17.0,
                                                          fit: BoxFit.contain,
                                                        ),
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
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 6.0, 0.0),
                                                  child: Container(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/MR.GPS_-_ALL_ICONS_-_1_(dragged)_6-1.png',
                                                        ).image,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
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
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ColumnSettingWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Image.asset(
                                                    'assets/images/Group_1000005756.png',
                                                    width: 18.0,
                                                    height: 18.0,
                                                    fit: BoxFit.contain,
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 8.0, 19.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                                        _model.filterValue = 'all';
                                        safeSetState(() {});
                                        _model.allTrackingDevice =
                                            await NewSpeedotrackJSApiGroup
                                                .loadDeviceDataApiCall
                                                .call(
                                          jwt: FFAppState().userJwt,
                                          filter: _model.filterValue,
                                          searchval: _model.textController.text,
                                        );

                                        if ((_model
                                                .allTrackingDevice?.succeeded ??
                                            true)) {
                                          FFAppState().ListViewData = (_model
                                                  .allTrackingDevice
                                                  ?.jsonBody ??
                                              '');
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 68.0,
                                        height: 27.0,
                                        decoration: BoxDecoration(
                                          color: _model.filterValue == 'all'
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : Color(0xFFF8F9FC),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Color(0xFFF1F3F8),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'gar7f2ss' /* All  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color:
                                                              _model.filterValue ==
                                                                      'all'
                                                                  ? Colors.white
                                                                  : Color(
                                                                      0xFF808184),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          FFAppState()
                                                              .trackingData,
                                                          r'''$.total''',
                                                        )?.toString(),
                                                        '0',
                                                      ),
                                                      style: TextStyle(
                                                        color: _model
                                                                    .filterValue ==
                                                                'all'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                      ),
                                                    )
                                                  ],
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            color: _model
                                                                        .filterValue ==
                                                                    'all'
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            letterSpacing: 0.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterValue = 'moving';
                                          safeSetState(() {});
                                          _model.movingTrackingDevice =
                                              await NewSpeedotrackJSApiGroup
                                                  .loadDeviceDataApiCall
                                                  .call(
                                            jwt: FFAppState().userJwt,
                                            filter: _model.filterValue,
                                            searchval:
                                                _model.textController.text,
                                          );

                                          if ((_model.movingTrackingDevice
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().ListViewData = (_model
                                                    .movingTrackingDevice
                                                    ?.jsonBody ??
                                                '');
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 84.0,
                                          height: 27.0,
                                          decoration: BoxDecoration(
                                            color: _model.filterValue ==
                                                    'moving'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: _model.filterValue ==
                                                      'moving'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6xqtntcd' /* Moving  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            _model.filterValue ==
                                                                    'moving'
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF808184),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
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
                                                      style: TextStyle(
                                                        color: _model
                                                                    .filterValue ==
                                                                'moving'
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                      ),
                                                    )
                                                  ],
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            color: _model
                                                                        .filterValue ==
                                                                    'all'
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 14.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterValue = 'idle';
                                          safeSetState(() {});
                                          _model.idleTrackingDevice =
                                              await NewSpeedotrackJSApiGroup
                                                  .loadDeviceDataApiCall
                                                  .call(
                                            jwt: FFAppState().userJwt,
                                            filter: _model.filterValue,
                                            searchval:
                                                _model.textController.text,
                                          );

                                          if ((_model.idleTrackingDevice
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().ListViewData = (_model
                                                    .idleTrackingDevice
                                                    ?.jsonBody ??
                                                '');
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 84.0,
                                          height: 27.0,
                                          decoration: BoxDecoration(
                                            color: _model.filterValue == 'idle'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFFF1F3F8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6w5ipnaf' /* Idling   */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            _model.filterValue ==
                                                                    'idle'
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF808184),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
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
                                                        style: TextStyle(
                                                          color: _model
                                                                      .filterValue ==
                                                                  'idle'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: _model
                                                                      .filterValue ==
                                                                  'all'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          letterSpacing: 0.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterValue = 'stop';
                                          safeSetState(() {});
                                          _model.stopTrackingDevice =
                                              await NewSpeedotrackJSApiGroup
                                                  .loadDeviceDataApiCall
                                                  .call(
                                            jwt: FFAppState().userJwt,
                                            filter: _model.filterValue,
                                            searchval:
                                                _model.textController.text,
                                          );

                                          if ((_model.stopTrackingDevice
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().ListViewData = (_model
                                                    .stopTrackingDevice
                                                    ?.jsonBody ??
                                                '');
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 84.0,
                                          height: 27.0,
                                          decoration: BoxDecoration(
                                            color: _model.filterValue == 'stop'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFFF1F3F8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'd5izo88q' /* Stop  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            _model.filterValue ==
                                                                    'stop'
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF808184),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
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
                                                        style: TextStyle(
                                                          color: _model
                                                                      .filterValue ==
                                                                  'stop'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: _model
                                                                      .filterValue ==
                                                                  'stopped'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          letterSpacing: 0.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterValue = 'offline';
                                          safeSetState(() {});
                                          _model.offlineTrackingDevice =
                                              await NewSpeedotrackJSApiGroup
                                                  .loadDeviceDataApiCall
                                                  .call(
                                            jwt: FFAppState().userJwt,
                                            filter: _model.filterValue,
                                            searchval:
                                                _model.textController.text,
                                          );

                                          if ((_model.offlineTrackingDevice
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().ListViewData = (_model
                                                    .offlineTrackingDevice
                                                    ?.jsonBody ??
                                                '');
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 84.0,
                                          height: 27.0,
                                          decoration: BoxDecoration(
                                            color: _model.filterValue ==
                                                    'offline'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFFF1F3F8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7og2saq3' /* Offline  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            _model.filterValue ==
                                                                    'offline'
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF808184),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
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
                                                        style: TextStyle(
                                                          color: _model
                                                                      .filterValue ==
                                                                  'offline'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: _model
                                                                      .filterValue ==
                                                                  'all'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          letterSpacing: 0.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.filterValue = 'expired';
                                          safeSetState(() {});
                                          _model.expiredTrackingDevice =
                                              await NewSpeedotrackJSApiGroup
                                                  .loadDeviceDataApiCall
                                                  .call(
                                            jwt: FFAppState().userJwt,
                                            filter: _model.filterValue,
                                            searchval:
                                                _model.textController.text,
                                          );

                                          if ((_model.expiredTrackingDevice
                                                  ?.succeeded ??
                                              true)) {
                                            FFAppState().ListViewData = (_model
                                                    .expiredTrackingDevice
                                                    ?.jsonBody ??
                                                '');
                                            safeSetState(() {});
                                          }

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: 84.0,
                                          height: 27.0,
                                          decoration: BoxDecoration(
                                            color: _model.filterValue ==
                                                    'expired'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : Color(0xFFF8F9FC),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            border: Border.all(
                                              color: Color(0xFFF1F3F8),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'bzodyt4n' /* Expired  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            _model.filterValue ==
                                                                    'expired'
                                                                ? Colors.white
                                                                : Color(
                                                                    0xFF808184),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: valueOrDefault<
                                                            String>(
                                                          getJsonField(
                                                            FFAppState()
                                                                .trackingData,
                                                            r'''$.expired''',
                                                          )?.toString(),
                                                          '0',
                                                        ),
                                                        style: TextStyle(
                                                          color: _model
                                                                      .filterValue ==
                                                                  'expired'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: _model
                                                                      .filterValue ==
                                                                  'all'
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          letterSpacing: 0.0,
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
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final groupList = getJsonField(
                                                FFAppState().trackingData,
                                                r'''$.result''',
                                              ).toList();

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
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          child:
                                                              ExpandableNotifier(
                                                            initialExpanded:
                                                                true,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        19.0,
                                                                        8.0,
                                                                        19.0,
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
                                                                      opacity:
                                                                          0.6,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: getJsonField(
                                                                                groupListItem,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    fontFamily: 'arial',
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                fontFamily: 'arial',
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              collapsed:
                                                                  Container(
                                                                width: 100.0,
                                                                height: 1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                ),
                                                              ),
                                                              expanded:
                                                                  Container(
                                                                height: 1006.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final deviceList =
                                                                        getJsonField(
                                                                      groupListItem,
                                                                      r'''$.devices''',
                                                                    ).toList();

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          deviceList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              deviceListIndex) {
                                                                        final deviceListItem =
                                                                            deviceList[deviceListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 19.0, 0.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                height: 233.52,
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
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  height: 90.3,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0xFFF1F3F8),
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: Color(0xFFF1F3F8),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 12.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                children: [
                                                                                                                                  Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Builder(
                                                                                                                                        builder: (context) {
                                                                                                                                          if (getJsonField(
                                                                                                                                                deviceListItem,
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
                                                                                                                                                deviceListItem,
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
                                                                                                                                                deviceListItem,
                                                                                                                                                r'''$.status''',
                                                                                                                                              ) ==
                                                                                                                                              getJsonField(
                                                                                                                                                <String, String?>{
                                                                                                                                                  'val': 'Engine Idle',
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
                                                                                                                                  Expanded(
                                                                                                                                    child: Container(
                                                                                                                                      height: 64.9,
                                                                                                                                      decoration: BoxDecoration(),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Column(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                          children: [
                                                                                                                                            if (valueOrDefault<bool>(
                                                                                                                                              FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICENAME),
                                                                                                                                              true,
                                                                                                                                            ))
                                                                                                                                              Text(
                                                                                                                                                getJsonField(
                                                                                                                                                  deviceListItem,
                                                                                                                                                  r'''$.name''',
                                                                                                                                                ).toString(),
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: 'arial',
                                                                                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                      fontSize: 16.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            if (valueOrDefault<bool>(
                                                                                                                                              FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICEIMEI),
                                                                                                                                              true,
                                                                                                                                            ))
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  getJsonField(
                                                                                                                                                    deviceListItem,
                                                                                                                                                    r'''$.imei''',
                                                                                                                                                  ).toString(),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'arial',
                                                                                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            if (valueOrDefault<bool>(
                                                                                                                                              FFAppState().SelectedColumItems.contains(FFAppConstants.DEVICEMODEL),
                                                                                                                                              true,
                                                                                                                                            ))
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  valueOrDefault<String>(
                                                                                                                                                    getJsonField(
                                                                                                                                                      deviceListItem,
                                                                                                                                                      r'''$.prot''',
                                                                                                                                                    )?.toString(),
                                                                                                                                                    'Mohammad Faiz',
                                                                                                                                                  ).maybeHandleOverflow(
                                                                                                                                                    maxChars: 25,
                                                                                                                                                    replacement: '…',
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'arial',
                                                                                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            if (valueOrDefault<bool>(
                                                                                                                                              FFAppState().SelectedColumItems.contains(FFAppConstants.EXPIRYDATE),
                                                                                                                                              true,
                                                                                                                                            ))
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  getJsonField(
                                                                                                                                                    deviceListItem,
                                                                                                                                                    r'''$.expire_dt''',
                                                                                                                                                  ).toString().maybeHandleOverflow(
                                                                                                                                                        maxChars: 25,
                                                                                                                                                        replacement: '…',
                                                                                                                                                      ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'arial',
                                                                                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            if (valueOrDefault<bool>(
                                                                                                                                              FFAppState().SelectedColumItems.contains(FFAppConstants.ODOMETER),
                                                                                                                                              true,
                                                                                                                                            ))
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                child: Text(
                                                                                                                                                  getJsonField(
                                                                                                                                                    deviceListItem,
                                                                                                                                                    r'''$.odometer''',
                                                                                                                                                  ).toString().maybeHandleOverflow(
                                                                                                                                                        maxChars: 25,
                                                                                                                                                        replacement: '…',
                                                                                                                                                      ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'arial',
                                                                                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                                      ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                        children: [
                                                                                                                                          SizedBox(
                                                                                                                                            height: 70.0,
                                                                                                                                            child: VerticalDivider(
                                                                                                                                              thickness: 1.0,
                                                                                                                                              color: Color(0xFFDEDEE0),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                      children: [
                                                                                                                                        Text(
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            getJsonField(
                                                                                                                                              deviceListItem,
                                                                                                                                              r'''$.location_data.speed''',
                                                                                                                                            )?.toString(),
                                                                                                                                            '109',
                                                                                                                                          ).maybeHandleOverflow(
                                                                                                                                            maxChars: 3,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'arial',
                                                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                                                fontSize: 26.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                        Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                                              '67kqzuvq' /* Km/h */,
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  fontFamily: 'arial',
                                                                                                                                                  color: FlutterFlowTheme.of(context).textfieldColor,
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
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                                                                            deviceListItem,
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
                                                                                                                            'rvtlo8hu' /*   -   */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                        TextSpan(
                                                                                                                          text: getJsonField(
                                                                                                                            deviceListItem,
                                                                                                                            r'''$.status''',
                                                                                                                          ).toString(),
                                                                                                                          style: TextStyle(
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            fontSize: 14.0,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: () {
                                                                                                                              if (getJsonField(
                                                                                                                                    deviceListItem,
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
                                                                                                                                    deviceListItem,
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
                                                                                                                                    deviceListItem,
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
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: RichText(
                                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                                    text: TextSpan(
                                                                                                                      children: [
                                                                                                                        TextSpan(
                                                                                                                          text: getJsonField(
                                                                                                                            deviceListItem,
                                                                                                                            r'''$.address''',
                                                                                                                          ).toString(),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                                                                fontSize: 14.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                              ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w300,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: SingleChildScrollView(
                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final sensorList = getJsonField(
                                                                                                                          deviceListItem,
                                                                                                                          r'''$.sensors''',
                                                                                                                        ).toList();

                                                                                                                        return Row(
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
                                                                                                                                              getJsonField(
                                                                                                                                                sensorListItem,
                                                                                                                                                r'''$.type''',
                                                                                                                                              ).toString().maybeHandleOverflow(
                                                                                                                                                    maxChars: 10,
                                                                                                                                                  ),
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: 'arial',
                                                                                                                                                    fontSize: 10.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                    fontWeight: FontWeight.w500,
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
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
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
                                                                                                                        NewTrackingScreenWidget.routeName,
                                                                                                                        queryParameters: {
                                                                                                                          'singleDeviceData': serializeParam(
                                                                                                                            deviceListItem,
                                                                                                                            ParamType.JSON,
                                                                                                                          ),
                                                                                                                        }.withoutNulls,
                                                                                                                      );
                                                                                                                    },
                                                                                                                    child: Container(
                                                                                                                      width: 80.0,
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
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'uinjm3y9' /* Tracking */,
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
                                                                                                              Padding(
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
                                                                                                                      child: Container(
                                                                                                                        width: 80.0,
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
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            FFLocalizations.of(context).getText(
                                                                                                                              'u1jamqf5' /* Playback */,
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
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 80.0,
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
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '7ruogmrg' /* Share */,
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
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 80.0,
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
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ehtsuqxe' /* Navigate */,
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
                                                                                                              Expanded(
                                                                                                                child: Align(
                                                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
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
                                                                                                                                    return GestureDetector(
                                                                                                                                      onTap: () {
                                                                                                                                        FocusScope.of(context).unfocus();
                                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                      },
                                                                                                                                      child: Padding(
                                                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                        child: ListViewBottomCardWidget(
                                                                                                                                          deviceData: deviceListItem,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ).then((value) => safeSetState(() {}));
                                                                                                                              },
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
                                                                                                              ),
                                                                                                            ],
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
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
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
                                                                iconColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.96, -0.95),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        19.0,
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
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(context)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            AddGroupsWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .more_vert_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
