import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'edit_group_model.dart';
export 'edit_group_model.dart';

class EditGroupWidget extends StatefulWidget {
  const EditGroupWidget({
    super.key,
    this.editGroup,
  });

  final dynamic editGroup;

  @override
  State<EditGroupWidget> createState() => _EditGroupWidgetState();
}

class _EditGroupWidgetState extends State<EditGroupWidget> {
  late EditGroupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditGroupModel());

    _model.groupNameTextController ??= TextEditingController(
        text: getJsonField(
      widget.editGroup,
      r'''$.name''',
    ).toString().toString());
    _model.groupNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 366.0,
        height: 360.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 22.0, 30.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'udly4w62' /* Edit Group */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FFIcons.kcross,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(31.0, 22.0, 31.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'tw7d58bg' /* Group Name */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            width: 331.78,
                            child: TextFormField(
                              controller: _model.groupNameTextController,
                              focusNode: _model.groupNameFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '8qmv3rzn' /* Name of Group */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9F9F9F),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF9F9F9F),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color: FlutterFlowTheme.of(context)
                                        .textfieldColor,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              validator: _model.groupNameTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(31.0, 22.0, 31.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'xgjewmz8' /* Device */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'arial',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 30.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FlutterFlowDropDown<String>(
                            multiSelectController:
                                _model.vehicalNumberValueController ??=
                                    FormListFieldController<String>(
                                        _model.vehicalNumberValue ??=
                                            List<String>.from(
                              (getJsonField(
                                    widget.editGroup,
                                    r'''$.devices[:]._id''',
                                    true,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList() ??
                                  [],
                            )),
                            options: List<String>.from((getJsonField(
                              FFAppState().allDeviceData,
                              r'''$[:]._id''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()),
                            optionLabels: (getJsonField(
                              FFAppState().allDeviceData,
                              r'''$[:].name''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList(),
                            width: 331.8,
                            height: 48.0,
                            searchHintTextStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                ),
                            searchTextStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  letterSpacing: 0.0,
                                ),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'gnmngxtq' /* Select Device */,
                            ),
                            searchHintText: FFLocalizations.of(context).getText(
                              'oq3s5cjh' /* Search... */,
                            ),
                            icon: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: Color(0xFF9F9F9F),
                            borderWidth: 0.5,
                            borderRadius: 5.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: true,
                            isMultiSelect: true,
                            onMultiSelectChanged: (val) => safeSetState(
                                () => _model.vehicalNumberValue = val),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(22.0, 30.0, 22.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            _model.updateGroupApi =
                                await NewSpeedotrackJSApiGroup
                                    .updateGroupApiCall
                                    .call(
                              name: _model.groupNameTextController.text,
                              jwt: FFAppState().userJwt,
                              grouID: getJsonField(
                                widget.editGroup,
                                r'''$._id''',
                              ).toString(),
                              devicesList: _model.vehicalNumberValue,
                            );

                            if ((_model.updateGroupApi?.succeeded ?? true)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Updated Successfully!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).movingGreen,
                                ),
                              );

                              context.pushNamed(AllGroupWidget.routeName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    getJsonField(
                                      (_model.updateGroupApi?.jsonBody ?? ''),
                                      r'''$.message''',
                                    ).toString(),
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).redColor,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '5bmk65xq' /* SAVE */,
                          ),
                          options: FFButtonOptions(
                            width: 263.0,
                            height: 36.0,
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
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
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
