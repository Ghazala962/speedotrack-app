import '/backend/api_requests/api_calls.dart';
import '/components/calendar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'report_screen_model.dart';
export 'report_screen_model.dart';

class ReportScreenWidget extends StatefulWidget {
  const ReportScreenWidget({super.key});

  static String routeName = 'Report_Screen';
  static String routePath = '/reportScreen';

  @override
  State<ReportScreenWidget> createState() => _ReportScreenWidgetState();
}

class _ReportScreenWidgetState extends State<ReportScreenWidget> {
  late ReportScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().startDate = functions.getCurrentDate()!;
      FFAppState().endDate = functions.returnTommorowDate();
      safeSetState(() {});
      _model.selectedDevices = (getJsonField(
        FFAppState().allDeviceData,
        r'''$.result[:].imei''',
        true,
      ) as List)
          .map<String>((s) => s.toString())
          .toList()
          .toList()
          .cast<String>();
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 8.0),
                child: Container(
                  height: 42.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 19.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                FFIcons.kiosArrowLeft,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 17.0,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qg37xwhc' /* Report  */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
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
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 18.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'o30k8h1n' /* Report */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.reportTypeValueController ??=
                                          FormFieldController<String>(
                                    _model.reportTypeValue ??= '',
                                  ),
                                  options: List<String>.from(FFAppState()
                                      .reportTypesList
                                      .map((e) => e.reportVal)
                                      .toList()),
                                  optionLabels: FFAppState()
                                      .reportTypesList
                                      .map((e) => e.reportLabel)
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.reportTypeValue = val),
                                  width: double.infinity,
                                  height: 48.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '2tyoakhv' /* General Information */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .textFieldBorderColor,
                                  borderWidth: 0.5,
                                  borderRadius: 12.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '5pqwkyei' /* Devices */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.deviceImeiValueController ??=
                                          FormFieldController<String>(
                                    _model.deviceImeiValue ??= '',
                                  ),
                                  options: List<String>.from((getJsonField(
                                    FFAppState().allDeviceData,
                                    r'''$[:].imei''',
                                    true,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()),
                                  optionLabels: (getJsonField(
                                    FFAppState().allDeviceData,
                                    r'''$[:].name''',
                                    true,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList(),
                                  onChanged: (val) => safeSetState(
                                      () => _model.deviceImeiValue = val),
                                  width: double.infinity,
                                  height: 48.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'arial',
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '9apesque' /* Select Devices */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    '23bkzv5y' /* Search Device  name... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .textFieldBorderColor,
                                  borderWidth: 0.5,
                                  borderRadius: 12.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 18.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ynvtb7dg' /* Sensor */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              fontSize: 16.0,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowDropDown<String>(
                                  controller: _model.sensorValueController ??=
                                      FormFieldController<String>(
                                    _model.sensorValue ??= '',
                                  ),
                                  options: List<String>.from([
                                    'Air Con',
                                    'Battery Status',
                                    'Battery Voltage',
                                    'Device Battery',
                                    'Door',
                                    'Door Sensor',
                                    'Electricity',
                                    'Engine',
                                    'Engine Status',
                                    'External Battery',
                                    'Fuel Level',
                                    'Generator',
                                    'GPS Level',
                                    'GPS Signal',
                                    'GSM Level',
                                    'Ignition',
                                    'Internal Battery Voltage'
                                  ]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'hem9i61e' /* Air Con */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'rssbvfft' /* Battery Status */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'il17h9o9' /* Battery Voltage */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '4x7py800' /* Device Battery */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'dywbpdhk' /* Door */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '0q9dubai' /* Door Sensor */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'lidnxbu9' /* Electricity */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'afkjjosp' /* Engine */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'd3ebdd39' /* Engine Status */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'lhc4ijeq' /* External Battery */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '3a2olebl' /* Fuel Level */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '4q4ihoxp' /* Generator */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'mvswx28c' /* GPS Level */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '65ceofow' /* GPS Signal */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'sthp1gmi' /* GSM Level */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'v6bzevlz' /* Ignition */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'vx27i4gp' /* Internal Battery Voltage */,
                                    )
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.sensorValue = val),
                                  width: double.infinity,
                                  height: 48.0,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'arial',
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'acjkqn7x' /* Select Devices */,
                                  ),
                                  searchHintText:
                                      FFLocalizations.of(context).getText(
                                    'fw5ited1' /* Search Device  name... */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .textFieldBorderColor,
                                  borderWidth: 0.5,
                                  borderRadius: 12.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: true,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '4gp86isn' /* Filter */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model.filterValueController ??=
                                        FormFieldController<String>(
                                      _model.filterValue ??= 'TODAY',
                                    ),
                                    options: List<String>.from([
                                      'TODAY',
                                      'YESTERDAY',
                                      'THIS-WEEK',
                                      'LAST-WEEK',
                                      'THIS-MONTH',
                                      'LAST-MONTH'
                                    ]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'e6m9vbbs' /* Today */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ti9b26cb' /* Yesterday */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '28hylmlc' /* This Week */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'udkujb9d' /* Last Week */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'luwfmjn7' /* This Month */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '3h8x209o' /* Last Month */,
                                      )
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.filterValue = val);
                                      if (_model.filterValue == 'TODAY') {
                                        _model.startDate =
                                            functions.getCurrentDate();
                                        _model.endDate =
                                            functions.getTommorowDate();
                                        safeSetState(() {});
                                      } else if (_model.filterValue ==
                                          'YESTERDAY') {
                                        _model.startDate =
                                            functions.returnTwoDaysBefore();
                                        _model.endDate =
                                            functions.returnYesterdayDate();
                                        safeSetState(() {});
                                      } else if (_model.filterValue ==
                                          'THIS-WEEK') {
                                        _model.startDate =
                                            functions.returnThisWeek();
                                        _model.endDate =
                                            functions.returnCurrentDate();
                                        safeSetState(() {});
                                      } else if (_model.filterValue ==
                                          'LAST-WEEK') {
                                        _model.startDate =
                                            functions.returnLastWeek();
                                        _model.endDate =
                                            functions.returnThisWeek();
                                        safeSetState(() {});
                                      } else if (_model.filterValue ==
                                          'THIS-MONTH') {
                                        _model.startDate =
                                            functions.returnThisMonth();
                                        _model.endDate =
                                            functions.returnCurrentDate();
                                        safeSetState(() {});
                                      } else {
                                        _model.startDate =
                                            functions.returnLastMonth();
                                        _model.endDate =
                                            functions.returnThisMonth();
                                        safeSetState(() {});
                                      }
                                    },
                                    width: 383.0,
                                    height: 48.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'nvtdvts0' /* Please select... */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .textFieldBorderColor,
                                    borderWidth: 0.5,
                                    borderRadius: 12.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
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
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'z69x33nd' /* From & To */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .textFieldBorderColor,
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.startDate,
                                                              'Start Date',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '3vdf07sk' /*  -  */,
                                                            ),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              _model.endDate,
                                                              'End Date',
                                                            ),
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'arial',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
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
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: CalendarWidget(
                                                          setStartDate:
                                                              (startDate) async {
                                                            _model.startDate =
                                                                startDate;
                                                            safeSetState(() {});
                                                          },
                                                          setEndDate:
                                                              (endDate) async {
                                                            _model.endDate =
                                                                endDate;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Icon(
                                                FFIcons.kk2kEbT01,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 50.0, 30.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.pdfReport =
                                            await NewSpeedotrackJSApiGroup
                                                .reportPDFApiCall
                                                .call(
                                          reportType: _model.reportTypeValue,
                                          imeis: _model.deviceImeiValue,
                                          dtFrom: _model.startDate,
                                          dtTo: _model.endDate,
                                          jwt: FFAppState().userJwt,
                                          sensors: _model.sensorValue,
                                        );

                                        if ((_model.pdfReport?.succeeded ??
                                            true)) {
                                          await launchURL(getJsonField(
                                            (_model.pdfReport?.jsonBody ?? ''),
                                            r'''$.pdf_url''',
                                          ).toString());
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.pdfReport?.jsonBody ??
                                                      ''),
                                                  r'''$.msg''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'ea5acqve' /*  Report */,
                                      ),
                                      icon: FaIcon(
                                        FontAwesomeIcons.fileDownload,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 44.4,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 8.0, 0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
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
    );
  }
}
