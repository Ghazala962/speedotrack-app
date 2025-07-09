import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'edit_details_model.dart';
export 'edit_details_model.dart';

class EditDetailsWidget extends StatefulWidget {
  const EditDetailsWidget({
    super.key,
    this.deviceData,
  });

  final dynamic deviceData;

  static String routeName = 'Edit-Details';
  static String routePath = '/editDetails';

  @override
  State<EditDetailsWidget> createState() => _EditDetailsWidgetState();
}

class _EditDetailsWidgetState extends State<EditDetailsWidget> {
  late EditDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditDetailsModel());

    _model.nameFocusNode ??= FocusNode();

    _model.imeiFocusNode ??= FocusNode();

    _model.simNumberFocusNode ??= FocusNode();

    _model.plateNumberFocusNode ??= FocusNode();

    _model.modelFocusNode ??= FocusNode();

    _model.driverNameFocusNode ??= FocusNode();

    _model.driverPhoneFocusNode ??= FocusNode();

    _model.emailFocusNode ??= FocusNode();

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
                  child: Stack(
                    children: [
                      FutureBuilder<ApiCallResponse>(
                        future:
                            NewSpeedotrackJSApiGroup.deviceFillDataCall.call(
                          deviceImei: getJsonField(
                            widget.deviceData,
                            r'''$.imei''',
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
                          final columnDeviceFillDataResponse = snapshot.data!;

                          return SingleChildScrollView(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.safePop();
                                            },
                                            child: Icon(
                                              FFIcons.kiosArrowLeft,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 17.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6sejs6nd' /* Details */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
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
                                                    _model.deviceUpdate =
                                                        await NewSpeedotrackJSApiGroup
                                                            .devicdEditApiCall
                                                            .call(
                                                      name: _model
                                                          .nameTextController
                                                          .text,
                                                      imei: _model
                                                          .imeiTextController
                                                          .text,
                                                      simNumber: _model
                                                          .simNumberTextController
                                                          .text,
                                                      plateNumber: _model
                                                          .plateNumberTextController
                                                          .text,
                                                      model: _model
                                                          .modelTextController
                                                          .text,
                                                      jwt: FFAppState().userJwt,
                                                      deviceID: getJsonField(
                                                        widget.deviceData,
                                                        r'''$.imei''',
                                                      ).toString(),
                                                    );

                                                    if ((_model.deviceUpdate
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Updated!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .movingGreen,
                                                        ),
                                                      );

                                                      context.pushNamed(
                                                          ListViewDesignWidget
                                                              .routeName);
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            getJsonField(
                                                              (_model.deviceUpdate
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            ).toString(),
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .redColor,
                                                        ),
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kflszb6k' /* Save */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'pz1fehso' /* Vehicle Info */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 14.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '0vd2eg4e' /* Vehicle Name */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller:
                                                _model.nameTextController ??=
                                                    TextEditingController(
                                              text: getJsonField(
                                                columnDeviceFillDataResponse
                                                    .jsonBody,
                                                r'''$.name''',
                                              ).toString(),
                                            ),
                                            focusNode: _model.nameFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .nameTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 15.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ebjit8a0' /* IMEI */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller:
                                                _model.imeiTextController ??=
                                                    TextEditingController(
                                              text: getJsonField(
                                                columnDeviceFillDataResponse
                                                    .jsonBody,
                                                r'''$.imei''',
                                              ).toString(),
                                            ),
                                            focusNode: _model.imeiFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .imeiTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 15.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'sbq5wish' /* Sim Number */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller: _model
                                                    .simNumberTextController ??=
                                                TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.sim_number''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode:
                                                _model.simNumberFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .simNumberTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 15.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '2b0oyhza' /* Plate Number */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller: _model
                                                    .plateNumberTextController ??=
                                                TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.plate_number''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode:
                                                _model.plateNumberFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .plateNumberTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 15.0, 40.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5m6gtc8a' /* Model */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller:
                                                _model.modelTextController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.model''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode: _model.modelFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .modelTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'sxn9rt65' /* Driver Info */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 18.0, 40.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'fjc35by9' /* Driver Name */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller: _model
                                                    .driverNameTextController ??=
                                                TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.driver.name''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode:
                                                _model.driverNameFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .driverNameTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 14.0, 40.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'uem782bj' /*  Phone */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller: _model
                                                    .driverPhoneTextController ??=
                                                TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.driver.phone''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode:
                                                _model.driverPhoneFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .driverPhoneTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40.0, 14.0, 40.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'of7mwuaj' /* Email */,
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
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      39.0, 5.0, 39.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 331.78,
                                          child: TextFormField(
                                            controller:
                                                _model.emailTextController ??=
                                                    TextEditingController(
                                              text: valueOrDefault<String>(
                                                getJsonField(
                                                  columnDeviceFillDataResponse
                                                      .jsonBody,
                                                  r'''$.driver.email''',
                                                )?.toString(),
                                                'NA',
                                              ),
                                            ),
                                            focusNode: _model.emailFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textfieldColor,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .emailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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
