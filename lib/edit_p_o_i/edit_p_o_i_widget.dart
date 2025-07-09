import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'edit_p_o_i_model.dart';
export 'edit_p_o_i_model.dart';

class EditPOIWidget extends StatefulWidget {
  const EditPOIWidget({
    super.key,
    this.markerData,
  });

  final dynamic markerData;

  static String routeName = 'Edit_POI';
  static String routePath = '/editPOI';

  @override
  State<EditPOIWidget> createState() => _EditPOIWidgetState();
}

class _EditPOIWidgetState extends State<EditPOIWidget> {
  late EditPOIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPOIModel());

    _model.nameFocusNode ??= FocusNode();

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
      body: FutureBuilder<ApiCallResponse>(
        future: NewSpeedotrackJSApiGroup.markerFillDataCall.call(
          markerId: getJsonField(
            widget.markerData,
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
          final columnMarkerFillDataResponse = snapshot.data!;

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.EditPOI(
                      width: double.infinity,
                      height: double.infinity,
                      markerColor: FFAppState().EditMarkerColor,
                      markerIcon:
                          _model.uploadedLocalFile_uploadDataMarkerIconEdit,
                      initialLat: getJsonField(
                        columnMarkerFillDataResponse.jsonBody,
                        r'''$.lat''',
                      ),
                      initialLng: getJsonField(
                        columnMarkerFillDataResponse.jsonBody,
                        r'''$.lng''',
                      ),
                      initialImage: functions.returnmarkerImage(getJsonField(
                        columnMarkerFillDataResponse.jsonBody,
                        r'''$.image''',
                      ).toString()),
                      poiName: '',
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
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
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 22.0, 15.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'sv2qd4i9' /* Edit POI */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          FFIcons.kcross,
                                          color: FlutterFlowTheme.of(context)
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 18.0, 25.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 294.59,
                                  child: TextFormField(
                                    controller: _model.nameTextController ??=
                                        TextEditingController(
                                      text: getJsonField(
                                        columnMarkerFillDataResponse.jsonBody,
                                        r'''$.name''',
                                      ).toString(),
                                    ),
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
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'xpcegkuc' /* Enter POI Name */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'arial',
                                            color: FlutterFlowTheme.of(context)
                                                .textfieldColor,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
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
                        if (functions
                                .retunArrayLength(FFAppState().groupData)
                                .toString() !=
                            '0')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                25.0, 8.0, 25.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.dropDownValue ??= getJsonField(
                                        FFAppState().groupData,
                                        r'''$[0]._id''',
                                      ).toString(),
                                    ),
                                    options: List<String>.from((getJsonField(
                                      FFAppState().groupData,
                                      r'''$[:]._id''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList()),
                                    optionLabels: (getJsonField(
                                      FFAppState().groupData,
                                      r'''$[:].name''',
                                      true,
                                    ) as List)
                                        .map<String>((s) => s.toString())
                                        .toList(),
                                    onChanged: (val) => safeSetState(
                                        () => _model.dropDownValue = val),
                                    width: 200.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '5j8jewcz' /* Select Group */,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    borderColor: Color(0xFF9F9F9F),
                                    borderWidth: 0.5,
                                    borderRadius: 5.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (functions
                                .retunArrayLength(FFAppState().groupData)
                                .toString() ==
                            '0')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9t4n7llb' /* "Please add at least one group... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'arial',
                                        color: FlutterFlowTheme.of(context)
                                            .redColor,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 8.0, 25.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 152.0,
                                height: 40.8,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .textFieldBorderColor,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _colorPickedColor =
                                            await showFFColorPicker(
                                          context,
                                          currentColor: _model.colorPicked ??
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          showRecentColors: true,
                                          allowOpacity: true,
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          secondaryTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          primaryButtonBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          primaryButtonTextColor: Colors.white,
                                          primaryButtonBorderColor:
                                              Colors.transparent,
                                          displayAsBottomSheet:
                                              isMobileWidth(context),
                                        );

                                        if (_colorPickedColor != null) {
                                          safeSetState(() => _model
                                              .colorPicked = _colorPickedColor);
                                        }

                                        FFAppState().EditMarkerColor =
                                            _model.colorPicked!;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 16.0,
                                        height: 16.0,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().EditMarkerColor,
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      functions
                                          .colorToString(valueOrDefault<Color>(
                                        FFAppState().markerColor,
                                        FlutterFlowTheme.of(context).primary,
                                      )),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'arial',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    safeSetState(() => _model
                                            .isDataUploading_uploadDataMarkerIconEdit =
                                        true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      _model.isDataUploading_uploadDataMarkerIconEdit =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_uploadDataMarkerIconEdit =
                                            selectedUploadedFiles.first;
                                      });
                                    } else {
                                      safeSetState(() {});
                                      return;
                                    }
                                  }
                                },
                                child: Container(
                                  width: 152.0,
                                  height: 40.8,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .textFieldBorderColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFF9F9F9F),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ouxrkvjv' /* Upload Image */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              letterSpacing: 0.0,
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 160.0,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.compact,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                          ),
                                          child: Checkbox(
                                            value: _model.visibleValue ??= true,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .visibleValue = newValue!);
                                              if (newValue!) {
                                                FFAppState().isPOIVisible =
                                                    true;
                                                safeSetState(() {});
                                              } else {
                                                FFAppState().isPOIVisible =
                                                    false;
                                                safeSetState(() {});
                                              }
                                            },
                                            side: (FlutterFlowTheme.of(context)
                                                        .alternate !=
                                                    null)
                                                ? BorderSide(
                                                    width: 2,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  )
                                                : null,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'arexozp7' /* POI Visible */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'arial',
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              25.0, 10.0, 4.0, 18.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.updatePoiResult =
                                            await NewSpeedotrackJSApiGroup
                                                .editPOIScreenCall
                                                .call(
                                          name: _model.nameTextController.text,
                                          visible: _model.visibleValue,
                                          lat: FFAppState()
                                              .selectedLat
                                              .toString(),
                                          lng: FFAppState()
                                              .selectedLng
                                              .toString(),
                                          jwt: FFAppState().userJwt,
                                          markerID: getJsonField(
                                            widget.markerData,
                                            r'''$._id''',
                                          ).toString(),
                                          icon: 'hoome',
                                          radius: '1',
                                          image: _model
                                              .uploadedLocalFile_uploadDataMarkerIconEdit,
                                          colour: functions.colorToString(
                                              _model.colorPicked!),
                                          group: _model.dropDownValue,
                                        );

                                        if ((_model
                                                .updatePoiResult?.succeeded ??
                                            true)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Marker Updated Successfully!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .movingGreen,
                                            ),
                                          );

                                          context.pushNamed(
                                              POIScreenWidget.routeName);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.updatePoiResult
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.msg''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .redColor,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: 137.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '3j7ya8se' /* SAVE */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
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
                                    4.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 137.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(
                                            color: Color(0xFF9F9F9F),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'krengteg' /* CANCEL */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
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
