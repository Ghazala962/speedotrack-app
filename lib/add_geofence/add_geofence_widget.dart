import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'add_geofence_model.dart';
export 'add_geofence_model.dart';

class AddGeofenceWidget extends StatefulWidget {
  const AddGeofenceWidget({super.key});

  static String routeName = 'Add_Geofence';
  static String routePath = '/addGeofence';

  @override
  State<AddGeofenceWidget> createState() => _AddGeofenceWidgetState();
}

class _AddGeofenceWidgetState extends State<AddGeofenceWidget> {
  late AddGeofenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddGeofenceModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.namepolyTextController ??= TextEditingController();
    _model.namepolyFocusNode ??= FocusNode();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.CreateGeofence(
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 8.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 15.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 22.0, 15.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.safePop();
                                                          },
                                                          child: Icon(
                                                            FFIcons
                                                                .kiosArrowLeft,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ezhdtc6r' /* Add Geofence */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                FFIcons.kcross,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 17.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .geofenceMode =
                                                                  'circle';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'hd9uvuwe' /* Circle */,
                                                            ),
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kmRGPSAPPICONSSVGFILE108,
                                                              size: 30.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 137.0,
                                                              height: 36.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState().geofenceMode ==
                                                                        'circle'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState().geofenceMode ==
                                                                        'circle'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState().geofenceMode == 'circle'
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textfieldColor,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .geofenceMode =
                                                                  'polygon';
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '6nifv8tp' /* Polygon */,
                                                            ),
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kmRGPSAPPICONSSVGFILE110,
                                                              size: 30.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 137.0,
                                                              height: 36.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState().geofenceMode ==
                                                                        'polygon'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                FFAppState().geofenceMode ==
                                                                        'polygon'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState().geofenceMode == 'polygon'
                                                                              ? FlutterFlowTheme.of(context).secondaryBackground
                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0xFF9F9F9F),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .geofenceMode ==
                                                      'circle') {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  18.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 294.59,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .nameTextController,
                                                                focusNode: _model
                                                                    .nameFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'oi4861mh' /* Enter Geofence Name */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF9F9F9F),
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF9F9F9F),
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textfieldColor,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .nameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  18.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 294.59,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .namepolyTextController,
                                                                focusNode: _model
                                                                    .namepolyFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6jh1tyxa' /* Enter Geofence Name */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'arial',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .textfieldColor,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF9F9F9F),
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF9F9F9F),
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textfieldColor,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .namepolyTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              if (functions
                                                      .retunArrayLength(
                                                          FFAppState()
                                                              .groupData)
                                                      .toString() !=
                                                  '0')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          25.0, 8.0, 25.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            if (FFAppState()
                                                                    .geofenceMode ==
                                                                'circle') {
                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .groupValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.groupValue ??=
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .groupData,
                                                                    r'''$[0]._id''',
                                                                  ).toString(),
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    (getJsonField(
                                                                  FFAppState()
                                                                      .groupData,
                                                                  r'''$[:]._id''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList()),
                                                                optionLabels:
                                                                    (getJsonField(
                                                                  FFAppState()
                                                                      .groupData,
                                                                  r'''$[:].name''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList(),
                                                                onChanged: (val) =>
                                                                    safeSetState(() =>
                                                                        _model.groupValue =
                                                                            val),
                                                                width: 200.0,
                                                                height: 40.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'cobtjo4n' /* Select Group */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 1.0,
                                                                borderColor: Color(
                                                                    0xFF9F9F9F),
                                                                borderWidth:
                                                                    0.5,
                                                                borderRadius:
                                                                    5.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            } else {
                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .grouppolyValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.grouppolyValue ??=
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .groupData,
                                                                    r'''$[0]._id''',
                                                                  ).toString(),
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    (getJsonField(
                                                                  FFAppState()
                                                                      .groupData,
                                                                  r'''$[:]._id''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList()),
                                                                optionLabels:
                                                                    (getJsonField(
                                                                  FFAppState()
                                                                      .groupData,
                                                                  r'''$[:].name''',
                                                                  true,
                                                                ) as List)
                                                                        .map<String>((s) =>
                                                                            s.toString())
                                                                        .toList(),
                                                                onChanged: (val) =>
                                                                    safeSetState(() =>
                                                                        _model.grouppolyValue =
                                                                            val),
                                                                width: 200.0,
                                                                height: 40.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'dg3sjp0o' /* Select Group */,
                                                                ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 1.0,
                                                                borderColor: Color(
                                                                    0xFF9F9F9F),
                                                                borderWidth:
                                                                    0.5,
                                                                borderRadius:
                                                                    5.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (functions
                                                      .retunArrayLength(
                                                          FFAppState()
                                                              .groupData)
                                                      .toString() ==
                                                  '0')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 2.0, 0.0, 2.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'c7yua2b5' /* "Please add at least one group... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .redColor,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .geofenceMode ==
                                                      'circle') {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  6.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 152.5,
                                                            height: 38.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF9F9F9F),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      final _colorPicked1Color =
                                                                          await showFFColorPicker(
                                                                        context,
                                                                        currentColor:
                                                                            _model.colorPicked1 ??
                                                                                FlutterFlowTheme.of(context).primary,
                                                                        showRecentColors:
                                                                            true,
                                                                        allowOpacity:
                                                                            true,
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        secondaryTextColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        primaryButtonBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        primaryButtonTextColor:
                                                                            Colors.white,
                                                                        primaryButtonBorderColor:
                                                                            Colors.transparent,
                                                                        displayAsBottomSheet:
                                                                            isMobileWidth(context),
                                                                      );

                                                                      if (_colorPicked1Color !=
                                                                          null) {
                                                                        safeSetState(() =>
                                                                            _model.colorPicked1 =
                                                                                _colorPicked1Color);
                                                                      }

                                                                      FFAppState()
                                                                              .geofenceMainColor =
                                                                          _model
                                                                              .colorPicked1!;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .geofenceMainColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions.colorToString(
                                                                        FFAppState()
                                                                            .geofenceMainColor),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  6.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 152.5,
                                                            height: 38.2,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0xFF9F9F9F),
                                                                width: 0.5,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      final _colorPicked2Color =
                                                                          await showFFColorPicker(
                                                                        context,
                                                                        currentColor:
                                                                            _model.colorPicked2 ??
                                                                                FlutterFlowTheme.of(context).primary,
                                                                        showRecentColors:
                                                                            true,
                                                                        allowOpacity:
                                                                            true,
                                                                        textColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        secondaryTextColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        primaryButtonBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        primaryButtonTextColor:
                                                                            Colors.white,
                                                                        primaryButtonBorderColor:
                                                                            Colors.transparent,
                                                                        displayAsBottomSheet:
                                                                            isMobileWidth(context),
                                                                      );

                                                                      if (_colorPicked2Color !=
                                                                          null) {
                                                                        safeSetState(() =>
                                                                            _model.colorPicked2 =
                                                                                _colorPicked2Color);
                                                                      }

                                                                      FFAppState()
                                                                              .geofenceMainColor =
                                                                          _model
                                                                              .colorPicked2!;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          FFAppState()
                                                                              .geofenceMainColor,
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions.colorToString(
                                                                        FFAppState()
                                                                            .geofenceMainColor),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .geofenceMode ==
                                                      'circle') {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  25.0,
                                                                  5.0,
                                                                  25.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '51kub22u' /* Radius */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: 22.4,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Slider(
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                inactiveColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                min: 10.0,
                                                                max: 1000.0,
                                                                value: _model
                                                                        .sliderValue ??=
                                                                    10.0,
                                                                onChanged:
                                                                    (newValue) async {
                                                                  newValue = double
                                                                      .parse(newValue
                                                                          .toStringAsFixed(
                                                                              2));
                                                                  safeSetState(() =>
                                                                      _model.sliderValue =
                                                                          newValue);
                                                                  FFAppState()
                                                                          .geofenceRadius =
                                                                      _model
                                                                          .sliderValue!;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            FFAppState()
                                                                .geofenceRadius
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'arial',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: 100.0,
                                                      height: 1.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .geofenceMode ==
                                                      'circle') {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  18.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.addGeofenceResult =
                                                                        await NewSpeedotrackJSApiGroup
                                                                            .addGeofenceListCircleCall
                                                                            .call(
                                                                      name: _model
                                                                          .nameTextController
                                                                          .text,
                                                                      color: functions
                                                                          .colorToString(
                                                                              FFAppState().geofenceMainColor),
                                                                      area: '1',
                                                                      shape: FFAppState()
                                                                          .geofenceMode,
                                                                      radius: _model
                                                                          .sliderValue,
                                                                      group: _model
                                                                          .groupValue,
                                                                      jwt: FFAppState()
                                                                          .userJwt,
                                                                      originLat:
                                                                          FFAppState()
                                                                              .geofenceOriginLat,
                                                                      originLng:
                                                                          FFAppState()
                                                                              .geofenceOriginLng,
                                                                    );

                                                                    if ((_model
                                                                            .addGeofenceResult
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Geoofence Adedd Sucessfully!',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).movingGreen,
                                                                        ),
                                                                      );

                                                                      context.goNamed(
                                                                          GeofenceScreenWidget
                                                                              .routeName);
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.addGeofenceResult?.jsonBody ?? ''),
                                                                              r'''$.msg''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).redColor,
                                                                        ),
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'xn0qkp73' /* SAVE */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        GeofenceScreenWidget
                                                                            .routeName);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFF9F9F9F),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'qneya756' /* CANCEL */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  18.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    _model.polygonresult =
                                                                        await NewSpeedotrackJSApiGroup
                                                                            .addGeofenceListPolygonCall
                                                                            .call(
                                                                      jwt: FFAppState()
                                                                          .userJwt,
                                                                      name: _model
                                                                          .namepolyTextController
                                                                          .text,
                                                                      color: functions
                                                                          .colorToString(
                                                                              FFAppState().geofenceMainColor),
                                                                      area: '1',
                                                                      shape: FFAppState()
                                                                          .geofenceMode,
                                                                      group: _model
                                                                          .grouppolyValue,
                                                                      verticesJson:
                                                                          FFAppState()
                                                                              .polygonVertices,
                                                                    );

                                                                    if ((_model
                                                                            .polygonresult
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Added Successfully',
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).movingGreen,
                                                                        ),
                                                                      );

                                                                      context.goNamed(
                                                                          GeofenceScreenWidget
                                                                              .routeName);
                                                                    } else {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            getJsonField(
                                                                              (_model.polygonresult?.jsonBody ?? ''),
                                                                              r'''$.msg''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).redColor,
                                                                        ),
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'gm5r8ems' /* SAVE */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        GeofenceScreenWidget
                                                                            .routeName);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFF9F9F9F),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'vljgpwlv' /* CANCEL */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_model.showCard == true)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 5.0),
                                      ),
                                    ),
                                  ),
                                ],
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
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
