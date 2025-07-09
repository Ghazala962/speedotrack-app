import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'onboarding03_model.dart';
export 'onboarding03_model.dart';

class Onboarding03Widget extends StatefulWidget {
  const Onboarding03Widget({super.key});

  static String routeName = 'Onboarding03';
  static String routePath = '/onboarding03';

  @override
  State<Onboarding03Widget> createState() => _Onboarding03WidgetState();
}

class _Onboarding03WidgetState extends State<Onboarding03Widget> {
  late Onboarding03Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding03Model());

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
        body: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 670.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/gps-pin-icon-with-lines-dots-connecting-blue-color-white-background_99087-13.jpg',
                        ).image,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0x00FFFFFF),
                                FlutterFlowTheme.of(context).secondaryBackground
                              ],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 1.0),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.07, 0.22),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/34338d26023e5515f6cc8969aa027bca.gif',
                              width: 200.0,
                              height: 135.91,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.22, 0.48),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '71hkabf4' /* Please wait while we fetch dat... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 20.0,
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
        ),
      ),
    );
  }
}
