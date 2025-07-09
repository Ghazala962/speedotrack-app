import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'send_command_model.dart';
export 'send_command_model.dart';

class SendCommandWidget extends StatefulWidget {
  const SendCommandWidget({super.key});

  @override
  State<SendCommandWidget> createState() => _SendCommandWidgetState();
}

class _SendCommandWidgetState extends State<SendCommandWidget>
    with TickerProviderStateMixin {
  late SendCommandModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendCommandModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue1 = true;
    _model.switchValue2 = true;
    _model.switchValue3 = true;
    _model.switchValue4 = true;
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        padding: EdgeInsets.all(22.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x34000000),
                offset: Offset(
                  -2.0,
                  5.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x1E000000),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'vb0ay8h1' /* Send Command */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'arial',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 30.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'ygh2673c' /* Send to -- */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  34.0, 0.0, 0.0, 15.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '07p2badh' /* Option 1 */,
                                  )
                                ],
                                onChanged: (val) => safeSetState(
                                    () => _model.dropDownValue1 = val),
                                width: 214.0,
                                height: 45.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'nyhoxgoj' /* Please select... */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).alternate,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '8d61iakw' /* Subject -- */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                34.0, 0.0, 8.0, 15.0),
                            child: Container(
                              width: 214.0,
                              child: TextFormField(
                                controller: _model.textController1,
                                focusNode: _model.textFieldFocusNode1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'pjoih4vn' /* subject */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'arial',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textController1Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'b5ceowhw' /* username */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                35.0, 0.0, 0.0, 15.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<String>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'jxknkrx3' /* Option 1 */,
                                )
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.dropDownValue2 = val),
                              width: 214.0,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                'trqwdkp2' /* Please select... */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 10.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '36yo2ja0' /* Message */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                35.0, 0.0, 8.0, 15.0),
                            child: Container(
                              width: 214.0,
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'arial',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'arial',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: 4,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'l8oguvtw' /* Status */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch(
                                    value: _model.switchValue1!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue1 = newValue);
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '4yk2nsdp' /* Whatsapp */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue2!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue2 = newValue);
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'f6pw54zz' /* Sms */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue3!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue3 = newValue);
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '4q06nqyz' /* E-mail */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue4!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue4 = newValue);
                                    },
                                    activeColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'wa4xhety' /* Push notification */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.05),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '36yiib1n' /* Test */,
                                  ),
                                  icon: Icon(
                                    Icons.watch_later,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 34.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF62ACB5),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                    hoverColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    hoverBorderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    hoverTextColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    hoverElevation: 3.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.05),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'qt9e3emh' /* Send */,
                                    ),
                                    icon: Icon(
                                      Icons.send_rounded,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 34.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFF62ACB5),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      hoverElevation: 3.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.05),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      Navigator.pop(context);
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'mxz0ivys' /* Cancel */,
                                    ),
                                    icon: Icon(
                                      Icons.close_rounded,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 34.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context).error,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      hoverElevation: 3.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
