import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'create_trip_info_model.dart';
export 'create_trip_info_model.dart';

class CreateTripInfoWidget extends StatefulWidget {
  const CreateTripInfoWidget({super.key});

  static String routeName = 'Create_Trip_Info';
  static String routePath = '/createTripInfo';

  @override
  State<CreateTripInfoWidget> createState() => _CreateTripInfoWidgetState();
}

class _CreateTripInfoWidgetState extends State<CreateTripInfoWidget>
    with TickerProviderStateMixin {
  late CreateTripInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTripInfoModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??= TextEditingController();
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textController9 ??= TextEditingController();
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController10 ??= TextEditingController();
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController11 ??= TextEditingController();
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController12 ??= TextEditingController();
    _model.textFieldFocusNode12 ??= FocusNode();

    _model.textController13 ??= TextEditingController();
    _model.textFieldFocusNode13 ??= FocusNode();

    _model.textController14 ??= TextEditingController();
    _model.textFieldFocusNode14 ??= FocusNode();

    _model.invoiceTextController ??= TextEditingController();
    _model.invoiceFocusNode ??= FocusNode();

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
              Expanded(
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 15.0, 20.0, 0.0),
                                              child: Container(
                                                width: 100.0,
                                                height: 42.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 1.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          context.safePop();
                                                        },
                                                        child: Icon(
                                                          FFIcons.kiosArrowLeft,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2p6mpunp' /* Create Trip Information  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily:
                                                                    'arial',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'arial',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    unselectedLabelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .override(
                                                              fontFamily:
                                                                  'arial',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    tabs: [
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3vg1u5a4' /* Trip Details */,
                                                        ),
                                                      ),
                                                      Tab(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'by6no399' /* Unloading Points */,
                                                        ),
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: SpeedoTrackSealsGroup
                                                                    .getUserApiCall
                                                                    .call(
                                                                  jwt: FFAppState()
                                                                      .userJwt,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final columnGetUserApiResponse =
                                                                      snapshot
                                                                          .data!;

                                                                  return SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              18.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 60.0,
                                                                                  height: 4.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ysox0cw6' /* Device Name */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController1,
                                                                                    focusNode: _model.textFieldFocusNode1,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController1Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gy39t5pq' /* IMEI */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.dropDownValueController1 ??= FormFieldController<String>(
                                                                                    _model.dropDownValue1 ??= 'Option 1',
                                                                                  ),
                                                                                  options: List<String>.from((getJsonField(
                                                                                    FFAppState().DeviceList,
                                                                                    r'''$[:].imei''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()),
                                                                                  optionLabels: (getJsonField(
                                                                                    FFAppState().DeviceList,
                                                                                    r'''$[:].imei''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList(),
                                                                                  onChanged: (val) async {
                                                                                    safeSetState(() => _model.dropDownValue1 = val);
                                                                                    _model.showVal = true;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  width: 200.0,
                                                                                  height: 42.0,
                                                                                  searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'fsfam726' /* Select... */,
                                                                                  ),
                                                                                  searchHintText: FFLocalizations.of(context).getText(
                                                                                    'ube6razp' /* Search... */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0xFF9F9F9F),
                                                                                  borderWidth: 0.5,
                                                                                  borderRadius: 5.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: true,
                                                                                  isMultiSelect: false,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '7o3gwycj' /* Buyer */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController2,
                                                                                    focusNode: _model.textFieldFocusNode2,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController2Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'bsht2saf' /* Seller */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController3,
                                                                                    focusNode: _model.textFieldFocusNode3,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController3Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pgfch7z7' /* Vehicle No. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController4,
                                                                                    focusNode: _model.textFieldFocusNode4,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController4Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '73rq7m9d' /* Driver Name */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController5,
                                                                                    focusNode: _model.textFieldFocusNode5,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController5Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'xzlbl86v' /* Driver Mobile No */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController6,
                                                                                    focusNode: _model.textFieldFocusNode6,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController6Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'u8elhngb' /* Transport Name & No. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController7,
                                                                                    focusNode: _model.textFieldFocusNode7,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController7Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'iptqyxwv' /* Licence No */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController8,
                                                                                    focusNode: _model.textFieldFocusNode8,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController8Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'tpj3gfgc' /* LR No. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController9,
                                                                                    focusNode: _model.textFieldFocusNode9,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController9Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'vts2rsj7' /* DO No. */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController10,
                                                                                    focusNode: _model.textFieldFocusNode10,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController10Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'dpftjwi6' /* Loading Point */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.dropDownValueController2 ??= FormFieldController<String>(
                                                                                    _model.dropDownValue2 ??= '',
                                                                                  ),
                                                                                  options: List<String>.from((getJsonField(
                                                                                    FFAppState().markerList,
                                                                                    r'''$[:]._id''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()),
                                                                                  optionLabels: (getJsonField(
                                                                                    FFAppState().markerList,
                                                                                    r'''$[:].name''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList(),
                                                                                  onChanged: (val) => safeSetState(() => _model.dropDownValue2 = val),
                                                                                  width: 200.0,
                                                                                  height: 42.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    '2m9qhot8' /* Select... */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0xFF9F9F9F),
                                                                                  borderWidth: 0.5,
                                                                                  borderRadius: 5.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: false,
                                                                                  isMultiSelect: false,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ys89h0z2' /* Cargo */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController11,
                                                                                    focusNode: _model.textFieldFocusNode11,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController11Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'xzufld52' /* Weight */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController12,
                                                                                    focusNode: _model.textFieldFocusNode12,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController12Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '5cq2i10i' /* Distance */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController13,
                                                                                    focusNode: _model.textFieldFocusNode13,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController13Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'w6kum0wq' /* Eliminated Time */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.textController14,
                                                                                    focusNode: _model.textFieldFocusNode14,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: 'arial',
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: Color(0xFF9F9F9F),
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          width: 0.5,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'arial',
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.textController14Validator.asValidator(context),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              12.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'anznqueu' /* Customer */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'arial',
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              12.0,
                                                                              18.0,
                                                                              20.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  multiSelectController: _model.dropDownValueController3 ??= FormListFieldController<String>(null),
                                                                                  options: List<String>.from((getJsonField(
                                                                                    columnGetUserApiResponse.jsonBody,
                                                                                    r'''$.result[:]._id''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList()),
                                                                                  optionLabels: (getJsonField(
                                                                                    columnGetUserApiResponse.jsonBody,
                                                                                    r'''$.result[:].username''',
                                                                                    true,
                                                                                  ) as List)
                                                                                      .map<String>((s) => s.toString())
                                                                                      .toList(),
                                                                                  width: 200.0,
                                                                                  height: 42.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'arial',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'pv0k7fp3' /* Select... */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Color(0xFF9F9F9F),
                                                                                  borderWidth: 0.5,
                                                                                  borderRadius: 5.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: false,
                                                                                  isMultiSelect: true,
                                                                                  onMultiSelectChanged: (val) => safeSetState(() => _model.dropDownValue3 = val),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          15.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFF9F9F9F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 10.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ku9e2gdr' /* Create Unloading Points */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'arial',
                                                                                                fontSize: 15.0,
                                                                                                letterSpacing: 0.0,
                                                                                              ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Align(
                                                                                            alignment: AlignmentDirectional(1.0, 0.0),
                                                                                            child: FlutterFlowIconButton(
                                                                                              borderColor: FlutterFlowTheme.of(context).primary,
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 40.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).primary,
                                                                                              icon: Icon(
                                                                                                Icons.add,
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                _model.addToUnloadingPoints(UnlodingPointsDataTypeStruct(
                                                                                                  unloadingPoint: _model.unloadingPointValue,
                                                                                                  invoiceNo: _model.invoiceTextController.text,
                                                                                                ));
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.invoiceTextController,
                                                                                                  focusNode: _model.invoiceFocusNode,
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                                      'p7uiygga' /* Enter Invoice Number */,
                                                                                                    ),
                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          fontFamily: 'arial',
                                                                                                          letterSpacing: 0.0,
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFF9F9F9F),
                                                                                                        width: 0.5,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFF9F9F9F),
                                                                                                        width: 0.5,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 0.5,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                        width: 0.5,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                    ),
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'arial',
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.invoiceTextControllerValidator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              FlutterFlowDropDown<String>(
                                                                                                controller: _model.unloadingPointValueController ??= FormFieldController<String>(
                                                                                                  _model.unloadingPointValue ??= getJsonField(
                                                                                                    FFAppState().markersList.firstOrNull,
                                                                                                    r'''$._id''',
                                                                                                  ).toString(),
                                                                                                ),
                                                                                                options: List<String>.from((getJsonField(
                                                                                                  FFAppState().markerList,
                                                                                                  r'''$[:]._id''',
                                                                                                  true,
                                                                                                ) as List)
                                                                                                    .map<String>((s) => s.toString())
                                                                                                    .toList()),
                                                                                                optionLabels: (getJsonField(
                                                                                                  FFAppState().markerList,
                                                                                                  r'''$[:].name''',
                                                                                                  true,
                                                                                                ) as List)
                                                                                                    .map<String>((s) => s.toString())
                                                                                                    .toList(),
                                                                                                onChanged: (val) => safeSetState(() => _model.unloadingPointValue = val),
                                                                                                width: double.infinity,
                                                                                                height: 42.0,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'arial',
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  '2fsyzkod' /* Select... */,
                                                                                                ),
                                                                                                icon: Icon(
                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                elevation: 2.0,
                                                                                                borderColor: Color(0xFF9F9F9F),
                                                                                                borderWidth: 0.5,
                                                                                                borderRadius: 5.0,
                                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                hidesUnderline: true,
                                                                                                isOverButton: false,
                                                                                                isSearchable: false,
                                                                                                isMultiSelect: false,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final unloadingPointsList = _model.unloadingPoints.toList();

                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.zero,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: unloadingPointsList.length,
                                                                                          itemBuilder: (context, unloadingPointsListIndex) {
                                                                                            final unloadingPointsListItem = unloadingPointsList[unloadingPointsListIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(14.0, 16.0, 14.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        height: 92.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              blurRadius: 0.0,
                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                              offset: Offset(
                                                                                                                0.0,
                                                                                                                1.0,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 4.0,
                                                                                                                height: 44.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    width: 2.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        unloadingPointsListItem.unloadingPoint,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                              fontFamily: 'arial',
                                                                                                                              letterSpacing: 0.0,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            unloadingPointsListItem.invoiceNo,
                                                                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                  fontFamily: 'arial',
                                                                                                                                  letterSpacing: 0.0,
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
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 0.0, 25.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.postTripDeviceResult =
                                          await NewSpeedotrackJSApiGroup
                                              .postTripDeviceCall
                                              .call(
                                        device: _model.textController1.text,
                                        imei: _model.dropDownValue1,
                                        buyer: _model.textController2.text,
                                        seller: _model.textController3.text,
                                        transportNameAndNo:
                                            _model.textController7.text,
                                        vehicleNo: _model.textController4.text,
                                        lrNo: _model.textController9.text,
                                        doNo: _model.textController10.text,
                                        licenceNo: _model.textController8.text,
                                        jwt: FFAppState().userJwt,
                                        loadingPoint: _model.dropDownValue2,
                                        cargo: _model.textController11.text,
                                        weight: int.tryParse(
                                            _model.textController12.text),
                                        distance: int.tryParse(
                                            _model.textController13.text),
                                        estimatedTime:
                                            _model.textController14.text,
                                        unloadingPointsJson: _model
                                            .unloadingPoints
                                            .map((e) => e.toMap())
                                            .toList(),
                                        driverName: _model.textController5.text,
                                        driverMobileNo:
                                            _model.textController6.text,
                                        customersList: _model.dropDownValue3,
                                      );

                                      if ((_model.postTripDeviceResult
                                              ?.succeeded ??
                                          true)) {
                                        context.pushNamed(
                                            TripInfoListWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.postTripDeviceResult
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'h9zsvyvn' /* Create Trip Information */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 46.12,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'arial',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
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
            ],
          ),
        ),
      ),
    );
  }
}
