import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'scan_sim_code_model.dart';
export 'scan_sim_code_model.dart';

class ScanSimCodeWidget extends StatefulWidget {
  const ScanSimCodeWidget({
    super.key,
    this.tripId,
  });

  final String? tripId;

  static String routeName = 'ScanSimCode';
  static String routePath = '/scanSimCode';

  @override
  State<ScanSimCodeWidget> createState() => _ScanSimCodeWidgetState();
}

class _ScanSimCodeWidgetState extends State<ScanSimCodeWidget> {
  late ScanSimCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanSimCodeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'byqn7yoq' /* Scan SIM QR Code */,
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'arial',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 252.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              'assets/images/7994392-unscreen.gif',
                              width: double.infinity,
                              height: 468.0,
                              fit: BoxFit.fitHeight,
                            ),
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
                            15.0, 50.0, 0.0, 30.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Container(
                                width: 64.0,
                                height: 64.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).accent4,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.document_scanner_outlined,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 44.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 16.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '57uskyf4' /* Scan SIM  QR Code Auto will go... */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
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
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 50.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 15.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                _model.barcodeValue =
                                    await FlutterBarcodeScanner.scanBarcode(
                                  '#C62828', // scanning line color
                                  FFLocalizations.of(context).getText(
                                    'ixdoezh9' /* Cancel */,
                                  ), // cancel button text
                                  true, // whether to show the flash icon
                                  ScanMode.BARCODE,
                                );

                                context.pushNamed(
                                  LockScannerDetailsWidget.routeName,
                                  queryParameters: {
                                    'tripId': serializeParam(
                                      widget.tripId,
                                      ParamType.String,
                                    ),
                                    'barCodeValue': serializeParam(
                                      _model.barcodeValue,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                safeSetState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'y5swyigm' /* Scan QR Code / Bar Code */,
                              ),
                              options: FFButtonOptions(
                                width: 165.0,
                                height: 40.0,
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
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
