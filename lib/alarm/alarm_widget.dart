import '/backend/api_requests/api_calls.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'alarm_model.dart';
export 'alarm_model.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({
    super.key,
    this.deviceName,
    this.eventName,
    this.eventTime,
    this.lat,
    this.lon,
    this.deviceType,
    this.deviceImei,
  });

  final String? deviceName;
  final String? eventName;
  final String? eventTime;
  final String? lat;
  final String? lon;
  final String? deviceType;
  final String? deviceImei;

  static String routeName = 'Alarm';
  static String routePath = '/alarm';

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget>
    with TickerProviderStateMixin {
  late AlarmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlarmModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.searchVehicleTextController ??= TextEditingController();
    _model.searchVehicleFocusNode ??= FocusNode();
    _model.searchVehicleFocusNode!.addListener(
      () async {
        _model.showSearchOptions = !_model.showSearchOptions;
        safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.5.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.5.ms,
            duration: 800.0.ms,
            begin: Offset(0.0, 100.0),
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
          child: Stack(
            children: [
              Column(
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
                              Row(
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        19.0, 15.0, 19.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 374.0,
                                                        height: 42.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
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
                                                                      Colors
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
                                                                    scaffoldKey
                                                                        .currentState!
                                                                        .openDrawer();
                                                                  },
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .kgroup10000087461,
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
                                                                builder:
                                                                    (context) {
                                                                  if (_model
                                                                          .showSearchValue ==
                                                                      true) {
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      widget.deviceName,
                                                                                      'All Notification',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          fontSize: 20.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
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
                                                                                          _model.showSearchValue = false;
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Icon(
                                                                                          FFIcons.kmagnifyingGlassSvgrepoCom,
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          size: 20.0,
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: 100.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Icon(
                                                                                          FFIcons.kmagnifyingGlassSvgrepoCom,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 18.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      width: 200.0,
                                                                                      child: TextFormField(
                                                                                        controller: _model.searchVehicleTextController,
                                                                                        focusNode: _model.searchVehicleFocusNode,
                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                          '_model.searchVehicleTextController',
                                                                                          Duration(milliseconds: 2000),
                                                                                          () async {
                                                                                            safeSetState(() => _model.apiRequestCompleter = null);
                                                                                            await _model.waitForApiRequestCompleted();
                                                                                          },
                                                                                        ),
                                                                                        autofocus: false,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'arial',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                            'dwov9ynb' /* Search Vehicle */,
                                                                                          ),
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'arial',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: Color(0x00000000),
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          errorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                            borderSide: BorderSide(
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                          filled: true,
                                                                                          fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'arial',
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        validator: _model.searchVehicleTextControllerValidator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            _model.showSearchValue = true;
                                                                                            _model.searchValue = null;
                                                                                            _model.showSearchOptions = true;
                                                                                            safeSetState(() {});
                                                                                            safeSetState(() {
                                                                                              _model.searchVehicleTextController?.clear();
                                                                                            });
                                                                                          },
                                                                                          child: Icon(
                                                                                            FFIcons.kcross,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 17.0,
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
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                      final _datePickedDate =
                                                                          await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            getCurrentTimestamp,
                                                                        firstDate:
                                                                            DateTime(1900),
                                                                        lastDate:
                                                                            getCurrentTimestamp,
                                                                        builder:
                                                                            (context,
                                                                                child) {
                                                                          return wrapInMaterialDatePickerTheme(
                                                                            context,
                                                                            child!,
                                                                            headerBackgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            headerForegroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
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
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            selectedDateTimeForegroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            actionButtonForegroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            iconSize:
                                                                                24.0,
                                                                          );
                                                                        },
                                                                      );

                                                                      if (_datePickedDate !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              DateTime(
                                                                            _datePickedDate.year,
                                                                            _datePickedDate.month,
                                                                            _datePickedDate.day,
                                                                          );
                                                                        });
                                                                      } else if (_model
                                                                              .datePicked !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              getCurrentTimestamp;
                                                                        });
                                                                      }
                                                                      _model.startDate = _model
                                                                          .datePicked
                                                                          ?.toString();
                                                                      _model.endDate =
                                                                          functions
                                                                              .returnNextDay(_model.datePicked);
                                                                      safeSetState(
                                                                          () {});
                                                                      safeSetState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                      await _model
                                                                          .waitForApiRequestCompleted();
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kk2kEbT01,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          23.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                      context.pushNamed(
                                                                          FilterAlarmTypeWidget
                                                                              .routeName);
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kadjustControlEqualizerPanelSettingIcon,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 1.0, 20.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowDropDown<String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: [
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'lbxpgiap' /* Option 1 */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'o9dgi44i' /* Option 2 */,
                                                        ),
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kos54qny' /* Option 3 */,
                                                        )
                                                      ],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownValue =
                                                                  val),
                                                      width: 187.4,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'tp94t6kb' /* All Notifications */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
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
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: (_model
                                                          .apiRequestCompleter ??=
                                                      Completer<
                                                          ApiCallResponse>()
                                                        ..complete(
                                                            NewSpeedotrackJSApiGroup
                                                                .allEventListApiCall
                                                                .call(
                                                          jwt: FFAppState()
                                                              .userJwt,
                                                          pageNo:
                                                              valueOrDefault<
                                                                  int>(
                                                            _model.pageNo,
                                                            1,
                                                          ),
                                                          startDate:
                                                              _model.startDate,
                                                          endDate:
                                                              _model.endDate,
                                                          imei: getJsonField(
                                                            FFAppState()
                                                                .allDeviceData,
                                                            r'''$[:].imei''',
                                                          ).toString(),
                                                        )))
                                                  .future,
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRing(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final listViewAllEventListApiResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    final alertList =
                                                        getJsonField(
                                                      listViewAllEventListApiResponse
                                                          .jsonBody,
                                                      r'''$.result''',
                                                    ).toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          alertList.length,
                                                      itemBuilder: (context,
                                                          alertListIndex) {
                                                        final alertListItem =
                                                            alertList[
                                                                alertListIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      20.0,
                                                                      20.0),
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
                                                              context.pushNamed(
                                                                AlarmTrackingWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'deviceName':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      alertListItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'eventName':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      alertListItem,
                                                                      r'''$.desc''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'eventTime':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      alertListItem,
                                                                      r'''$.dt_tracker''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'lat':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      alertListItem,
                                                                      r'''$.lat''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'lon':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      alertListItem,
                                                                      r'''$.lng''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              40.9,
                                                                          height:
                                                                              40.9,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
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
                                                                              Icon(
                                                                                FFIcons.kzIbIKW01,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              4.0,
                                                                              0.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Group_(5).png',
                                                                            width:
                                                                                8.1,
                                                                            height:
                                                                                8.11,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: getJsonField(
                                                                                      alertListItem,
                                                                                      r'''$.desc''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                alertListItem,
                                                                                r'''$.dt_tracker''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 10,
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'arial',
                                                                                    color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              6.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        alertListItem,
                                                                                        r'''$.type''',
                                                                                      ).toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: getJsonField(
                                                                                      alertListItem,
                                                                                      r'''$.name''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          color: FlutterFlowTheme.of(context).textfieldColor,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
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
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'rowOnPageLoadAnimation']!),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
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
                ],
              ),
              if (!_model.showSearchOptions)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Container(
                        width: 282.0,
                        height: 264.5,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Builder(
                          builder: (context) {
                            final deviceList = functions
                                .searchDevices(
                                    getJsonField(
                                      FFAppState().userSelfData,
                                      r'''$.devices''',
                                    ),
                                    _model.searchVehicleTextController.text)
                                .toList();

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: deviceList.length,
                              itemBuilder: (context, deviceListIndex) {
                                final deviceListItem =
                                    deviceList[deviceListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 10.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.selectedDeviceImei = getJsonField(
                                        deviceListItem,
                                        r'''$.device.imei''',
                                      ).toString();
                                      safeSetState(() {});
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 32.0,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            deviceListItem,
                                            r'''$.device.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'arial',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
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
