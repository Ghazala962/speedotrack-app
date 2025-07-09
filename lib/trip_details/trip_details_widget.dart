import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'trip_details_model.dart';
export 'trip_details_model.dart';

class TripDetailsWidget extends StatefulWidget {
  const TripDetailsWidget({super.key});

  static String routeName = 'tripDetails';
  static String routePath = '/tripDetails';

  @override
  State<TripDetailsWidget> createState() => _TripDetailsWidgetState();
}

class _TripDetailsWidgetState extends State<TripDetailsWidget> {
  late TripDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripDetailsModel());

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
              FFIcons.kiosArrowLeft,
              color: FlutterFlowTheme.of(context).secondary,
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'rzd9lnh4' /* Trip Details  */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'arial',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.92,
            decoration: BoxDecoration(),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: 266.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'f85mkido' /* Trip Name */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                  EditDeviceListWidget
                                                      .routeName);
                                            },
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: Color(0xFFC9CED5),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.delete_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'hxp3r30e' /* IMEI :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'wevuv6yz' /* 84577856788778 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          color: Color(0xFF818A95),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'pnzkkdhu' /* Sim Card No :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '7aofb3ku' /* 84577856788778 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'rebdbhtv' /* Last Connection :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'upi99p3p' /* 2024-08-09-21 6:55:20 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'msss4kbi' /* Protocol :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '23acay2i' /* 2024-08-09-21 6:55:20 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'hqhzm2tv' /* Net Protocol :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'a7sqvvdp' /* 2024-08-09-21 6:55:20 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9uhs5shj' /* Port :   */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'av8uqy1v' /* 2024-08-09-21 6:55:20 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color: Color(0xFF818A95),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'arial',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                          NewTrackingScreenWidget.routeName);
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.searchLocation,
                                      color: Color(0xFF1EE533),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.file_copy_sharp,
                                    color: Color(0xFF1EE533),
                                    size: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                    CreateSealInfoWidget
                                                        .routeName);
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '5r3yu0bi' /* Scan Seal */,
                                              ),
                                              icon: Icon(
                                                Icons.qr_code_scanner,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print('Button pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '25m2b5mc' /* View Challan */,
                                              ),
                                              icon: Icon(
                                                Icons.remove_red_eye_sharp,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                height: 30.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 1.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(width: 10.0))
                                            .around(SizedBox(width: 10.0)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
