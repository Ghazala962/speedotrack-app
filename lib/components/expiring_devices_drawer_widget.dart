import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'expiring_devices_drawer_model.dart';
export 'expiring_devices_drawer_model.dart';

class ExpiringDevicesDrawerWidget extends StatefulWidget {
  const ExpiringDevicesDrawerWidget({
    super.key,
    this.expiringDevices,
  });

  final List<dynamic>? expiringDevices;

  @override
  State<ExpiringDevicesDrawerWidget> createState() =>
      _ExpiringDevicesDrawerWidgetState();
}

class _ExpiringDevicesDrawerWidgetState
    extends State<ExpiringDevicesDrawerWidget> {
  late ExpiringDevicesDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExpiringDevicesDrawerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          width: 300.0,
          height: 530.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 15.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 5.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'r6c2cy2g' /* Expiring Devices */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '2vt8e0lg' /* Your Device will expire very s... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'arial',
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 384.0,
                  decoration: BoxDecoration(),
                  child: Builder(
                    builder: (context) {
                      final listOfExpiringDevices =
                          widget.expiringDevices?.toList() ?? [];

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listOfExpiringDevices.length,
                        itemBuilder: (context, listOfExpiringDevicesIndex) {
                          final listOfExpiringDevicesItem =
                              listOfExpiringDevices[listOfExpiringDevicesIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 5.0, 20.0, 5.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 4.0,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  listOfExpiringDevicesItem,
                                                  r'''$.name''',
                                                )?.toString(),
                                                'not found!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'arial',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                getJsonField(
                                                  listOfExpiringDevicesItem,
                                                  r'''$.object_expire_dt''',
                                                )?.toString(),
                                                'not found!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'arial',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/360_F_950655352_K4sc1JNpLhnIDP01RHs3nu4cYzTc52w2-removebg-preview.png',
                                            width: 66.0,
                                            height: 200.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: '+8801683200939',
                          ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 7.0, 0.0),
                              child: Icon(
                                Icons.call,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '69kj6js5' /* Call for renewal */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await launchURL('https://mygpsbd.com/paynow');
                      },
                      text: FFLocalizations.of(context).getText(
                        'w7zjpx76' /* Pay Now */,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.paypal,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 35.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'arial',
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
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
