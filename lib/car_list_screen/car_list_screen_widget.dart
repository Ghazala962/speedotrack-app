import '/backend/api_requests/api_calls.dart';
import '/components/car_list_bottom_card_widget.dart';
import '/components/expiring_devices_drawer_widget.dart';
import '/components/new_navigation_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'car_list_screen_model.dart';
export 'car_list_screen_model.dart';

class CarListScreenWidget extends StatefulWidget {
  const CarListScreenWidget({
    super.key,
    String? filterValueParam,
    String? carListFilterValueParam,
  })  : this.filterValueParam = filterValueParam ?? 'All',
        this.carListFilterValueParam = carListFilterValueParam ?? 'All';

  final String filterValueParam;
  final String carListFilterValueParam;

  static String routeName = 'CarListScreen';
  static String routePath = '/carListScreen';

  @override
  State<CarListScreenWidget> createState() => _CarListScreenWidgetState();
}

class _CarListScreenWidgetState extends State<CarListScreenWidget>
    with TickerProviderStateMixin {
  late CarListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CarListScreenModel());

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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.698, 0),
            end: Offset(0, 0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.7, 0.7),
            end: Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (_model
                                                                            .showSearch ==
                                                                        false)
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.filterValue = 'All';
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 70.0,
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: RichText(
                                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                                              text: TextSpan(
                                                                                                children: [
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      '8tudftcl' /* All */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'ugntel2g' /*  ( */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        FFAppState().trackingData,
                                                                                                        r'''$.total''',
                                                                                                      )?.toString(),
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  ),
                                                                                                  TextSpan(
                                                                                                    text: FFLocalizations.of(context).getText(
                                                                                                      'bnw735bb' /* ) */,
                                                                                                    ),
                                                                                                    style: TextStyle(
                                                                                                      color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'arial',
                                                                                                      color: _model.filterValue == 'All' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'Moving';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 99.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'bb9llrbt' /* Moving */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'pmg8fhg5' /*  ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.moving''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'hdj56fj1' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: _model.filterValue == 'Moving' ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'Stopped';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 99.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'Stopped' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        '3ujhx37i' /* Stopped */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'Stopped' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'fw6ck7nk' /* ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Stopped' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.stopped''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'stopped' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        '56ppu9q2' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'stopped' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: _model.filterValue == 'stopped' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'Engine Idle';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 99.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'Engine Idle' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'mj5dyyj6' /* Idle */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'idle' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'n9wwnqyc' /* ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'idle' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.idle''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'idle' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'wou2t1if' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'idle' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: _model.filterValue == 'idle' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'Offline';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 84.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'z3l09hfc' /* Offline */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'hlqz5jil' /*  ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.offline''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'islzhqg9' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: _model.filterValue == 'Offline' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'online';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 99.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'online' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'iiozkgwf' /* Online */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'online' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        '5f3od79g' /*  ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'online' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.online''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'online' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        '9mea962n' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'online' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.filterValue = 'expired';
                                                                                            safeSetState(() {});
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 99.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: _model.filterValue == 'expired' ? FlutterFlowTheme.of(context).accent2 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        '1u8gfiwr' /* Expired */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: _model.filterValue == 'expired' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'co6rbk3q' /*  ( */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'expired' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          FFAppState().trackingData,
                                                                                                          r'''$.expired''',
                                                                                                        )?.toString(),
                                                                                                        'n/a',
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'expired' ? FlutterFlowTheme.of(context).info : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'p19g57un' /* ) */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: _model.filterValue == 'expired' ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (_model
                                                                            .showSearch ==
                                                                        true)
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(2.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              10.0,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                360.0,
                                                                            height:
                                                                                45.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(3.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textController,
                                                                                focusNode: _model.textFieldFocusNode,
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: FFLocalizations.of(context).getText(
                                                                                    'vxuykbu9' /* Search Device... */,
                                                                                  ),
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  enabledBorder: InputBorder.none,
                                                                                  focusedBorder: InputBorder.none,
                                                                                  errorBorder: InputBorder.none,
                                                                                  focusedErrorBorder: InputBorder.none,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                                validator: _model.textControllerValidator.asValidator(context),
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
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          4.0,
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
                                                                onTap:
                                                                    () async {
                                                                  _model.showSearch =
                                                                      !_model
                                                                          .showSearch;
                                                                  safeSetState(
                                                                      () {});
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .textController
                                                                        ?.clear();
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .search_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 28.0,
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
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        height: 823.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 60.0),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment(0.0, 0),
                                                child: FlutterFlowButtonTabBar(
                                                  useToggleButtonStyle: true,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  unselectedLabelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  labelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  unselectedBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent2,
                                                  unselectedBorderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  borderWidth: 2.0,
                                                  borderRadius: 8.0,
                                                  elevation: 0.0,
                                                  buttonMargin:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(8.0, 0.0,
                                                              8.0, 0.0),
                                                  padding: EdgeInsets.all(4.0),
                                                  tabs: [
                                                    Tab(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '01typ7tx' /* List View */,
                                                      ),
                                                    ),
                                                    Tab(
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'utt013ie' /* Map View */,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              height: 687.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final deviceListTable =
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .allDeviceData,
                                                                    r'''$.result[0].devices''',
                                                                  ).toList();

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        deviceListTable
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            deviceListTableIndex) {
                                                                      final deviceListTableItem =
                                                                          deviceListTable[
                                                                              deviceListTableIndex];
                                                                      return Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (!valueOrDefault<
                                                                              bool>(
                                                                            functions.checkIfTrue(getJsonField(
                                                                              deviceListTableItem,
                                                                              r'''$.object_expire''',
                                                                            ).toString()),
                                                                            true,
                                                                          )) {
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          height: 148.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).tfBackGround,
                                                                                                            boxShadow: [
                                                                                                              BoxShadow(
                                                                                                                blurRadius: 3.0,
                                                                                                                color: Color(0x33000000),
                                                                                                                offset: Offset(
                                                                                                                  0.0,
                                                                                                                  1.0,
                                                                                                                ),
                                                                                                              )
                                                                                                            ],
                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    await showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
                                                                                                                      useSafeArea: true,
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
                                                                                                                              deviceData: deviceListTableItem,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                  },
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Text(
                                                                                                                                  getJsonField(
                                                                                                                                    deviceListTableItem,
                                                                                                                                    r'''$.name''',
                                                                                                                                  ).toString(),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        fontFamily: 'arial',
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Icon(
                                                                                                                                      Icons.location_on,
                                                                                                                                      color: Color(0xFF2E7304),
                                                                                                                                      size: 18.0,
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        FFLocalizations.of(context).getText(
                                                                                                                                          'hhuxcy4f' /* GPS */,
                                                                                                                                        ),
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'arial',
                                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                              fontSize: 11.0,
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
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
                                                                                                                                            'n8w6958o' /* GSM */,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'arial',
                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                fontSize: 11.0,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Column(
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
                                                                                                                                            'yg7ojydr' /* Ignition */,
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'arial',
                                                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                fontSize: 11.0,
                                                                                                                                                letterSpacing: 0.0,
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
                                                                                                                      Divider(
                                                                                                                        thickness: 1.0,
                                                                                                                        color: FlutterFlowTheme.of(context).accent4,
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Material(
                                                                                                                              color: Colors.transparent,
                                                                                                                              elevation: 0.0,
                                                                                                                              shape: RoundedRectangleBorder(
                                                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                                                              ),
                                                                                                                              child: Container(
                                                                                                                                width: 80.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                                    () {
                                                                                                                                      if (getJsonField(
                                                                                                                                            deviceListTableItem,
                                                                                                                                            r'''$.status''',
                                                                                                                                          ) ==
                                                                                                                                          getJsonField(
                                                                                                                                            FFAppState().containsMoving,
                                                                                                                                            r'''$.m''',
                                                                                                                                          )) {
                                                                                                                                        return Color(0xFF2E7304);
                                                                                                                                      } else if (getJsonField(
                                                                                                                                            deviceListTableItem,
                                                                                                                                            r'''$.status''',
                                                                                                                                          ) ==
                                                                                                                                          getJsonField(
                                                                                                                                            FFAppState().containsStopped,
                                                                                                                                            r'''$.s''',
                                                                                                                                          )) {
                                                                                                                                        return Color(0xFFDD2020);
                                                                                                                                      } else if (getJsonField(
                                                                                                                                            deviceListTableItem,
                                                                                                                                            r'''$.status''',
                                                                                                                                          ) ==
                                                                                                                                          getJsonField(
                                                                                                                                            FFAppState().containsIdle,
                                                                                                                                            r'''$.i''',
                                                                                                                                          )) {
                                                                                                                                        return Color(0xFFBC7418);
                                                                                                                                      } else {
                                                                                                                                        return Color(0xFF404040);
                                                                                                                                      }
                                                                                                                                    }(),
                                                                                                                                    Color(0xFFDDD5D5),
                                                                                                                                  ),
                                                                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                                                                ),
                                                                                                                                child: Align(
                                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 5.0, 1.0),
                                                                                                                                    child: AutoSizeText(
                                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                                        'a74h7c3v' /* Unlimited */,
                                                                                                                                      ),
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
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              getJsonField(
                                                                                                                                deviceListTableItem,
                                                                                                                                r'''$.status''',
                                                                                                                              ).toString(),
                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                    fontFamily: 'arial',
                                                                                                                                    color: valueOrDefault<Color>(
                                                                                                                                      () {
                                                                                                                                        if (getJsonField(
                                                                                                                                              deviceListTableItem,
                                                                                                                                              r'''$.status''',
                                                                                                                                            ) ==
                                                                                                                                            getJsonField(
                                                                                                                                              FFAppState().containsMoving,
                                                                                                                                              r'''$.m''',
                                                                                                                                            )) {
                                                                                                                                          return Color(0xFF2E7304);
                                                                                                                                        } else if (getJsonField(
                                                                                                                                              deviceListTableItem,
                                                                                                                                              r'''$.status''',
                                                                                                                                            ) ==
                                                                                                                                            getJsonField(
                                                                                                                                              FFAppState().containsStopped,
                                                                                                                                              r'''$.s''',
                                                                                                                                            )) {
                                                                                                                                          return Color(0xFFDD2020);
                                                                                                                                        } else if (getJsonField(
                                                                                                                                              deviceListTableItem,
                                                                                                                                              r'''$.status''',
                                                                                                                                            ) ==
                                                                                                                                            getJsonField(
                                                                                                                                              FFAppState().containsIdle,
                                                                                                                                              r'''$.i''',
                                                                                                                                            )) {
                                                                                                                                          return Color(0xFFBC7418);
                                                                                                                                        } else {
                                                                                                                                          return Color(0xFF404040);
                                                                                                                                        }
                                                                                                                                      }(),
                                                                                                                                      Color(0xFFDDD5D5),
                                                                                                                                    ),
                                                                                                                                    fontSize: 12.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Expanded(
                                                                                                                              child: Align(
                                                                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    getJsonField(
                                                                                                                                      deviceListTableItem,
                                                                                                                                      r'''$.status_time''',
                                                                                                                                    ).toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'arial',
                                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                                            () {
                                                                                                                                              if (getJsonField(
                                                                                                                                                    deviceListTableItem,
                                                                                                                                                    r'''$.status''',
                                                                                                                                                  ) ==
                                                                                                                                                  getJsonField(
                                                                                                                                                    FFAppState().containsMoving,
                                                                                                                                                    r'''$.m''',
                                                                                                                                                  )) {
                                                                                                                                                return Color(0xFF2E7304);
                                                                                                                                              } else if (getJsonField(
                                                                                                                                                    deviceListTableItem,
                                                                                                                                                    r'''$.status''',
                                                                                                                                                  ) ==
                                                                                                                                                  getJsonField(
                                                                                                                                                    FFAppState().containsStopped,
                                                                                                                                                    r'''$.s''',
                                                                                                                                                  )) {
                                                                                                                                                return Color(0xFFDD2020);
                                                                                                                                              } else if (getJsonField(
                                                                                                                                                    deviceListTableItem,
                                                                                                                                                    r'''$.status''',
                                                                                                                                                  ) ==
                                                                                                                                                  getJsonField(
                                                                                                                                                    FFAppState().containsIdle,
                                                                                                                                                    r'''$.i''',
                                                                                                                                                  )) {
                                                                                                                                                return Color(0xFFBC7418);
                                                                                                                                              } else {
                                                                                                                                                return Color(0xFF404040);
                                                                                                                                              }
                                                                                                                                            }(),
                                                                                                                                            Color(0xFFDDD5D5),
                                                                                                                                          ),
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
                                                                          } else {
                                                                            return Padding(
                                                                              padding: EdgeInsets.all(12.0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 140.0,
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
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'du1duudx' /* Device Expired */,
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
                                                                                                'esfrx22f' /* Your Device  */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'arial',
                                                                                                    letterSpacing: 0.0,
                                                                                                  ),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  deviceListTableItem,
                                                                                                  r'''$.name''',
                                                                                                )?.toString(),
                                                                                                'not found ',
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'kdnjrrs7' /*  is Expired Please contact to ... */,
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
                                                                                                      '5c77yxqc' /* Call for renewal */,
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
                                                                                              '8btlz8w1' /* Pay Now */,
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
                                                                    },
                                                                  ).animateOnPageLoad(
                                                                      animationsMap[
                                                                          'listViewOnPageLoadAnimation']!);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final deviceList = functions
                                                                  .returnFilteredDeviceListOnStatus(
                                                                      valueOrDefault<String>(
                                                                        _model
                                                                            .filterValue,
                                                                        'All',
                                                                      ),
                                                                      FFAppState().allDeviceData,
                                                                      _model.searchValue)
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 0.0),
                                                                              child: Row(
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
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        () {
                                                                                                          if (_model.instantTimer.isActive ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().containsMoving,
                                                                                                                r'''$.m''',
                                                                                                              )) {
                                                                                                            return Color(0xFF2E7304);
                                                                                                          } else if (getJsonField(
                                                                                                                deviceListItem,
                                                                                                                r'''$.status''',
                                                                                                              ) ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().containsStopped,
                                                                                                                r'''$.s''',
                                                                                                              )) {
                                                                                                            return Color(0xFFDD2020);
                                                                                                          } else if (getJsonField(
                                                                                                                deviceListItem,
                                                                                                                r'''$.status''',
                                                                                                              ) ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().containsIdle,
                                                                                                                r'''$.i''',
                                                                                                              )) {
                                                                                                            return Color(0xFFBC7418);
                                                                                                          } else {
                                                                                                            return Color(0xFF404040);
                                                                                                          }
                                                                                                        }(),
                                                                                                        Color(0xFFDDD5D5),
                                                                                                      ),
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
                                                                                                      height: 298.0,
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
                                                                                                                                                                fontSize: 18.0,
                                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                                              ),
                                                                                                                                                        ),
                                                                                                                                                        TextSpan(
                                                                                                                                                          text: FFLocalizations.of(context).getText(
                                                                                                                                                            'b82fi7h9' /*  KM/H */,
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
                                                                                                                                                          fontSize: 16.0,
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
                                                                                                                                                              'qi719rwr' /* IMEI :  */,
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
                                                                                                                                                  child: Text(
                                                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                                                      '99z1xhb6' /* Expires On */,
                                                                                                                                                    ),
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                          fontFamily: 'arial',
                                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                          fontSize: 10.0,
                                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                                        ),
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
                                                                                                                                                            'bnr0aqwo' /* Moving :  */,
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
                                                                                                                                                    'c3k47hfs' /* 2024-07-06 */,
                                                                                                                                                  ),
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                        fontFamily: 'arial',
                                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
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
                                                                                                                                        '90rqinj4' /* Live Tracking */,
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
                                                                                                                                          'qitqyg45' /* Playback */,
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
                                                                                                                                            'ovicx81q' /* Dashboard */,
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
                                                                              height: 140.0,
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
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '1dvixkq1' /* Device Expired */,
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
                                                                                              'qalyd3zq' /* Your Device  */,
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
                                                                                              'plw1balv' /*  is Expired Please contact to ... */,
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
                                                                                                    'e04ut15a' /* Call for renewal */,
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
                                                                                            'cog2io8p' /* Pay Now */,
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 65.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: wrapWithModel(
                            model: _model.newNavigationMenuModel,
                            updateCallback: () => safeSetState(() {}),
                            child: NewNavigationMenuWidget(),
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
    );
  }
}
