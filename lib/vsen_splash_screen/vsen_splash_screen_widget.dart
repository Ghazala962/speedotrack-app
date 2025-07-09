import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'vsen_splash_screen_model.dart';
export 'vsen_splash_screen_model.dart';

class VsenSplashScreenWidget extends StatefulWidget {
  const VsenSplashScreenWidget({super.key});

  static String routeName = 'VsenSplashScreen';
  static String routePath = '/vsenSplashScreen';

  @override
  State<VsenSplashScreenWidget> createState() => _VsenSplashScreenWidgetState();
}

class _VsenSplashScreenWidgetState extends State<VsenSplashScreenWidget> {
  late VsenSplashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VsenSplashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isTripUserLoggedIn == true) {
        if (FFAppState().userJwt != '') {
          context.pushNamed(TripDashboardWidget.routeName);
        } else {
          context.goNamed(LoginWidget.routeName);
        }
      } else {
        if (FFAppState().userJwt != '') {
          _model.initialDeviceDataRes =
              await NewSpeedotrackJSApiGroup.loadDeviceDataApiCall.call(
            jwt: FFAppState().userJwt,
          );

          if ((_model.initialDeviceDataRes?.succeeded ?? true)) {
            FFAppState().allDeviceData =
                functions.returnDevicesList(getJsonField(
              (_model.initialDeviceDataRes?.jsonBody ?? ''),
              r'''$.result''',
              true,
            )!);
            FFAppState().trackingData =
                (_model.initialDeviceDataRes?.jsonBody ?? '');
            safeSetState(() {});
            _model.getSelfRes = await NewSpeedotrackJSApiGroup.getSelfCall.call(
              jwt: FFAppState().userJwt,
            );

            if ((_model.getSelfRes?.succeeded ?? true)) {
              FFAppState().userSelfData = (_model.getSelfRes?.jsonBody ?? '');
              safeSetState(() {});
            }

            context.goNamed(
              ListViewDesignWidget.routeName,
              queryParameters: {
                'filterValueParam': serializeParam(
                  'all',
                  ParamType.String,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.rightToLeft,
                ),
              },
            );

            if (FFAppState().isDarkMode) {
              setDarkModeSetting(context, ThemeMode.dark);
            } else {
              setDarkModeSetting(context, ThemeMode.light);
            }
          } else {
            FFAppState().userJwt = '';
            safeSetState(() {});
            await actions.onesignalLogout(
              FFAppState().userName,
            );

            context.goNamed(LoginWidget.routeName);
          }
        } else {
          context.goNamed(LoginWidget.routeName);
        }
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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
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
                            context.pushNamed(SignUpWidget.routeName);
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
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
            Align(
              alignment: AlignmentDirectional(0.04, 0.01),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/New_Mr.GPS_Logo_-_green_n_white-01_1.png'
                      : 'assets/images/mr.gps.logo.light_theme.png',
                  width: 200.0,
                  height: 111.99,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
