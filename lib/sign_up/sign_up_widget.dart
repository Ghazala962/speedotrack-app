import '/backend/api_requests/api_calls.dart';
import '/components/select_country_code_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  static String routeName = 'Sign-up';
  static String routePath = '/signUp';

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isTripUserLoggedIn = false;
      safeSetState(() {});
    });

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.mobileNoTextController ??= TextEditingController();
    _model.mobileNoFocusNode ??= FocusNode();

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.usernameTextController ??= TextEditingController();
    _model.usernameFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmTextController ??= TextEditingController();
    _model.confirmFocusNode ??= FocusNode();

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
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
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
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
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation']!),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 45.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ph1pnxdy' /* Sign Up */,
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
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: FlutterFlowLanguageSelector(
                          width: 125.0,
                          height: 38.0,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderColor: Colors.transparent,
                          dropdownIconColor: Color(0xFF9F9F9F),
                          borderRadius: 8.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                          hideFlags: false,
                          flagSize: 24.0,
                          flagTextGap: 3.0,
                          currentLanguage:
                              FFLocalizations.of(context).languageCode,
                          languages: FFLocalizations.languages(),
                          onChanged: (lang) => setAppLanguage(context, lang),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'mphuf2j3' /* Please key in correct email an... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 8.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 331.78,
                          child: TextFormField(
                            controller: _model.nameTextController,
                            focusNode: _model.nameFocusNode,
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
                              hintText: FFLocalizations.of(context).getText(
                                'x6p3ufrf' /* Name */,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
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
                            validator: _model.nameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 8.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFF9F9F9F),
                              width: 0.5,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
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
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SelectCountryCodeWidget(
                                              countryCode:
                                                  _model.selectedCountryCode,
                                              country: _model.selectedCountry,
                                              setCountryCode: (code) async {
                                                _model.selectedCountryCode =
                                                    code;
                                                safeSetState(() {});
                                              },
                                              setCountry: (country) async {
                                                _model.selectedCountry =
                                                    country;
                                                safeSetState(() {});
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.selectedCountryCode ==
                                              '+91') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/india-1617463_1280_1.png',
                                                width: 28.0,
                                                height: 16.0,
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+60') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Malaysia.svg_(1).png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+880') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Bangladesh.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+92') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Pakistan.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+977') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Nepal.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+66') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/images_(1).png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+98') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Iran.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+966') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Saudi_Arabia.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+86') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_China.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+62') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Indonesia.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+1') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Puerto_Rico.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+254') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Kenya.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+94') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Sri_Lanka.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+212') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_Morocco.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else if (_model
                                                  .selectedCountryCode ==
                                              '+27') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/Flag_of_South_Africa.svg.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/india-1617463_1280_1.png',
                                                  width: 28.0,
                                                  height: 16.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 4.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  _model.selectedCountryCode,
                                                  '+91',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Container(
                                      width: 331.78,
                                      child: TextFormField(
                                        controller:
                                            _model.mobileNoTextController,
                                        focusNode: _model.mobileNoFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'arial',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textfieldColor,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'yhv8rypr' /* 123456789 */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'arial',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textfieldColor,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .textfieldColor,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .mobileNoTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 331.78,
                          child: TextFormField(
                            controller: _model.emailTextController,
                            focusNode: _model.emailFocusNode,
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
                              hintText: FFLocalizations.of(context).getText(
                                'rjeeoi6r' /* Email */,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
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
                            validator: _model.emailTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 30.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '158z7tck' /* Create Login */,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40.0, 6.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 331.78,
                          child: TextFormField(
                            controller: _model.usernameTextController,
                            focusNode: _model.usernameFocusNode,
                            autofocus: false,
                            textCapitalization: TextCapitalization.none,
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
                              hintText: FFLocalizations.of(context).getText(
                                'ju4s1x8p' /* Username */,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
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
                            maxLength: 15,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.usernameTextControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              if (!isAndroid && !isiOS)
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  return TextEditingValue(
                                    selection: newValue.selection,
                                    text: newValue.text.toCapitalization(
                                        TextCapitalization.none),
                                  );
                                }),
                              FilteringTextInputFormatter.allow(
                                  RegExp('^[a-z0-9]+\$'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 331.78,
                          child: TextFormField(
                            controller: _model.passwordTextController,
                            focusNode: _model.passwordFocusNode,
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
                              hintText: FFLocalizations.of(context).getText(
                                'f7phnwua' /* Password */,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
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
                            validator: _model.passwordTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 10.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 331.78,
                          child: TextFormField(
                            controller: _model.confirmTextController,
                            focusNode: _model.confirmFocusNode,
                            autofocus: false,
                            obscureText: !_model.confirmVisibility,
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
                              hintText: FFLocalizations.of(context).getText(
                                'yu6cat63' /* Confirm Password */,
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
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.confirmVisibility =
                                      !_model.confirmVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.confirmVisibility
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
                            validator: _model.confirmTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (_model.passwordTextController.text ==
                              _model.confirmTextController.text) {
                            _model.signupResult = await NewSpeedotrackJSApiGroup
                                .signUpApiCall
                                .call(
                              name: _model.nameTextController.text,
                              username: _model.usernameTextController.text,
                              email: _model.emailTextController.text,
                              countryCode: _model.selectedCountryCode,
                              number: int.tryParse(
                                  _model.mobileNoTextController.text),
                              password: _model.passwordTextController.text,
                              jwt: FFAppState().userJwt,
                              country: _model.selectedCountry,
                            );

                            if ((_model.signupResult?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.signupResult?.jsonBody ?? ''),
                                      r'''$.msg''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).success,
                                ),
                              );
                              _model.loginApiRes =
                                  await NewSpeedotrackJSApiGroup.loginApiCall
                                      .call(
                                uname: _model.usernameTextController.text,
                                pwd: _model.passwordTextController.text,
                              );

                              if ((_model.loginApiRes?.succeeded ?? true)) {
                                FFAppState().userJwt = getJsonField(
                                  (_model.loginApiRes?.jsonBody ?? ''),
                                  r'''$.token''',
                                ).toString();
                                FFAppState().userLoginDetails =
                                    (_model.loginApiRes?.jsonBody ?? '');
                                FFAppState().ChangeAccountJWT = getJsonField(
                                  (_model.loginApiRes?.jsonBody ?? ''),
                                  r'''$.token''',
                                ).toString();
                                FFAppState()
                                    .addToSelectedColumItems('DEVICENAME');
                                safeSetState(() {});

                                context.pushNamed(AddDeviceWidget.routeName);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Unable to login',
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
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.signupResult?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).cerise,
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Password And Confirm Password Not Sam',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );
                          }

                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'q0ksxnws' /* SIGN UP */,
                        ),
                        options: FFButtonOptions(
                          width: 263.0,
                          height: 36.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 12.0, 40.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(LoginWidget.routeName);
                        },
                        text: FFLocalizations.of(context).getText(
                          'va3o2v6s' /* CANCEL */,
                        ),
                        options: FFButtonOptions(
                          width: 263.0,
                          height: 36.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
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
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 4.0, 40.0, 30.0),
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
                                    'iuqnw0n9' /* Powered by VSEEN®
V 1.0 */
                                    ,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        color: FlutterFlowTheme.of(context)
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
        ),
      ),
    );
  }
}
