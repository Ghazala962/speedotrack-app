import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'device_component_model.dart';
export 'device_component_model.dart';

class DeviceComponentWidget extends StatefulWidget {
  const DeviceComponentWidget({super.key});

  @override
  State<DeviceComponentWidget> createState() => _DeviceComponentWidgetState();
}

class _DeviceComponentWidgetState extends State<DeviceComponentWidget> {
  late DeviceComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'am13kxin' /* ABCD1234 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'arial',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'nvqforxz' /* Inactive */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                        child: Theme(
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
                            value: _model.checkboxValue ??= true,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue = newValue!);
                            },
                            side: (FlutterFlowTheme.of(context).alternate !=
                                    null)
                                ? BorderSide(
                                    width: 2,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  )
                                : null,
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 120.0,
              decoration: BoxDecoration(),
              child: Text(
                FFLocalizations.of(context).getText(
                  'qd3uhu7j' /* Device Model */,
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
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.more_vert,
                  color: FlutterFlowTheme.of(context).textfieldColor,
                  size: 16.0,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '468q7h6d' /* FMB920 */,
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
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    's514p7tk' /* Device IMEI */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ffpkhkos' /* 123456789101112 */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'hitr9p3y' /* SIM ICCID */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'm88h0jy0' /* 60123456789 */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'inmvhufd' /* Plan */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qygdpyv6' /* Unlimited Plan */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qbnmt9eg' /* Expiry */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ppx34b0l' /* Unlimited */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'zbrfb62o' /* Expiry */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'w82a2e3f' /* Unlimited */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 120.0,
                decoration: BoxDecoration(),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'xhzvomzs' /* Device Warranty */,
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.more_vert,
                    color: FlutterFlowTheme.of(context).textfieldColor,
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '55dmdh7s' /* 30/05/2025 */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '6tm1s7vz' /* 0 Days */,
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
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: 100.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEAEC),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
