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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'edit_geofence_model.dart';
export 'edit_geofence_model.dart';

class EditGeofenceWidget extends StatefulWidget {
  const EditGeofenceWidget({
    super.key,
    this.geofenceID,
    this.geofenceData,
  });

  final String? geofenceID;
  final dynamic geofenceData;

  static String routeName = 'Edit_Geofence';
  static String routePath = '/editGeofence';

  @override
  State<EditGeofenceWidget> createState() => _EditGeofenceWidgetState();
}

class _EditGeofenceWidgetState extends State<EditGeofenceWidget> {
  late EditGeofenceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditGeofenceModel());

    _model.nameTextController1 ??= TextEditingController(
        text: getJsonField(
      widget.geofenceData,
      r'''$.name''',
    ).toString().toString());
    _model.nameFocusNode1 ??= FocusNode();

    _model.nameTextController2 ??= TextEditingController(
        text: getJsonField(
      widget.geofenceData,
      r'''$.name''',
    ).toString().toString());
    _model.nameFocusNode2 ??= FocusNode();

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
      body: FutureBuilder<ApiCallResponse>(
        future: NewSpeedotrackJSApiGroup.geofenceFillFormDataCall.call(
          geofenceID: getJsonField(
            widget.geofenceData,
            r'''$._id''',
          ).toString(),
          jwt: FFAppState().userJwt,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 50.0,
                ),
              ),
            );
          }
          final columnGeofenceFillFormDataResponse = snapshot.data!;

          return Column(
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
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: custom_widgets.UpdateGeofence(
                                  width: double.infinity,
                                  height: double.infinity,
                                  existingGeofenceId: widget.geofenceID!,
                                  initialRadius: getJsonField(
                                    columnGeofenceFillFormDataResponse.jsonBody,
                                    r'''$.radius''',
                                  ),
                                  initialVertices: getJsonField(
                                    columnGeofenceFillFormDataResponse.jsonBody,
                                    r'''$.vertices''',
                                    true,
                                  )!,
                                  initialCenter: getJsonField(
                                    columnGeofenceFillFormDataResponse.jsonBody,
                                    r'''$.origin''',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (_model.showCard == true)
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
                                            topLeft: Radius.circular(25.0),
                                            topRight: Radius.circular(25.0),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  22.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .safePop();
                                                                },
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kiosArrowLeft,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                '45wq9pzy' /* Edit Geofence */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
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
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kcross,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          18.0,
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
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
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (getJsonField(
                                                                          columnGeofenceFillFormDataResponse
                                                                              .jsonBody,
                                                                          r'''$.shape''',
                                                                        ) ==
                                                                        getJsonField(
                                                                          <String,
                                                                              String?>{
                                                                            'val':
                                                                                'polygon',
                                                                          },
                                                                          r'''$.val''',
                                                                        )) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '\" The polygon can\'t be changed into circle.\"',
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
                                                                    } else {
                                                                      FFAppState()
                                                                              .geofenceMode =
                                                                          'circle';
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'a9jm5jql' /* Circle */,
                                                                  ),
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kmRGPSAPPICONSSVGFILE108,
                                                                    size: 30.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconColor:
                                                                        valueOrDefault<
                                                                            Color>(
                                                                      FFAppState().geofenceMode ==
                                                                              'circle'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState().geofenceMode ==
                                                                              'circle'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().geofenceMode == 'circle'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .textfieldColor,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if (getJsonField(
                                                                          columnGeofenceFillFormDataResponse
                                                                              .jsonBody,
                                                                          r'''$.shape''',
                                                                        ) ==
                                                                        getJsonField(
                                                                          <String,
                                                                              String?>{
                                                                            'val':
                                                                                'circle',
                                                                          },
                                                                          r'''$.val''',
                                                                        )) {
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            '\"The circle can\'t be changed into a polygon.\"',
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
                                                                    } else {
                                                                      FFAppState()
                                                                              .geofenceMode =
                                                                          'polygon';
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'q2kwycu9' /* Polygon */,
                                                                  ),
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kmRGPSAPPICONSSVGFILE110,
                                                                    size: 30.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width:
                                                                        137.0,
                                                                    height:
                                                                        36.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    iconColor:
                                                                        valueOrDefault<
                                                                            Color>(
                                                                      FFAppState().geofenceMode ==
                                                                              'polygon'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondaryBackground
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                    color: valueOrDefault<
                                                                        Color>(
                                                                      FFAppState().geofenceMode ==
                                                                              'polygon'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primaryText
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'arial',
                                                                          color:
                                                                              valueOrDefault<Color>(
                                                                            FFAppState().geofenceMode == 'polygon'
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0xFF9F9F9F),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        294.59,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .nameTextController1,
                                                                      focusNode:
                                                                          _model
                                                                              .nameFocusNode1,
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).textfieldColor,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'j20oq5i7' /* Enter Geofence Name */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).textfieldColor,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF9F9F9F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF9F9F9F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).textfieldColor,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .nameTextController1Validator
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        294.59,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .nameTextController2,
                                                                      focusNode:
                                                                          _model
                                                                              .nameFocusNode2,
                                                                      autofocus:
                                                                          false,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        isDense:
                                                                            true,
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).textfieldColor,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        hintText:
                                                                            FFLocalizations.of(context).getText(
                                                                          'fhevn2cc' /* Enter Geofence Name */,
                                                                        ),
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'arial',
                                                                              color: FlutterFlowTheme.of(context).textfieldColor,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF9F9F9F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF9F9F9F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).textfieldColor,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      cursorColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      validator: _model
                                                                          .nameTextController2Validator
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    8.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (FFAppState()
                                                                          .geofenceMode ==
                                                                      'circle') {
                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .groupValueController1 ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.groupValue1 ??=
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .groupData,
                                                                          r'''$[0]._id''',
                                                                        ).toString(),
                                                                      ),
                                                                      options: List<
                                                                          String>.from((getJsonField(
                                                                        FFAppState()
                                                                            .groupData,
                                                                        r'''$[:]._id''',
                                                                        true,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()),
                                                                      optionLabels: (getJsonField(
                                                                        FFAppState()
                                                                            .groupData,
                                                                        r'''$[:].name''',
                                                                        true,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.groupValue1 = val),
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'basn4zgy' /* Select Group */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_drop_down_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          1.0,
                                                                      borderColor:
                                                                          Color(
                                                                              0xFF9F9F9F),
                                                                      borderWidth:
                                                                          0.5,
                                                                      borderRadius:
                                                                          5.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                                                              .groupValueController2 ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.groupValue2 ??=
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .groupData,
                                                                          r'''$[0]._id''',
                                                                        ).toString(),
                                                                      ),
                                                                      options: List<
                                                                          String>.from((getJsonField(
                                                                        FFAppState()
                                                                            .groupData,
                                                                        r'''$[:]._id''',
                                                                        true,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()),
                                                                      optionLabels: (getJsonField(
                                                                        FFAppState()
                                                                            .groupData,
                                                                        r'''$[:].name''',
                                                                        true,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.groupValue2 = val),
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'arial',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'uq4ygcqu' /* Select Group */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .arrow_drop_down_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          1.0,
                                                                      borderColor:
                                                                          Color(
                                                                              0xFF9F9F9F),
                                                                      borderWidth:
                                                                          0.5,
                                                                      borderRadius:
                                                                          5.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
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
                                                                'zzrm9zqb' /* "Please add at least one group... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                    Padding(
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
                                                                      final _colorPickedColor =
                                                                          await showFFColorPicker(
                                                                        context,
                                                                        currentColor:
                                                                            _model.colorPicked ??
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

                                                                      if (_colorPickedColor !=
                                                                          null) {
                                                                        safeSetState(() =>
                                                                            _model.colorPicked =
                                                                                _colorPickedColor);
                                                                      }

                                                                      FFAppState()
                                                                              .geofenceMainColor =
                                                                          _model
                                                                              .colorPicked!;
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
                                                                              .secondary,
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'z40fb7ad' /* Radius */,
                                                                  ),
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
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        22.4,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Slider(
                                                                      activeColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondary,
                                                                      inactiveColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      min: 10.0,
                                                                      max:
                                                                          1000.0,
                                                                      value: _model
                                                                              .sliderValue ??=
                                                                          10.0,
                                                                      onChanged:
                                                                          (newValue) async {
                                                                        newValue =
                                                                            double.parse(newValue.toStringAsFixed(2));
                                                                        safeSetState(() =>
                                                                            _model.sliderValue =
                                                                                newValue);
                                                                        FFAppState().geofenceRadius =
                                                                            _model.sliderValue!;
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
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return Container(
                                                            width: 100.0,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                                        25.0,
                                                                        20.0,
                                                                        4.0,
                                                                        18.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.editGeofenceCircle = await NewSpeedotrackJSApiGroup
                                                                              .editGeofenceApiCircleCall
                                                                              .call(
                                                                            name:
                                                                                _model.nameTextController1.text,
                                                                            color:
                                                                                functions.colorToString(FFAppState().geofenceMainColor),
                                                                            geofenceID:
                                                                                widget.geofenceID,
                                                                            radius:
                                                                                _model.sliderValue?.toString(),
                                                                            shape:
                                                                                FFAppState().geofenceMode,
                                                                            group:
                                                                                _model.groupValue1,
                                                                            jwt:
                                                                                FFAppState().userJwt,
                                                                            originLat:
                                                                                FFAppState().geofenceOriginLat,
                                                                            originLng:
                                                                                FFAppState().geofenceOriginLng,
                                                                          );

                                                                          if ((_model.editGeofenceCircle?.succeeded ??
                                                                              true)) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Geoofence Updated Sucessfully!',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).movingGreen,
                                                                              ),
                                                                            );

                                                                            context.pushNamed(GeofenceScreenWidget.routeName);
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.editGeofenceCircle?.jsonBody ?? ''),
                                                                                    r'''$.msg''',
                                                                                  ).toString(),
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).redColor,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'azghq4yg' /* SAVE */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(GeofenceScreenWidget.routeName);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              137.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF9F9F9F),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '13f7mgjc' /* CANCEL */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                        25.0,
                                                                        20.0,
                                                                        4.0,
                                                                        18.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
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
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.editGeofencepolygon = await NewSpeedotrackJSApiGroup
                                                                              .editGeofenceApiPolygonCall
                                                                              .call(
                                                                            name:
                                                                                _model.nameTextController2.text,
                                                                            color:
                                                                                functions.colorToString(FFAppState().geofenceMainColor),
                                                                            geofenceID:
                                                                                widget.geofenceID,
                                                                            shape:
                                                                                FFAppState().geofenceMode,
                                                                            group:
                                                                                _model.groupValue2,
                                                                            verticesJson:
                                                                                FFAppState().polygonVertices,
                                                                            jwt:
                                                                                FFAppState().userJwt,
                                                                          );

                                                                          if ((_model.editGeofencepolygon?.succeeded ??
                                                                              true)) {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Geoofence Updated Sucessfully!',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).movingGreen,
                                                                              ),
                                                                            );

                                                                            context.pushNamed(GeofenceScreenWidget.routeName);
                                                                          } else {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  getJsonField(
                                                                                    (_model.editGeofenceCircle?.jsonBody ?? ''),
                                                                                    r'''$.msg''',
                                                                                  ).toString(),
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: FlutterFlowTheme.of(context).redColor,
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '127uwqjz' /* SAVE */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                  padding: EdgeInsetsDirectional
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
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(GeofenceScreenWidget.routeName);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              137.0,
                                                                          height:
                                                                              36.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF9F9F9F),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'imiinhl6' /* CANCEL */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
          );
        },
      ),
    );
  }
}
