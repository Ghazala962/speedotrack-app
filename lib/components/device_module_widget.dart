import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'device_module_model.dart';
export 'device_module_model.dart';

class DeviceModuleWidget extends StatefulWidget {
  const DeviceModuleWidget({super.key});

  @override
  State<DeviceModuleWidget> createState() => _DeviceModuleWidgetState();
}

class _DeviceModuleWidgetState extends State<DeviceModuleWidget> {
  late DeviceModuleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceModuleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          width: 336.57,
          height: 404.5,
          decoration: BoxDecoration(
            color: Color(0xE7000000),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x34090F13),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '8xjcxv11' /* JH 01ES 4957 (B29) */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: Color(0xFF64CB61),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 30.0,
                                          buttonSize: 40.0,
                                          fillColor: Color(0x3FAFB5B9),
                                          icon: Icon(
                                            Icons.close_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.49, -0.47),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFFEC732E),
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: Color(0xFFEC732E),
                                icon: Icon(
                                  Icons.share_sharp,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.44, 0.46),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFFEC732E),
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: Color(0xFFEC732E),
                                icon: Icon(
                                  Icons.assignment_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.61, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.call,
                                  color: Color(0xFF33322E),
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.49, -0.43),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFF4689F7),
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: Color(0xFF4689F7),
                                icon: Icon(
                                  Icons.warning_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.66, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFF3E8737),
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: Color(0xFF3E8737),
                                icon: Icon(
                                  Icons.insert_chart_outlined_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.03, 0.65),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFF3E8737),
                                borderRadius: 30.0,
                                buttonSize: 55.0,
                                fillColor: Color(0xFF3E8737),
                                icon: Icon(
                                  Icons.lock_sharp,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.48, 0.43),
                              child: Container(
                                width: 55.0,
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ljxdcu2m' /* P */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: Color(0xFF3E8737),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.04, -0.64),
                              child: Container(
                                width: 55.0,
                                height: 55.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/map.png',
                                        width: 20.0,
                                        height: 20.0,
                                        fit: BoxFit.cover,
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
      ),
    );
  }
}
