import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'locked_and_unlocked_images_model.dart';
export 'locked_and_unlocked_images_model.dart';

class LockedAndUnlockedImagesWidget extends StatefulWidget {
  const LockedAndUnlockedImagesWidget({
    super.key,
    this.tripSealData,
  });

  final dynamic tripSealData;

  static String routeName = 'LockedAndUnlockedImages';
  static String routePath = '/lockedAndUnlockedImages';

  @override
  State<LockedAndUnlockedImagesWidget> createState() =>
      _LockedAndUnlockedImagesWidgetState();
}

class _LockedAndUnlockedImagesWidgetState
    extends State<LockedAndUnlockedImagesWidget> with TickerProviderStateMixin {
  late LockedAndUnlockedImagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LockedAndUnlockedImagesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
              size: 22.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '4mmdq9yy' /* Lock & Unlock */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'arial',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 17.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 15.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7d8co1r0' /* Locked and Unlocked Images Lis... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 837.0,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).secondary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'arial',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).secondary,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'sfql77fo' /* Locked Images */,
                                    ),
                                    icon: FaIcon(
                                      FontAwesomeIcons.lock,
                                      size: 18.0,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'jmsvanm9' /* Unlocked Images */,
                                    ),
                                    icon: FaIcon(
                                      FontAwesomeIcons.unlock,
                                      size: 20.0,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 15.0, 18.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final lockImages = getJsonField(
                                                widget.tripSealData,
                                                r'''$.lockImages''',
                                              ).toList();

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 1.0,
                                                  mainAxisSpacing: 1.0,
                                                  childAspectRatio: 1.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: lockImages.length,
                                                itemBuilder:
                                                    (context, lockImagesIndex) {
                                                  final lockImagesItem =
                                                      lockImages[
                                                          lockImagesIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        lockImagesItem
                                                            .toString(),
                                                        width: 200.0,
                                                        height: 200.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 15.0, 18.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: GridView(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 1.0,
                                              mainAxisSpacing: 1.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    'https://picsum.photos/seed/559/600',
                                                    width: 200.0,
                                                    height: 200.0,
                                                    fit: BoxFit.cover,
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
