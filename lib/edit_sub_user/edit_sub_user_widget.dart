import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_sub_user_model.dart';
export 'edit_sub_user_model.dart';

class EditSubUserWidget extends StatefulWidget {
  const EditSubUserWidget({
    super.key,
    this.subUserData,
  });

  final dynamic subUserData;

  static String routeName = 'Edit_Sub_User';
  static String routePath = '/editSubUser';

  @override
  State<EditSubUserWidget> createState() => _EditSubUserWidgetState();
}

class _EditSubUserWidgetState extends State<EditSubUserWidget> {
  late EditSubUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSubUserModel());

    _model.firsrtNameTextController ??= TextEditingController(
        text: getJsonField(
      widget.subUserData,
      r'''$.username''',
    ).toString().toString());
    _model.firsrtNameFocusNode ??= FocusNode();

    _model.phoneTextController ??= TextEditingController(
        text: getJsonField(
      widget.subUserData,
      r'''$.phone.number''',
    ).toString().toString());
    _model.phoneFocusNode ??= FocusNode();

    _model.addressTextController ??= TextEditingController(
        text: getJsonField(
      widget.subUserData,
      r'''$.email''',
    ).toString().toString());
    _model.addressFocusNode ??= FocusNode();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Container(
                            height: 42.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 0.0, 19.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Icon(
                                            FFIcons.kiosArrowLeft,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 17.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jid5tgkv' /* Update Sub User */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'arial',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Icon(
                                                          FFIcons.kcross,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 17.0,
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
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 20.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 331.78,
                                      child: TextFormField(
                                        controller:
                                            _model.firsrtNameTextController,
                                        focusNode: _model.firsrtNameFocusNode,
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
                                            'kpzb1tgn' /* Enter First Name */,
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
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 0.5,
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
                                              width: 0.5,
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
                                                      .secondary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .firsrtNameTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 6.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 331.78,
                                      child: TextFormField(
                                        controller: _model.phoneTextController,
                                        focusNode: _model.phoneFocusNode,
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
                                            'jt3ogj7i' /* Enter Phone Number */,
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
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 0.5,
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
                                              width: 0.5,
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
                                                      .secondary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .phoneTextControllerValidator
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
                                        controller:
                                            _model.addressTextController,
                                        focusNode: _model.addressFocusNode,
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
                                            'el0mlirn' /* Enter Email Address */,
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
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF9F9F9F),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 0.5,
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
                                              width: 0.5,
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
                                                      .secondary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        validator: _model
                                            .addressTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 18.0, 40.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ogtfljhk' /* Vehicle Access */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
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
                                    child: FlutterFlowDropDown<String>(
                                      multiSelectController:
                                          _model.deviceLisValueController ??=
                                              FormListFieldController<String>(
                                                  _model.deviceLisValue ??=
                                                      List<String>.from(
                                        (getJsonField(
                                              FFAppState().allDeviceData,
                                              r'''$[:].imei''',
                                              true,
                                            ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList() ??
                                            [],
                                      )),
                                      options: List<String>.from((getJsonField(
                                        FFAppState().allDeviceData,
                                        r'''$[:].imei''',
                                        true,
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()),
                                      optionLabels: (getJsonField(
                                        FFAppState().allDeviceData,
                                        r'''$[:].name''',
                                        true,
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList(),
                                      width: 331.8,
                                      height: 48.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: FlutterFlowTheme.of(context)
                                                .textfieldColor,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'psufcb4f' /* Select Device */,
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .arrowColor,
                                        size: 20.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Color(0xFF9F9F9F),
                                      borderWidth: 0.5,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: true,
                                      onMultiSelectChanged: (val) =>
                                          safeSetState(() =>
                                              _model.deviceLisValue = val),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 40.0, 40.0, 60.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      _model.apiResult88e =
                                          await NewSpeedotrackJSApiGroup
                                              .addSubUserListCall
                                              .call(
                                        name: _model
                                            .firsrtNameTextController.text,
                                        email:
                                            _model.addressTextController.text,
                                        phone: _model.phoneTextController.text,
                                        devicesList: _model.deviceLisValue,
                                        jwt: FFAppState().userJwt,
                                      );

                                      if ((_model.apiResult88e?.succeeded ??
                                          true)) {
                                        context
                                            .pushNamed(SubUserWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResult88e
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.msg''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ntuhwmsk' /* SAVE */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 263.0,
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
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
      ),
    );
  }
}
