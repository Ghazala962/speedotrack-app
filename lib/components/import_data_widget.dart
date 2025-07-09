import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'import_data_model.dart';
export 'import_data_model.dart';

class ImportDataWidget extends StatefulWidget {
  const ImportDataWidget({
    super.key,
    this.selectedDeviceImei,
  });

  final String? selectedDeviceImei;

  @override
  State<ImportDataWidget> createState() => _ImportDataWidgetState();
}

class _ImportDataWidgetState extends State<ImportDataWidget> {
  late ImportDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImportDataModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 200.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 221.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 350.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'lhxlq83o' /* Import Data */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                              child: Container(
                                                width: 270.0,
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'v6pekte7' /* Upload File */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'arial',
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.file_upload,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            final selectedFiles =
                                                                await selectFiles(
                                                              multiFile: false,
                                                            );
                                                            if (selectedFiles !=
                                                                null) {
                                                              safeSetState(() =>
                                                                  _model.isDataUploading_uploadDataWtz =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedFiles
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                            ))
                                                                        .toList();
                                                              } finally {
                                                                _model.isDataUploading_uploadDataWtz =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedFiles
                                                                      .length) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.uploadedLocalFile_uploadDataWtz =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                });
                                                              } else {
                                                                safeSetState(
                                                                    () {});
                                                                return;
                                                              }
                                                            }
                                                          },
                                                        ),
                                                      ],
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 45.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 2.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            _model.uploadSealBulk =
                                                await SpeedoTrackSealsGroup
                                                    .postBulkSealApiCall
                                                    .call(
                                              seals: _model
                                                  .uploadedLocalFile_uploadDataWtz,
                                              jwt: FFAppState().userJwt,
                                            );

                                            if ((_model.uploadSealBulk
                                                    ?.succeeded ??
                                                true)) {
                                              context.safePop();
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    getJsonField(
                                                      (_model.uploadSealBulk
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '8oqd5v9q' /* import */,
                                          ),
                                          icon: Icon(
                                            Icons.download_rounded,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 25.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'arial',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '10iehcnd' /* Close */,
                                          ),
                                          icon: Icon(
                                            Icons.close_sharp,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 25.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            color: Color(0xFFEB515C),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'arial',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 13.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Color(0x4DCA162C),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
