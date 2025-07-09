import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'Login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isTripUserLoggedIn = false;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().userName,
      'demo',
    ));
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().password,
      '123456',
    ));
    _model.textFieldFocusNode2 ??= FocusNode();

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                Theme.of(context).brightness == Brightness.dark
                                    ? 'assets/images/New_Mr.GPS_Logo_-_green_n_white-01_1.png'
                                    : 'assets/images/mr.gps.logo.light_theme.png',
                                width: 134.0,
                                height: 81.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 50.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '8jz9e633' /* Login */,
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
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: FlutterFlowLanguageSelector(
                                width: 125.0,
                                height: 38.0,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderColor: Colors.transparent,
                                dropdownIconColor:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                borderRadius: 8.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                hideFlags: false,
                                flagSize: 24.0,
                                flagTextGap: 3.0,
                                currentLanguage:
                                    FFLocalizations.of(context).languageCode,
                                languages: FFLocalizations.languages(),
                                onChanged: (lang) =>
                                    setAppLanguage(context, lang),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 0.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'a85fklid' /* Access to Platform to track yo... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 8.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 331.78,
                                child: TextFormField(
                                  controller: _model.textController1,
                                  focusNode: _model.textFieldFocusNode1,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .textfieldColor,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'bgiqv8oc' /* Username */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .textfieldColor,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9F9F9F),
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9F9F9F),
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        color: FlutterFlowTheme.of(context)
                                            .textfieldColor,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController1Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 10.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 331.78,
                                child: TextFormField(
                                  controller: _model.textController2,
                                  focusNode: _model.textFieldFocusNode2,
                                  autofocus: false,
                                  obscureText: !_model.passwordVisibility,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .textfieldColor,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '6olavo1o' /* Password */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .textfieldColor,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9F9F9F),
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9F9F9F),
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    suffixIcon: InkWell(
                                      onTap: () => safeSetState(
                                        () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0xFFCCCCCC),
                                        size: 14.0,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        color: FlutterFlowTheme.of(context)
                                            .textfieldColor,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textController2Validator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 10.0, 40.0, 0.0),
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
                                value: _model.checkboxValue ??= true,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue = newValue!);
                                },
                                side: (FlutterFlowTheme.of(context).alternate !=
                                        null)
                                    ? BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                      )
                                    : null,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '0wt0mfws' /* Remember Me */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
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
                                    context.pushNamed(
                                        ForgotPasswordWidget.routeName);
                                  },
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '2qypi8lo' /* Forgot your Password? */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 40.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                _model.loginApiRes =
                                    await NewSpeedotrackJSApiGroup.loginApiCall
                                        .call(
                                  uname: _model.textController1.text,
                                  pwd: _model.textController2.text,
                                );

                                if ((_model.loginApiRes?.succeeded ?? true)) {
                                  FFAppState().userJwt = getJsonField(
                                    (_model.loginApiRes?.jsonBody ?? ''),
                                    r'''$.token''',
                                  ).toString();
                                  FFAppState().password =
                                      _model.textController2.text;
                                  FFAppState().userName =
                                      _model.textController1.text;
                                  FFAppState().userLoginDetails =
                                      (_model.loginApiRes?.jsonBody ?? '');
                                  FFAppState().ChangeAccountJWT = getJsonField(
                                    (_model.loginApiRes?.jsonBody ?? ''),
                                    r'''$.token''',
                                  ).toString();
                                  FFAppState()
                                      .addToSelectedColumItems('DEVICENAME');
                                  safeSetState(() {});
                                  if (_model.checkboxValue!) {
                                    FFAppState().userName =
                                        _model.textController1.text;
                                    FFAppState().password =
                                        _model.textController2.text;
                                    safeSetState(() {});
                                  } else {
                                    FFAppState().userName = '';
                                    safeSetState(() {});
                                    FFAppState().password = '';
                                    safeSetState(() {});
                                  }

                                  FFAppState()
                                      .addToSelectedColumItems('DEVICEIMEI');
                                  safeSetState(() {});

                                  context.goNamed(
                                      VsenSplashScreenWidget.routeName);

                                  await actions.onesignalLogin(
                                    FFAppState().userName,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please check your username or password',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                  _model.tripUserLogin =
                                      await NewSpeedotrackJSApiGroup
                                          .tripLoginApiCall
                                          .call(
                                    username: _model.textController1.text,
                                    password: _model.textController2.text,
                                    jwt: FFAppState().userJwt,
                                  );

                                  if ((_model.tripUserLogin?.succeeded ??
                                      true)) {
                                    FFAppState().userJwt = getJsonField(
                                      (_model.tripUserLogin?.jsonBody ?? ''),
                                      r'''$.token''',
                                    ).toString();
                                    FFAppState().password =
                                        _model.textController2.text;
                                    FFAppState().userName =
                                        _model.textController1.text;
                                    FFAppState().userLoginDetails =
                                        (_model.tripUserLogin?.jsonBody ?? '');
                                    safeSetState(() {});

                                    context.goNamed(
                                        VsenSplashScreenWidget.routeName);

                                    await actions.onesignalLogin(
                                      FFAppState().userName,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please check your username or password',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                      ),
                                    );
                                  }
                                }

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'iuvxkr9j' /* LOGIN */,
                              ),
                              options: FFButtonOptions(
                                width: 263.0,
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 12.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(SignUpWidget.routeName);
                              },
                              text: FFLocalizations.of(context).getText(
                                'outmni31' /* SIGNUP */,
                              ),
                              options: FFButtonOptions(
                                width: 263.0,
                                height: 36.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFFF1F2F2),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'arial',
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFF1F2F2),
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            40.0, 90.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'ajwqtfyd' /* By successful login, you agree... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            60.0, 4.0, 40.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '1w2ulf2j' /* Terms & Conditions */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'imfym9wr' /* and  */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'eufk6yym' /* Privacy Policy. */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                40.0, 4.0, 40.0, 30.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 4.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '6634apgw' /* Powered by VSEEN®
V 1.0 */
                                          ,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textfieldColor,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
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
