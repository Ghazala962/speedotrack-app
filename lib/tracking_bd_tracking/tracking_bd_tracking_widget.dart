import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tracking_bd_tracking_model.dart';
export 'tracking_bd_tracking_model.dart';

class TrackingBdTrackingWidget extends StatefulWidget {
  const TrackingBdTrackingWidget({super.key});

  static String routeName = 'TrackingBd_Tracking';
  static String routePath = '/trackingBdTracking';

  @override
  State<TrackingBdTrackingWidget> createState() =>
      _TrackingBdTrackingWidgetState();
}

class _TrackingBdTrackingWidgetState extends State<TrackingBdTrackingWidget> {
  late TrackingBdTrackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingBdTrackingModel());

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
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/display-a-map-b4974c7cfef498eb43e99ab60191cbaf.png',
                                            ).image,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      25.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FFFFFF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_back_ios_new_rounded,
                                                                  color: Color(
                                                                      0xFF19517E),
                                                                  size: 24.0,
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
                                                                      30.0,
                                                                      18.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          3.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        1.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .download_rounded,
                                                                  color: Color(
                                                                      0xFF19517E),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            3.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          1.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons
                                                                        .account_tree_outlined,
                                                                    color: Color(
                                                                        0xFF19517E),
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            3.0,
                                                                        color: Color(
                                                                            0x33000000),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          1.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .mapMarkedAlt,
                                                                      color: Color(
                                                                          0xFF19517E),
                                                                      size:
                                                                          18.0,
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
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 679.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          16.0),
                                                                ),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 144.0,
                                                                                    decoration: BoxDecoration(
                                                                                      gradient: LinearGradient(
                                                                                        colors: [
                                                                                          Color(0xFFE0F1FD),
                                                                                          FlutterFlowTheme.of(context).secondaryBackground
                                                                                        ],
                                                                                        stops: [0.0, 1.0],
                                                                                        begin: AlignmentDirectional(0.0, -1.0),
                                                                                        end: AlignmentDirectional(0, 1.0),
                                                                                      ),
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                        bottomRight: Radius.circular(0.0),
                                                                                        topLeft: Radius.circular(20.0),
                                                                                        topRight: Radius.circular(20.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: 50.0,
                                                                                                      height: 4.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).accent1,
                                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).accent1,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'fi40cde9' /* CAR12345 */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: Color(0xFF163F73),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 15.0,
                                                                                                        height: 15.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          shape: BoxShape.circle,
                                                                                                        ),
                                                                                                        child: Icon(
                                                                                                          Icons.keyboard_arrow_right_sharp,
                                                                                                          color: Color(0xFF163F73),
                                                                                                          size: 10.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Icon(
                                                                                                              Icons.timelapse_rounded,
                                                                                                              color: Color(0xFF163F73),
                                                                                                              size: 18.0,
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                FFLocalizations.of(context).getText(
                                                                                                                  'seuo57uq' /* 2025-01-16  10:19:00 */,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'arial',
                                                                                                                      color: Color(0xFF163F73),
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.speed_sharp,
                                                                                                                color: Color(0xFF163F73),
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'sf2gkdyg' /* 63.06km */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: Color(0xFF163F73),
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.more_time,
                                                                                                                color: Color(0xFF163F73),
                                                                                                                size: 18.0,
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  FFLocalizations.of(context).getText(
                                                                                                                    'm7z3tr86' /* 21 km/h */,
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: Color(0xFF163F73),
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 52.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                            topLeft: Radius.circular(20.0),
                                                                                                            topRight: Radius.circular(20.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Icon(
                                                                                                                Icons.play_circle,
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                size: 24.0,
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Slider(
                                                                                                                  activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                  inactiveColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                  min: 0.0,
                                                                                                                  max: 10.0,
                                                                                                                  value: _model.sliderValue ??= 5.0,
                                                                                                                  onChanged: (newValue) {
                                                                                                                    newValue = double.parse(newValue.toStringAsFixed(2));
                                                                                                                    safeSetState(() => _model.sliderValue = newValue);
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                              FFButtonWidget(
                                                                                                                onPressed: () {
                                                                                                                  print('Button pressed ...');
                                                                                                                },
                                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                                  '77f250vs' /* Medium */,
                                                                                                                ),
                                                                                                                options: FFButtonOptions(
                                                                                                                  width: 80.0,
                                                                                                                  height: 30.0,
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                        fontFamily: 'arial',
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                  elevation: 0.0,
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    width: 3.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(20.0),
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
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 100.0,
                                                                                  height: 111.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                      child: Container(
                                                                                                        width: 100.0,
                                                                                                        height: 32.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Color(0xFFEFEFEF),
                                                                                                          borderRadius: BorderRadius.circular(6.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                                                    child: Container(
                                                                                                                      width: 76.0,
                                                                                                                      height: 25.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: Color(0x00FFFFFF),
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '32dem19a' /* Recent */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 13.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                                                    child: Container(
                                                                                                                      width: 76.0,
                                                                                                                      height: 25.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'tu17nhmv' /* Day */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 13.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                                                    child: Container(
                                                                                                                      width: 76.0,
                                                                                                                      height: 25.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: Color(0x00FFFFFF),
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'kluzwuts' /* Week */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 13.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                                                    child: Container(
                                                                                                                      width: 76.0,
                                                                                                                      height: 25.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: Color(0x00FFFFFF),
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                      ),
                                                                                                                      child: Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'geqoxguq' /* Custom */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'arial',
                                                                                                                                fontSize: 13.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                              child: SingleChildScrollView(
                                                                                                scrollDirection: Axis.horizontal,
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: 64.0,
                                                                                                          height: 55.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            borderRadius: BorderRadius.circular(6.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              width: 2.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'errag2ll' /* Sun. */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: Color(0xFFD6DEE5),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      '6vyh8pqd' /* 01-19 */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'arial',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '7xxcrp2u' /* Mon. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '9j9j4rqt' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'u6f2bpiw' /* Tue. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'cipq9qcw' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        '1c33ust9' /* Wed. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'rcocgz1u' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'fsg5gdel' /* Thu. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'lcbkvw8p' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'q5szjtwg' /* Fri. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'qxvtjegn' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            width: 64.0,
                                                                                                            height: 55.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).accent1,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Align(
                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'r0psd42j' /* Sat. */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      FFLocalizations.of(context).getText(
                                                                                                                        'rx1becf5' /* 01-19 */,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'arial',
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
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
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                5.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 68.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x00FFFFFF),
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                      border: Border.all(
                                                                                        color: Color(0xFF163F73),
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.directions_car,
                                                                                                color: Color(0xFF64D654),
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'ctc98eya' /* 2h 57 min */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 25.0,
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).warning,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Icon(
                                                                                                  Icons.more_time,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'cytxdrmz' /* 2h 57 min */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 25.0,
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Icon(
                                                                                                  Icons.pin_drop,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'bwizlar9' /* 2h 57 min */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 25.0,
                                                                                                height: 25.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  shape: BoxShape.circle,
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Icon(
                                                                                                  Icons.more_time,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'uqelwdgq' /* 2h 57 min */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                6.0,
                                                                                15.0,
                                                                                6.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 89.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'vaf8w97s' /* 01/21 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'qedjvdd1' /* 08:18 */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    shape: BoxShape.circle,
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        '375mktnl' /* P */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 25.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: 40.0,
                                                                                                      child: VerticalDivider(
                                                                                                        thickness: 2.0,
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Icon(
                                                                                                        Icons.access_time,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'vapncyqh' /* 1 h 0m */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'arial',
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'hk21wj4d' /* কাকরাইল, নয়া পল্টন, ঢাকা মেট্... */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'arial',
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                6.0,
                                                                                15.0,
                                                                                6.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 89.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '5xl9vu2t' /* 01/21 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'qgl05wzf' /* 08:18 */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFF64D654),
                                                                                                    shape: BoxShape.circle,
                                                                                                    border: Border.all(
                                                                                                      color: Color(0xFF64D654),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Icon(
                                                                                                    Icons.directions_car,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: 40.0,
                                                                                                      child: VerticalDivider(
                                                                                                        thickness: 2.0,
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Icon(
                                                                                                        Icons.access_time,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              '43a1c75t' /* 1 h 0m */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'arial',
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'zgtc0bne' /* কাকরাইল, নয়া পল্টন, ঢাকা মেট্... */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'arial',
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
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
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                15.0,
                                                                                6.0,
                                                                                15.0,
                                                                                6.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 89.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '2yg168ig' /* 01/21 */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'dfrfv2ui' /* 08:18 */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    shape: BoxShape.circle,
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'w51tkazg' /* P */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'arial',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            fontSize: 25.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    SizedBox(
                                                                                                      height: 40.0,
                                                                                                      child: VerticalDivider(
                                                                                                        thickness: 2.0,
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 10.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Icon(
                                                                                                        Icons.access_time,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        size: 20.0,
                                                                                                      ),
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'ehajbm0x' /* 1 h 0m */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'arial',
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              FFLocalizations.of(context).getText(
                                                                                                                'xkz8fzi6' /* কাকরাইল, নয়া পল্টন, ঢাকা মেট্... */,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'arial',
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
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
                                    ],
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
          ],
        ),
      ),
    );
  }
}
