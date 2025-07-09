import '/components/drawer_component_widget.dart';
import '/components/idling_alarm_setting_widget.dart';
import '/components/overspeed_alarm_setting_widget.dart';
import '/components/stop_alarm_setting_widget.dart';
import '/components/temperature_alarm_setting_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'alarm_notification_model.dart';
export 'alarm_notification_model.dart';

class AlarmNotificationWidget extends StatefulWidget {
  const AlarmNotificationWidget({super.key});

  static String routeName = 'Alarm_notification';
  static String routePath = '/alarmNotification';

  @override
  State<AlarmNotificationWidget> createState() =>
      _AlarmNotificationWidgetState();
}

class _AlarmNotificationWidgetState extends State<AlarmNotificationWidget> {
  late AlarmNotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlarmNotificationModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchValue3 = true;
    _model.switchValue4 = true;
    _model.switchValue5 = true;
    _model.switchValue6 = true;
    _model.switchValue7 = true;
    _model.switchValue8 = true;
    _model.switchValue9 = true;
    _model.switchValue10 = true;
    _model.switchValue11 = true;
    _model.switchValue12 = true;
    _model.switchValue13 = true;
    _model.switchValue14 = true;
    _model.switchValue15 = false;
    _model.switchValue16 = false;
    _model.switchValue17 = false;
    _model.switchValue18 = false;
    _model.switchValue19 = false;
    _model.switchValue20 = false;
    _model.switchValue21 = true;
    _model.switchValue22 = true;
    _model.switchValue23 = true;
    _model.switchValue24 = false;
    _model.switchValue25 = true;
    _model.switchValue26 = true;
    _model.switchValue27 = false;
    _model.switchValue28 = true;
    _model.switchValue29 = true;
    _model.switchValue30 = false;
    _model.switchValue31 = false;
    _model.switchValue32 = true;
    _model.switchValue33 = true;
    _model.switchValue34 = true;
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
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
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 17.0,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (_model.showSearch == true) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 41.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'phb144pc' /* Alarm Notification */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: InkWell(
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
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        FFIcons
                                                            .kmagnifyingGlassSvgrepoCom,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
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
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 100.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
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
                                                      Icon(
                                                        FFIcons
                                                            .kmagnifyingGlassSvgrepoCom,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 18.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width: 200.0,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'vkn2c74k' /* Search */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
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
                                                        onTap: () async {
                                                          _model.showSearch =
                                                              true;
                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          FFIcons.kcross,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
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
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                14.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context
                                    .pushNamed(ChangeAccountWidget.routeName);
                              },
                              child: Icon(
                                FFIcons.kviTOyw01,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 26.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'x7jt31fn' /* Sound */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue1!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue1 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '7fqcmw08' /* Vibration */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue2!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue2 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '3qgmgx8x' /* Ringtone Type */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'e8g8l6b3' /* Option 1 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '7t4nnmjz' /* Option 2 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'wod4h8m4' /* Option 3 */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue = val),
                                width: 115.38,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'igwzdgq1' /* Car Horn */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '1kevbzfq' /* All Day */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue3!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue3 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ohpj4v1f' /* Start Time */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o4frde9c' /* 00:00 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'g7dfy282' /* End Time */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        14.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'dls7lsv6' /* 23:59 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'gsckmufq' /* M */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'vhaatlfo' /* T */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'mv1tck4z' /* W */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'fdi5ejp3' /* T */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6oho5xzq' /* F */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lk6hvun1' /* S */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ogn25lxi' /* S */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                    ),
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'i32u25wq' /* All Alarm */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.switchValue4!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue4 = newValue);
                        },
                        activeColor: FlutterFlowTheme.of(context).alternate,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '29n9jhmb' /* Ignition On / Off */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Switch.adaptive(
                        value: _model.switchValue5!,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.switchValue5 = newValue);
                        },
                        activeColor: FlutterFlowTheme.of(context).alternate,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        inactiveThumbColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'wk281e84' /* Vehicle Power Connect / Cut Of... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue6!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue6 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '012kxb91' /* Vehicle Low Battery */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue7!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue7 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zbv8qa6z' /* Device Battery Connect / Disco... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).secondary,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue8!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue8 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'kje2dlnw' /* Device Low Battery */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue9!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue9 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'c51n4vad' /* Moving Start */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue10!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue10 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
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
                                  child: IdlingAlarmSettingWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'u2okhjls' /* Idling   */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'v852cahh' /* (30 Min) */,
                                ),
                                style: TextStyle(
                                  color: Color(0xFF717379),
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue11!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue11 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
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
                                  child: StopAlarmSettingWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'ycgefilx' /* Stop   */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'wsw1y449' /* (1 Min) */,
                                ),
                                style: TextStyle(
                                  color: Color(0xFF717379),
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue12!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue12 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
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
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: OverspeedAlarmSettingWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '5eitqmhd' /* Overspeed   */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '2sgjf1pl' /* ( 110 km/hr, 1 min ) */,
                                  ),
                                  style: TextStyle(
                                    color: Color(0xFF717379),
                                    fontSize: 16.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue13!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue13 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'gwj82ucr' /* Geofence Enter / Exit */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue14!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue14 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '5wtfhn3o' /* Towing */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue15!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue15 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'jyqk01h1' /* Impact */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue16!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue16 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'lj1pbhqf' /* Sudden Acceleration */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue17!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue17 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '4kwxrbdt' /* Sudden Cornering */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue18!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue18 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '5m6vwlix' /* Harsh Braking */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue19!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue19 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'kf0spep5' /* Harsh Turning */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue20!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue20 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'p3wtue8x' /* GPS Connect / No Signal */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue21!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue21 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'vyhzt52c' /* GSM / GPRS Connect / No Signal */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue22!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue22 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'c5fki3wo' /* GSM Jammer Start / Stop */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue23!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue23 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'g385afx2' /* INPUT */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue24!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue24 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kgk6hou5' /* Panic / SOS */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue25!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue25 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '8etcm5do' /* PTO On / Off */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue26!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue26 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '6lp074za' /* Door Open / Close */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue27!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue27 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'kn9ezrx8' /* AC On / Off */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue28!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue28 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 18.0, 30.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '1y6x105s' /* OUTPUT (Remote Control) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '4w4q6kzd' /* Lock / Unlock Engine */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'owgmsjws' /* (Immobilize / Mobilize) */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue29!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue29 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'pyph9jj4' /* Car Horn / Buzzer (On / Off) */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue30!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue30 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'sy6sqqz6' /* Door Lock / Unlock */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Switch.adaptive(
                                  value: _model.switchValue31!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue31 = newValue);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor:
                                      FlutterFlowTheme.of(context).primary,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context).toggleColor,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 18.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'qim20ul9' /* Fuel */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ut1uhs1u' /* Refuel / Fuel Theft (Drain) */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue32!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue32 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '3t8f4yq6' /* Low Fuel */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue33!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue33 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 6.0, 25.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  's0otp6xy' /* Fuel Sensor Connect / Disconne... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Switch.adaptive(
                                value: _model.switchValue34!,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.switchValue34 = newValue);
                                },
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                inactiveTrackColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                inactiveThumbColor:
                                    FlutterFlowTheme.of(context).alternate,
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 18.0, 30.0, 0.0),
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
                              child: TemperatureAlarmSettingWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '7irush3k' /* Temperature */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30.0, 8.0, 30.0, 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent1,
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
    );
  }
}
