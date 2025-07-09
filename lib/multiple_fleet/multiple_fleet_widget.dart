import '/components/bottom_share_location_widget.dart';
import '/components/drawer_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'multiple_fleet_model.dart';
export 'multiple_fleet_model.dart';

class MultipleFleetWidget extends StatefulWidget {
  const MultipleFleetWidget({super.key});

  static String routeName = 'Multiple_Fleet';
  static String routePath = '/multipleFleet';

  @override
  State<MultipleFleetWidget> createState() => _MultipleFleetWidgetState();
}

class _MultipleFleetWidgetState extends State<MultipleFleetWidget> {
  late MultipleFleetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MultipleFleetModel());

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
              child: Container(
                width: double.infinity,
                height: 917.0,
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
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets
                                                  .MultipleScreenTracking(
                                                width: double.infinity,
                                                height: double.infinity,
                                                sidebarIcon: Icon(
                                                  FFIcons.kgroup10000087461,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 17.0,
                                                ),
                                                changeAccountIcon: Icon(
                                                  FFIcons.kviTOyw01,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 26.0,
                                                ),
                                                searchIcon: Icon(
                                                  FFIcons
                                                      .kmagnifyingGlassSvgrepoCom,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                                textSearchIcon: Icon(
                                                  FFIcons
                                                      .kmagnifyingGlassSvgrepoCom,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 18.0,
                                                ),
                                                closeIcon: Icon(
                                                  FFIcons.kcross,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 15.0,
                                                ),
                                                openSidebar: () async {
                                                  scaffoldKey.currentState!
                                                      .openDrawer();
                                                },
                                                changeAccount: () async {
                                                  context.pushNamed(
                                                      ChangeAccountWidget
                                                          .routeName);
                                                },
                                                navigatePlayback:
                                                    (deviceData) async {
                                                  context.pushNamed(
                                                    PlaybackLoadingWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'deviceImei':
                                                          serializeParam(
                                                        getJsonField(
                                                          deviceData,
                                                          r'''$.imei''',
                                                        ).toString(),
                                                        ParamType.String,
                                                      ),
                                                      'startDate':
                                                          serializeParam(
                                                        functions
                                                            .returnCurrentDate(),
                                                        ParamType.String,
                                                      ),
                                                      'endDate': serializeParam(
                                                        functions
                                                            .returnTommorowDate(),
                                                        ParamType.String,
                                                      ),
                                                      'minStopDuration':
                                                          serializeParam(
                                                        '1',
                                                        ParamType.String,
                                                      ),
                                                      'deviceData':
                                                          serializeParam(
                                                        deviceData,
                                                        ParamType.JSON,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                navigateTracking:
                                                    (deviceData) async {
                                                  context.pushNamed(
                                                    NewTrackingScreenWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'singleDeviceData':
                                                          serializeParam(
                                                        deviceData,
                                                        ParamType.JSON,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                launchGoogleMap:
                                                    (lat, lng) async {
                                                  await launchURL(functions
                                                      .returnGoogleMapNavigateLink(
                                                          lat, lng));
                                                },
                                                openShare: (deviceData) async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            BottomShareLocationWidget(
                                                          deviceData:
                                                              deviceData,
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
