import '/components/delete_device_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_device_test_model.dart';
export 'my_device_test_model.dart';

class MyDeviceTestWidget extends StatefulWidget {
  const MyDeviceTestWidget({super.key});

  static String routeName = 'MyDeviceTest';
  static String routePath = '/myDeviceTest';

  @override
  State<MyDeviceTestWidget> createState() => _MyDeviceTestWidgetState();
}

class _MyDeviceTestWidgetState extends State<MyDeviceTestWidget> {
  late MyDeviceTestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyDeviceTestModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.showSearch = false;
        safeSetState(() {});
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          19.0, 15.0, 19.0, 14.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (_model.showSearch ?? false) {
                                  return Container(
                                    height: 42.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 2.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'sp8gml22' /* All Devices */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 1.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.showSearch = false;
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    FFIcons
                                                        .kmagnifyingGlassSvgrepoCom,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 42.31,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  FFIcons
                                                      .kmagnifyingGlassSvgrepoCom,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 15.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'rdph03bl' /* Search Vehicle */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      hoverColor:
                                                          Color(0xFFF8F9FC),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color:
                                                              Color(0xFF808184),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.showSearch = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    FFIcons.kcross,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 14.0,
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
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 7.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(ChangeAccountWidget.routeName);
                              },
                              child: Icon(
                                FFIcons.kviTOyw01,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 25.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(AddDeviceWidget.routeName);
                              },
                              child: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 26.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final deviceList =
                                  FFAppState().allDeviceData.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: deviceList.length,
                                itemBuilder: (context, deviceListIndex) {
                                  final deviceListItem =
                                      deviceList[deviceListIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 15.0, 30.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    deviceListItem,
                                                    r'''$.name''',
                                                  )?.toString(),
                                                  'ABC1234',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Container(
                                              width: 200.0,
                                              height: 20.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ) ==
                                                          getJsonField(
                                                            <String, String?>{
                                                              'val': 'Moving',
                                                            },
                                                            r'''$.val''',
                                                          )) {
                                                        return Text(
                                                          getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: (getJsonField(
                                                                              deviceListItem,
                                                                              r'''$.status''',
                                                                            ) ==
                                                                            getJsonField(
                                                                              <String, String?>{
                                                                                'val': 'Moving',
                                                                              },
                                                                              r'''$.val''',
                                                                            )) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(context).success
                                                                    : FlutterFlowTheme.of(context).secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      } else if (getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ) ==
                                                          getJsonField(
                                                            <String, String?>{
                                                              'val': 'Stopped',
                                                            },
                                                            r'''$.val''',
                                                          )) {
                                                        return Text(
                                                          getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: (getJsonField(
                                                                              deviceListItem,
                                                                              r'''$.status''',
                                                                            ) ==
                                                                            getJsonField(
                                                                              <String, String?>{
                                                                                'val': 'Stopped',
                                                                              },
                                                                              r'''$.val''',
                                                                            )) ==
                                                                        true
                                                                    ? Color(0xFFAA252E)
                                                                    : FlutterFlowTheme.of(context).secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      } else if (getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ) ==
                                                          getJsonField(
                                                            <String, String?>{
                                                              'val':
                                                                  'Engine Idle',
                                                            },
                                                            r'''$.val''',
                                                          )) {
                                                        return Text(
                                                          getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: (getJsonField(
                                                                              deviceListItem,
                                                                              r'''$.status''',
                                                                            ) ==
                                                                            getJsonField(
                                                                              <String, String?>{
                                                                                'val': 'Engine Idle',
                                                                              },
                                                                              r'''$.val''',
                                                                            )) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(context).warning
                                                                    : FlutterFlowTheme.of(context).secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      } else {
                                                        return Text(
                                                          getJsonField(
                                                            deviceListItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .textfieldColor,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Theme(
                                                    data: ThemeData(
                                                      checkboxTheme:
                                                          CheckboxThemeData(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        materialTapTargetSize:
                                                            MaterialTapTargetSize
                                                                .shrinkWrap,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                              .checkboxValueMap[
                                                          deviceListItem] ??= false,
                                                      onChanged:
                                                          (newValue) async {
                                                        safeSetState(() => _model
                                                                    .checkboxValueMap[
                                                                deviceListItem] =
                                                            newValue!);
                                                      },
                                                      side: (FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate !=
                                                              null)
                                                          ? BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            )
                                                          : null,
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.more_vert_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'j6ltikzg' /* Device IMEI */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.more_vert_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  deviceListItem,
                                                  r'''$.imei''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textfieldColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'z2ug984y' /* Status Time */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.more_vert_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  getJsonField(
                                                    deviceListItem,
                                                    r'''$.status_time''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
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
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nviy8fja' /* Port */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.more_vert_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  deviceListItem,
                                                  r'''$.prot''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textfieldColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'uuwpj0ca' /* Expiry */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.more_vert_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  if (getJsonField(
                                                    deviceListItem,
                                                    r'''$.is_expired''',
                                                  )) {
                                                    return Icon(
                                                      Icons.close_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 20.0,
                                                    );
                                                  } else {
                                                    return Icon(
                                                      Icons.check_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      size: 20.0,
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'z9yjqq09' /* Expire Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Icon(
                                                  Icons.more_vert_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 15.0,
                                                ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  deviceListItem,
                                                  r'''$.expire_dt''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 10,
                                                    ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .textfieldColor,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          RenewListWidget
                                                              .routeName);
                                                    },
                                                    child: Icon(
                                                      FFIcons.krefresh,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                DeleteDeviceListWidget(
                                                              deleteDevice:
                                                                  getJsonField(
                                                                deviceListItem,
                                                                r'''$.imei''',
                                                              ).toString(),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Icon(
                                                    FFIcons.kremove3,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  getJsonField(
                                                    deviceListItem,
                                                    r'''$.location_data.dt_tracker''',
                                                  )?.toString(),
                                                  '0',
                                                ).maybeHandleOverflow(
                                                  maxChars: 10,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.nunito(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textfieldColor,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 3.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
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
    );
  }
}
