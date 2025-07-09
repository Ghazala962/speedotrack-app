import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'share_screen_model.dart';
export 'share_screen_model.dart';

class ShareScreenWidget extends StatefulWidget {
  const ShareScreenWidget({
    super.key,
    this.deviceData,
  });

  final dynamic deviceData;

  @override
  State<ShareScreenWidget> createState() => _ShareScreenWidgetState();
}

class _ShareScreenWidgetState extends State<ShareScreenWidget> {
  late ShareScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShareScreenModel());

    _model.vehicleNoTextController ??= TextEditingController(
        text: getJsonField(
      widget.deviceData,
      r'''$.name''',
    ).toString().toString());
    _model.vehicleNoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 366.0,
        height: 360.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(7.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'bn6fqx9f' /* Share */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
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
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        's5abayj5' /* Share Vehicle Live Location */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        '14ruz5ij' /* Vehicle No. */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: 294.59,
                        child: TextFormField(
                          controller: _model.vehicleNoTextController,
                          focusNode: _model.vehicleNoFocusNode,
                          autofocus: false,
                          readOnly: true,
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
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '974e2onm' /* ABC234 */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context)
                                      .textfieldColor,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).grayTextMiddle,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.vehicleNoTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'rr5jbtrb' /* Duration */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'arial',
                            color: FlutterFlowTheme.of(context).secondary,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FlutterFlowDropDown<String>(
                        controller: _model.durationValueController ??=
                            FormFieldController<String>(
                          _model.durationValue ??= '',
                        ),
                        options: List<String>.from(
                            ['1', '2', '3', '5', '10', '20', '24', '48', '72']),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            '3rm7jepr' /* 1 hour */,
                          ),
                          FFLocalizations.of(context).getText(
                            'rfzkpawh' /* 2 hours */,
                          ),
                          FFLocalizations.of(context).getText(
                            'px8u7nta' /* 3 hours */,
                          ),
                          FFLocalizations.of(context).getText(
                            'hr50uhq6' /* 5 hours */,
                          ),
                          FFLocalizations.of(context).getText(
                            '6ppbb23a' /* 10 hours */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4yhp1nag' /* 20 hours */,
                          ),
                          FFLocalizations.of(context).getText(
                            'gq1hfq8m' /* 1 day */,
                          ),
                          FFLocalizations.of(context).getText(
                            'qeupd8yg' /* 2 days */,
                          ),
                          FFLocalizations.of(context).getText(
                            'gm30c61w' /* 3 days */,
                          )
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.durationValue = val),
                        width: 294.6,
                        height: 48.0,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                        hintText: FFLocalizations.of(context).getText(
                          '1g4u9rid' /* Select Duration */,
                        ),
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: FlutterFlowTheme.of(context).grayTextMiddle,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Color(0xFF9F9F9F),
                        borderWidth: 1.0,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        _model.deviceShareRes = await NewSpeedotrackJSApiGroup
                            .deviceShareApiCall
                            .call(
                          jwt: FFAppState().userJwt,
                          imei: getJsonField(
                            widget.deviceData,
                            r'''$.imei''',
                          ).toString(),
                          duration: _model.durationValue,
                        );

                        if ((_model.deviceShareRes?.succeeded ?? true)) {
                          await launchURL(
                              functions.createWhatsappShareLink(getJsonField(
                            (_model.deviceShareRes?.jsonBody ?? ''),
                            r'''$.shareLink''',
                          ).toString())!);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                getJsonField(
                                  (_model.deviceShareRes?.jsonBody ?? ''),
                                  r'''$.message''',
                                ).toString(),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).error,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'a8z36eze' /* SHARE */,
                      ),
                      options: FFButtonOptions(
                        width: 263.0,
                        height: 36.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
