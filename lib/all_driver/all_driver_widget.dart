import '/backend/api_requests/api_calls.dart';
import '/components/delete_driver_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'all_driver_model.dart';
export 'all_driver_model.dart';

class AllDriverWidget extends StatefulWidget {
  const AllDriverWidget({super.key});

  static String routeName = 'All_Driver';
  static String routePath = '/allDriver';

  @override
  State<AllDriverWidget> createState() => _AllDriverWidgetState();
}

class _AllDriverWidgetState extends State<AllDriverWidget> {
  late AllDriverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllDriverModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              19.0, 15.0, 19.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                              Expanded(
                                child: Builder(
                                  builder: (context) {
                                    if (_model.showSearch == true) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'cpsxpg93' /* All Drivers */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'arial',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            fontSize: 20.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.showSearch =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              FFIcons
                                                                  .kmagnifyingGlassSvgrepoCom,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                            ),
                                          ],
                                        ),
                                      );
                                    } else if (_model.showSearch == false) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 100.0,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .searchTextfieldColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            FFIcons
                                                                .kmagnifyingGlassSvgrepoCom,
                                                            color: Color(
                                                                0xFF292C34),
                                                            size: 18.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              safeSetState(() => _model
                                                                  .listViewPagingController
                                                                  ?.refresh());
                                                              await _model
                                                                  .waitForOnePageForListView();
                                                            },
                                                          ),
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              '08ozrchg' /* Search */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'arial',
                                                                      color: Color(
                                                                          0xFF636363),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: Color(
                                                                    0xFF636363),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.showSearch =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              safeSetState(() {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() => _model
                                                                  .listViewPagingController
                                                                  ?.refresh());
                                                              await _model
                                                                  .waitForOnePageForListView();
                                                            },
                                                            child: Icon(
                                                              FFIcons.kcross,
                                                              color: Color(
                                                                  0xFF636363),
                                                              size: 17.0,
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
                                      );
                                    } else {
                                      return Container(
                                        decoration: BoxDecoration(),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 1.0, 1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                        ChangeAccountWidget.routeName);
                                  },
                                  child: Icon(
                                    FFIcons.kviTOyw01,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      AddDriverWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 26.0,
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      safeSetState(
                          () => _model.listViewPagingController?.refresh());
                      await _model.waitForOnePageForListView();
                    },
                    child: PagedListView<ApiPagingParams, dynamic>(
                      pagingController: _model.setListViewController(
                        (nextPageMarker) =>
                            NewSpeedotrackJSApiGroup.driversGetApiCall.call(
                          jwt: FFAppState().userJwt,
                          pageNo: valueOrDefault<int>(
                            functions
                                .returnPlusOne(nextPageMarker.nextPageNumber),
                            1,
                          ),
                          noOfRows: '20',
                          searchVal: _model.textController.text,
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      builderDelegate: PagedChildBuilderDelegate<dynamic>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 50.0,
                            ),
                          ),
                        ),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) => Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRing(
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 50.0,
                            ),
                          ),
                        ),

                        itemBuilder: (context, _, allDriverListIndex) {
                          final allDriverListItem = _model
                              .listViewPagingController!
                              .itemList![allDriverListIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 18.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .tfBackGround,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FFIcons.k1655284,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        getJsonField(
                                          allDriverListItem,
                                          r'''$.name''',
                                        ).toString().maybeHandleOverflow(
                                              maxChars: 15,
                                            ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'arial',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      if (getJsonField(
                                            allDriverListItem,
                                            r'''$.assign_id''',
                                          ) !=
                                          getJsonField(
                                            <String, String>{
                                              'val': '',
                                            },
                                            r'''$.val''',
                                          ))
                                        Text(
                                          getJsonField(
                                            allDriverListItem,
                                            r'''$.assign_id''',
                                          ).toString().maybeHandleOverflow(
                                                maxChars: 15,
                                                replacement: '…',
                                              ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'arial',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textfieldColor,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 35.0,
                                      icon: Icon(
                                        Icons.edit,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed(
                                          UpdateDriverWidget.routeName,
                                          queryParameters: {
                                            'updateDeviceData': serializeParam(
                                              allDriverListItem,
                                              ParamType.JSON,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 8.0,
                                    buttonSize: 35.0,
                                    icon: Icon(
                                      Icons.delete,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 18.0,
                                    ),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: DeleteDriverWidget(
                                                deleteDriver: getJsonField(
                                                  allDriverListItem,
                                                  r'''$._id''',
                                                ).toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
