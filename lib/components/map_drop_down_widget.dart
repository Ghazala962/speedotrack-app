import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'map_drop_down_model.dart';
export 'map_drop_down_model.dart';

class MapDropDownWidget extends StatefulWidget {
  const MapDropDownWidget({super.key});

  @override
  State<MapDropDownWidget> createState() => _MapDropDownWidgetState();
}

class _MapDropDownWidgetState extends State<MapDropDownWidget>
    with TickerProviderStateMixin {
  late MapDropDownModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapDropDownModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -78.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

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
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 10.0, 12.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: 55.0,
            height: MediaQuery.sizeOf(context).height * 3.931,
            constraints: BoxConstraints(
              maxWidth: 580.0,
              maxHeight: 263.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3.0,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  offset: Offset(
                    0.0,
                    1.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.layers_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: 50.0,
                                    borderWidth: 1.0,
                                    buttonSize: 30.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    icon: Icon(
                                      Icons.traffic_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: FaIcon(
                                    FontAwesomeIcons.streetView,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.social_distance,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.switch_right,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 30.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.double_arrow_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 18.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
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
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
