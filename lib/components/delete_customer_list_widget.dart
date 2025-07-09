import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'delete_customer_list_model.dart';
export 'delete_customer_list_model.dart';

class DeleteCustomerListWidget extends StatefulWidget {
  const DeleteCustomerListWidget({super.key});

  @override
  State<DeleteCustomerListWidget> createState() =>
      _DeleteCustomerListWidgetState();
}

class _DeleteCustomerListWidgetState extends State<DeleteCustomerListWidget> {
  late DeleteCustomerListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteCustomerListModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 16.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 176.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                color: Color(0x34000000),
                offset: Offset(
                  -2.0,
                  5.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: 400.0,
              height: 241.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x3B1D2429),
                    offset: Offset(
                      0.0,
                      -3.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'e9r8v6r9' /* Confirm Delete */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'arial',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          borderRadius: 30.0,
                          buttonSize: 30.0,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'oekioyyl' /* Are you sure you want to delet... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'r3hc0bz7' /* Yes, Delete it */,
                            ),
                            options: FFButtonOptions(
                              width: 120.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFE83204),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'arial',
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFFE83204),
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'fgsyo9nj' /* No, Keep It */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
