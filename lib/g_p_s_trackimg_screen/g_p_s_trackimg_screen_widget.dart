import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'g_p_s_trackimg_screen_model.dart';
export 'g_p_s_trackimg_screen_model.dart';

class GPSTrackimgScreenWidget extends StatefulWidget {
  const GPSTrackimgScreenWidget({super.key});

  static String routeName = 'GPS_Trackimg_Screen';
  static String routePath = '/gPSTrackimgScreen';

  @override
  State<GPSTrackimgScreenWidget> createState() =>
      _GPSTrackimgScreenWidgetState();
}

class _GPSTrackimgScreenWidgetState extends State<GPSTrackimgScreenWidget> {
  late GPSTrackimgScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GPSTrackimgScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      drawer: Drawer(
        elevation: 16.0,
        child: wrapWithModel(
          model: _model.drawerComponentModel,
          updateCallback: () => safeSetState(() {}),
          child: DrawerComponentWidget(),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  FlutterFlowGoogleMap(
                    controller: _model.googleMapsController,
                    onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
                    initialLocation: _model.googleMapsCenter ??=
                        LatLng(13.106061, -59.613158),
                    markerColor: GoogleMarkerColor.violet,
                    mapType: MapType.normal,
                    style: GoogleMapStyle.standard,
                    initialZoom: 14.0,
                    allowInteraction: true,
                    allowZoom: true,
                    showZoomControls: true,
                    showLocation: true,
                    showCompass: false,
                    showMapToolbar: false,
                    showTraffic: false,
                    centerMapOnMarkerTap: true,
                  ),
                  PointerInterceptor(
                    intercepting: isWeb,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 370.0,
                            height: 53.9,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_back,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'd0ixwb0x' /* JH 01ES 4957 (B29) */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'arial',
                                                color: Color(0xFF3E8737),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Container(
                                          width: 270.0,
                                          height: 19.1,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '4oldk2c2' /* CCR9 + JRX, Neuri, Jharkhand 8... */,
                                            ),
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FFIcons.kmarker,
                                        color: Color(0xFF494947),
                                        size: 24.0,
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
                  Align(
                    alignment: AlignmentDirectional(-0.96, -0.18),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.refresh_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.96, -0.03),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          FFIcons.kcreate,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.94, 0.12),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.report_problem_rounded,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.94, 0.27),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.flare,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.94, 0.42),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        icon: Icon(
                          Icons.traffic_sharp,
                          color: FlutterFlowTheme.of(context).error,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.93, 0.56),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.photo_album,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.93, 0.71),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.lock_open,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.95, -0.32),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'o5f16j0r' /* P */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: Color(0xFF3E8737),
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.92, -0.74),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          child: Icon(
                            Icons.my_location,
                            color: Color(0xFF6E7172),
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.88, -0.59),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: FlutterFlowIconButton(
                        borderColor: Color(0xFFEC8431),
                        borderRadius: 30.0,
                        buttonSize: 45.0,
                        fillColor: Color(0xFFEC8431),
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: PointerInterceptor(
                      intercepting: isWeb,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 4.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '6b6pkk3y' /* 6 Feb 25, 10:05 PM */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: Color(0xFF3E8737),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'as4wa9m2' /* Ping Time */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 4.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'oyco415u' /* 5 hours, 50 minutes */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: Color(0xFF3E8737),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qewujhmd' /* Stopped Since */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
    );
  }
}
