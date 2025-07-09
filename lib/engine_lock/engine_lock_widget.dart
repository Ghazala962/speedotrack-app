import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'engine_lock_model.dart';
export 'engine_lock_model.dart';

class EngineLockWidget extends StatefulWidget {
  const EngineLockWidget({
    super.key,
    this.deviceData,
  });

  final dynamic deviceData;

  static String routeName = 'EngineLock';
  static String routePath = '/engineLock';

  @override
  State<EngineLockWidget> createState() => _EngineLockWidgetState();
}

class _EngineLockWidgetState extends State<EngineLockWidget> {
  late EngineLockModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EngineLockModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLoading = true;
      safeSetState(() {});
      _model.getDeviceCommandsRes =
          await PhpApiGroupGroup.getUserCommandsExecCall.call(
        userApiKey: FFAppState().userJwt,
        deviceImeiForCommandList: getJsonField(
          widget.deviceData,
          r'''$.imei''',
        ).toString().toString(),
      );

      if ((_model.getDeviceCommandsRes?.succeeded ?? true)) {
        _model.isLoading = false;
        safeSetState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to get Commands of this device.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      }
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '8ve69jw2' /* Engine Lock */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'arial',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 369.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.deviceData,
                                                  r'''$.name''',
                                                )?.toString(),
                                                'Device Name',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  widget.deviceData,
                                                  r'''$.model''',
                                                )?.toString(),
                                                'Device Name',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 40.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? 'assets/images/201-2017419_black-car-png-transparent-background-car-3d-png.png'
                                                  : 'assets/images/eff29127abbf0d8e5e99cda29401fa7f.png',
                                              width: 300.0,
                                              height: 193.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.getGpsCommandRes =
                                      await PhpApiGroupGroup
                                          .gprsCommandEngineLockUnlockCall
                                          .call(
                                    userApiKey: FFAppState().userJwt,
                                    deviceImeiForLockUnlock: getJsonField(
                                      widget.deviceData,
                                      r'''$.imei''',
                                    ).toString(),
                                    lockUnlockCommandForDevice: functions
                                        .seperateLockUnlockCommandFromStringCopy(
                                            getJsonField(
                                          widget.deviceData,
                                          r'''$.model''',
                                        ).toString())
                                        ?.firstOrNull,
                                  );

                                  if ((_model.getGpsCommandRes?.succeeded ??
                                      true)) {
                                    if ((_model.getGpsCommandRes?.bodyText ??
                                            '') ==
                                        'fail') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Failed to send Command',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 5000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Command Sent !',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'bhnerc87' /* Lock */,
                                ),
                                icon: Icon(
                                  Icons.lock,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: 120.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'arial',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.getGpsCommandResUnlock =
                                        await PhpApiGroupGroup
                                            .gprsCommandEngineLockUnlockCall
                                            .call(
                                      userApiKey: FFAppState().userJwt,
                                      deviceImeiForLockUnlock: getJsonField(
                                        widget.deviceData,
                                        r'''$.imei''',
                                      ).toString(),
                                      lockUnlockCommandForDevice: functions
                                          .seperateLockUnlockCommandFromStringCopy(
                                              getJsonField(
                                            widget.deviceData,
                                            r'''$.model''',
                                          ).toString())
                                          ?.lastOrNull,
                                    );

                                    if ((_model.getGpsCommandResUnlock
                                            ?.succeeded ??
                                        true)) {
                                      if ((_model.getGpsCommandResUnlock
                                                  ?.bodyText ??
                                              '') ==
                                          'fail') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Failed to send Command',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 5000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Command Sent !',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .success,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'udwy3vsq' /* Unlock */,
                                  ),
                                  icon: Icon(
                                    Icons.lock_open,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 128.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).info,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'arial',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
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
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(CommandHistoryWidget.routeName);
                      },
                      text: FFLocalizations.of(context).getText(
                        'h49m4xfl' /* Get Commands List */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
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
