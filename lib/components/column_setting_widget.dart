import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'column_setting_model.dart';
export 'column_setting_model.dart';

class ColumnSettingWidget extends StatefulWidget {
  const ColumnSettingWidget({super.key});

  @override
  State<ColumnSettingWidget> createState() => _ColumnSettingWidgetState();
}

class _ColumnSettingWidgetState extends State<ColumnSettingWidget> {
  late ColumnSettingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColumnSettingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
        child: Container(
          width: 366.0,
          height: 333.27,
          constraints: BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 18.0, 24.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '90z52ure' /* Column Settings */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'arial',
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        FFIcons.kcross,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Text(
                    functions
                        .checkLessThanThree(valueOrDefault<int>(
                          FFAppState().selectedDeviceForTrack.length,
                          0,
                        ))
                        .toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'arial',
                          letterSpacing: 0.0,
                        ),
                  ),
                Divider(
                  height: 24.0,
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue1 ??= valueOrDefault<bool>(
                            FFAppState()
                                .SelectedColumItems
                                .contains(FFAppConstants.DEVICENAME),
                            true,
                          ),
                          onChanged: !functions
                                  .checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue1 = newValue!);
                                  if (newValue!) {
                                    if (functions
                                        .checkLessThanThree(valueOrDefault<int>(
                                      FFAppState()
                                          .selectedDeviceForTrack
                                          .length,
                                      0,
                                    ))) {
                                      FFAppState().addToSelectedColumItems(
                                          'DEVICENAME');
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().removeFromSelectedColumItems(
                                        'DEVICENAME');
                                    safeSetState(() {});
                                  }
                                },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor:
                              !functions.checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'gi8eon76' /* Vehicle Name */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kcolumnSettingIcon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue2 ??= valueOrDefault<bool>(
                            FFAppState()
                                .SelectedColumItems
                                .contains(FFAppConstants.DEVICEIMEI),
                            true,
                          ),
                          onChanged: !functions
                                  .checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue2 = newValue!);
                                  if (newValue!) {
                                    if (functions
                                        .checkLessThanThree(valueOrDefault<int>(
                                      FFAppState()
                                          .selectedDeviceForTrack
                                          .length,
                                      0,
                                    ))) {
                                      FFAppState().addToSelectedColumItems(
                                          'DEVICEIMEI');
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().removeFromSelectedColumItems(
                                        'DEVICEIMEI');
                                    safeSetState(() {});
                                  }
                                },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor:
                              !functions.checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'e1rcbhgs' /* Vehicle Imei */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kcolumnSettingIcon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue3 ??= valueOrDefault<bool>(
                            FFAppState()
                                .SelectedColumItems
                                .contains(FFAppConstants.DEVICEMODEL),
                            true,
                          ),
                          onChanged: !functions
                                  .checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue3 = newValue!);
                                  if (newValue!) {
                                    if (functions
                                        .checkLessThanThree(valueOrDefault<int>(
                                      FFAppState()
                                          .selectedDeviceForTrack
                                          .length,
                                      0,
                                    ))) {
                                      FFAppState().addToSelectedColumItems(
                                          'DEVICEMODEL');
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().removeFromSelectedColumItems(
                                        'DEVICEMODEL');
                                    safeSetState(() {});
                                  }
                                },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor:
                              !functions.checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3goses3e' /* Model */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kcolumnSettingIcon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue4 ??= valueOrDefault<bool>(
                            FFAppState()
                                .SelectedColumItems
                                .contains(FFAppConstants.EXPIRYDATE),
                            true,
                          ),
                          onChanged: !functions
                                  .checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue4 = newValue!);
                                  if (newValue!) {
                                    if (functions
                                        .checkLessThanThree(valueOrDefault<int>(
                                      FFAppState()
                                          .selectedDeviceForTrack
                                          .length,
                                      0,
                                    ))) {
                                      FFAppState().addToSelectedColumItems(
                                          'EXPIRYDATE');
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().removeFromSelectedColumItems(
                                        'EXPIRYDATE');
                                    safeSetState(() {});
                                  }
                                },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor:
                              !functions.checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '3bjlwc2l' /* Expiry Date */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kcolumnSettingIcon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).alternate,
                        ),
                        child: Checkbox(
                          value: _model.checkboxValue5 ??= valueOrDefault<bool>(
                            FFAppState()
                                .SelectedColumItems
                                .contains(FFAppConstants.ODOMETER),
                            true,
                          ),
                          onChanged: !functions
                                  .checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                              ? null
                              : (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue5 = newValue!);
                                  if (newValue!) {
                                    if (functions
                                        .checkLessThanThree(valueOrDefault<int>(
                                      FFAppState()
                                          .selectedDeviceForTrack
                                          .length,
                                      0,
                                    ))) {
                                      FFAppState()
                                          .addToSelectedColumItems('ODOMETER');
                                      safeSetState(() {});
                                    }
                                  } else {
                                    FFAppState().removeFromSelectedColumItems(
                                        'ODOMETER');
                                    safeSetState(() {});
                                  }
                                },
                          side: (FlutterFlowTheme.of(context).alternate != null)
                              ? BorderSide(
                                  width: 2,
                                  color:
                                      FlutterFlowTheme.of(context).alternate,
                                )
                              : null,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          checkColor:
                              !functions.checkLessThanThree(valueOrDefault<int>(
                            FFAppState().selectedDeviceForTrack.length,
                            0,
                          ))
                                  ? null
                                  : FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'g3ofsgr1' /* Odometer */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Icon(
                            FFIcons.kcolumnSettingIcon,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
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
    );
  }
}
