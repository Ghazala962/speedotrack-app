import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    super.key,
    this.deviceData,
  });

  final dynamic deviceData;

  static String routeName = 'Details';
  static String routePath = '/details';

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(19.0, 15.0, 19.0, 0.0),
                  child: Container(
                    height: 42.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 17.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'k4fmvy7c' /* Details */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    EditDetailsWidget.routeName,
                                    queryParameters: {
                                      'deviceData': serializeParam(
                                        widget.deviceData,
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'bkkw39mx' /* Edit */,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'gn92hrjl' /* Vehicle Info */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'mgl6mkyt' /* Vehicle Name */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        getJsonField(
                          widget.deviceData,
                          r'''$.name''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'c3aysn1d' /* Vehicle IMEI */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        getJsonField(
                          widget.deviceData,
                          r'''$.imei''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '4ezyw6d4' /* Vehicle Protocol */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        getJsonField(
                          widget.deviceData,
                          r'''$.prot''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'c15zxm4u' /* Expired Date */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        getJsonField(
                          widget.deviceData,
                          r'''$.expire_dt''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color:
                                  FlutterFlowTheme.of(context).textfieldColor,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'sb5ftta7' /* Vehicle Status */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.status''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'fap2ptvl' /*    */,
                              ),
                              style: TextStyle(
                                fontFamily: 'arial',
                              ),
                            ),
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.status_time''',
                              ).toString(),
                              style: TextStyle(
                                fontFamily: 'arial',
                                fontSize: 16.0,
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'o15js4n3' /* Vehicle Address */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: getJsonField(
                                  widget.deviceData,
                                  r'''$.address''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .textfieldColor,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '724nbvdj' /*    */,
                                ),
                                style: TextStyle(
                                  fontFamily: 'arial',
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context)
                                      .textfieldColor,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '2f0dx5hq' /* Odometer */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.odometer''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '4pm4xrty' /*    */,
                              ),
                              style: TextStyle(
                                fontFamily: 'arial',
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'xu5dw0bt' /* Driver Info */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '22f0tisp' /* Driver Name */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.device_driver''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'pol2p1xh' /* Phone No. */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.device_driver.phone''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '24ro4ug6' /*    */,
                              ),
                              style: TextStyle(
                                fontFamily: 'arial',
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          '2psav8mj' /* Driver ID */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.device_driver.assign_id''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'f556dx2m' /*    */,
                              ),
                              style: TextStyle(
                                fontFamily: 'arial',
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'uv7xlsxe' /* Driver Email */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'arial',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: getJsonField(
                                widget.deviceData,
                                r'''$.device_driver.email''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                '7fyhuhhk' /*    */,
                              ),
                              style: TextStyle(
                                fontFamily: 'arial',
                              ),
                            )
                          ],
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color:
                                    FlutterFlowTheme.of(context).textfieldColor,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
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
      ),
    );
  }
}
