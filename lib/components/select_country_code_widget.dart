import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'select_country_code_model.dart';
export 'select_country_code_model.dart';

class SelectCountryCodeWidget extends StatefulWidget {
  const SelectCountryCodeWidget({
    super.key,
    required this.setCountryCode,
    this.countryCode,
    this.country,
    required this.setCountry,
  });

  final Future Function(String code)? setCountryCode;
  final String? countryCode;
  final String? country;
  final Future Function(String country)? setCountry;

  @override
  State<SelectCountryCodeWidget> createState() =>
      _SelectCountryCodeWidgetState();
}

class _SelectCountryCodeWidgetState extends State<SelectCountryCodeWidget> {
  late SelectCountryCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCountryCodeModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
              child: Material(
                color: Colors.transparent,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Container(
                  width: 412.0,
                  height: 695.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            22.0, 25.0, 22.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'c66f81uk' /* Select Country Code */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'arial',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 20.0,
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
                              child: Image.asset(
                                'assets/images/Group_1000006570.png',
                                width: 16.0,
                                height: 14.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            28.0, 18.0, 28.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                width: 323.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .searchTextfieldColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .searchTextfieldColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/Group.png',
                                            width: 14.4,
                                            height: 14.46,
                                            fit: BoxFit.cover,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'hh6m8jlq' /* Search Country */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textfieldColor,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .searchTextfieldColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .searchTextfieldColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .searchTextfieldColor,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'arial',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textfieldColor,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                ),
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
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
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Builder(
                            builder: (context) {
                              final codeList =
                                  FFAppState().countryCodeList.toList();

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: codeList.length,
                                itemBuilder: (context, codeListIndex) {
                                  final codeListItem = codeList[codeListIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        22.0, 8.0, 22.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.setCountryCode?.call(
                                          valueOrDefault<String>(
                                            codeListItem.countryCode,
                                            '+91',
                                          ),
                                        );
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              if (codeListItem.countryCode ==
                                                  '+91') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/india-1617463_1280_1.png',
                                                    width: 33.0,
                                                    height: 32.3,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+60') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Malaysia.svg_(1).png',
                                                    width: 33.0,
                                                    height: 32.3,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+880') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Bangladesh.svg.png',
                                                    width: 33.0,
                                                    height: 32.3,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+92') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Pakistan.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+977') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Nepal.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+66') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/images_(1).png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+98') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Iran.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+966') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Saudi_Arabia.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+86') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_China.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+62') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Indonesia.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+1') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Puerto_Rico.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+254') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Kenya.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+94') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Sri_Lanka.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+212') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_Morocco.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else if (codeListItem
                                                      .countryCode ==
                                                  '+27') {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Flag_of_South_Africa.svg.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              } else {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/india-1617463_1280_1.png',
                                                    width: 33.0,
                                                    height: 33.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                codeListItem.countryName,
                                                'India',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'arial',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    codeListItem.countryCode,
                                                    '+91',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'arial',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
            ),
          ),
        ),
      ],
    );
  }
}
