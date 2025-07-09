import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'logout_vson_model.dart';
export 'logout_vson_model.dart';

class LogoutVsonWidget extends StatefulWidget {
  const LogoutVsonWidget({super.key});

  @override
  State<LogoutVsonWidget> createState() => _LogoutVsonWidgetState();
}

class _LogoutVsonWidgetState extends State<LogoutVsonWidget> {
  late LogoutVsonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoutVsonModel());

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
      child: Container(
        width: 366.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'twj0g0yp' /* Logout */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'arial',
                          color: FlutterFlowTheme.of(context).secondary,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Container(
                height: 46.0,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '5dps1fxc' /* Are  you sure you want to logo... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: FlutterFlowTheme.of(context).textfieldColor,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().userJwt = '';
                      safeSetState(() {});
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth(
                          VsenSplashScreenWidget.routeName, context.mounted);
                    },
                    text: FFLocalizations.of(context).getText(
                      '60rcysse' /* YES */,
                    ),
                    options: FFButtonOptions(
                      width: 263.0,
                      height: 36.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: FFLocalizations.of(context).getText(
                    'kn28p1af' /* NO */,
                  ),
                  options: FFButtonOptions(
                    width: 263.0,
                    height: 36.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'arial',
                          color: Colors.black,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFF9F9F9F),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
