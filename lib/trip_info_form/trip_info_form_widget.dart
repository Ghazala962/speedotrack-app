import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'trip_info_form_model.dart';
export 'trip_info_form_model.dart';

class TripInfoFormWidget extends StatefulWidget {
  const TripInfoFormWidget({
    super.key,
    this.selectedDeviceData,
  });

  final dynamic selectedDeviceData;

  static String routeName = 'TripInfoForm';
  static String routePath = '/tripInfoForm';

  @override
  State<TripInfoFormWidget> createState() => _TripInfoFormWidgetState();
}

class _TripInfoFormWidgetState extends State<TripInfoFormWidget> {
  late TripInfoFormModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TripInfoFormModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startDate = functions.returnCurrentDate();
      _model.endDate = functions.getTommorowDate();
      safeSetState(() {});
    });

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              size: 20.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'me4hw74v' /* Trip Info */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'arial',
                    color: FlutterFlowTheme.of(context).secondary,
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0m4ca9g8' /* Filter-- */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'arial',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(
                        _model.dropDownValue1 ??= 'TODAY',
                      ),
                      options: List<String>.from([
                        'TODAY',
                        'YESTERDAY',
                        'THIS-WEEK',
                        'LAST-WEEK',
                        'THIS-MONTH',
                        'LAST-MONTH'
                      ]),
                      optionLabels: [
                        FFLocalizations.of(context).getText(
                          '682fvk88' /* Today */,
                        ),
                        FFLocalizations.of(context).getText(
                          'g1it7zqh' /* Yesterday */,
                        ),
                        FFLocalizations.of(context).getText(
                          '9mp879b6' /* This Week */,
                        ),
                        FFLocalizations.of(context).getText(
                          'e2n5wrs2' /* Last Week */,
                        ),
                        FFLocalizations.of(context).getText(
                          '2qmedazp' /* This Month */,
                        ),
                        FFLocalizations.of(context).getText(
                          '0e2gcgbi' /* Last Month */,
                        )
                      ],
                      onChanged: (val) async {
                        safeSetState(() => _model.dropDownValue1 = val);
                        if (_model.dropDownValue1 == 'TODAY') {
                          _model.startDate = functions.returnYesterdayDate();
                          _model.endDate = functions.getCurrentDate();
                          safeSetState(() {});
                        } else if (_model.dropDownValue1 == 'YESTERDAY') {
                          _model.startDate = functions.returnTwoDaysBefore();
                          _model.endDate = functions.returnYesterdayDate();
                          safeSetState(() {});
                        } else if (_model.dropDownValue1 == 'THIS-WEEK') {
                          _model.startDate = functions.returnThisWeek();
                          _model.endDate = functions.returnCurrentDate();
                          safeSetState(() {});
                        } else if (_model.dropDownValue1 == 'LAST-WEEK') {
                          _model.startDate = functions.returnLastWeek();
                          _model.endDate = functions.returnThisWeek();
                          safeSetState(() {});
                        } else if (_model.dropDownValue1 == 'THIS-MONTH') {
                          _model.startDate = functions.returnThisMonth();
                          _model.endDate = functions.returnCurrentDate();
                          safeSetState(() {});
                        } else {
                          _model.startDate = functions.returnLastMonth();
                          _model.endDate = functions.returnThisMonth();
                          safeSetState(() {});
                        }
                      },
                      width: double.infinity,
                      height: 45.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'arial',
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                      hintText: FFLocalizations.of(context).getText(
                        'ci4duopz' /* Please select... */,
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: Colors.transparent,
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '4ylfdby5' /* Stops -- */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(
                          _model.dropDownValue2 ??= '30',
                        ),
                        options: List<String>.from(
                            ['1', '2', '5', '10', '20', '30', '60', '300']),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            'qmgr8txf' /* > 1 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            '9siihfuj' /* > 2 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            'uz9egi41' /* > 5 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            '3ntnoz0s' /* > 10 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            't4iqicew' /* > 20 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            'a0zy4zfi' /* > 30 min */,
                          ),
                          FFLocalizations.of(context).getText(
                            '8tk9rrm7' /* > 1 hr */,
                          ),
                          FFLocalizations.of(context).getText(
                            'vr2hj43v' /* > 5 hr */,
                          )
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue2 = val),
                        width: double.infinity,
                        height: 52.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'arial',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          '0643st3y' /* Please select... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.startDate,
                                'Start Date',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final _datePicked1Date = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: DateTime(1900),
                            lastDate: (getCurrentTimestamp ?? DateTime(2050)),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePicked1Date != null) {
                            safeSetState(() {
                              _model.datePicked1 = DateTime(
                                _datePicked1Date.year,
                                _datePicked1Date.month,
                                _datePicked1Date.day,
                              );
                            });
                          } else if (_model.datePicked1 != null) {
                            safeSetState(() {
                              _model.datePicked1 = getCurrentTimestamp;
                            });
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          '2k3miia1' /* Select Start Date */,
                        ),
                        icon: Icon(
                          FFIcons.kk2kEbT01,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'arial',
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                _model.endDate,
                                'End Date',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final _datePicked2Date = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: DateTime(1900),
                            lastDate: (getCurrentTimestamp ?? DateTime(2050)),
                            builder: (context, child) {
                              return wrapInMaterialDatePickerTheme(
                                context,
                                child!,
                                headerBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                headerForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                headerTextStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'arial',
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                pickerBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                pickerForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                selectedDateTimeBackgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                selectedDateTimeForegroundColor:
                                    FlutterFlowTheme.of(context).info,
                                actionButtonForegroundColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 24.0,
                              );
                            },
                          );

                          if (_datePicked2Date != null) {
                            safeSetState(() {
                              _model.datePicked2 = DateTime(
                                _datePicked2Date.year,
                                _datePicked2Date.month,
                                _datePicked2Date.day,
                              );
                            });
                          } else if (_model.datePicked2 != null) {
                            safeSetState(() {
                              _model.datePicked2 = getCurrentTimestamp;
                            });
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'jbed0446' /* Select End Date */,
                        ),
                        icon: Icon(
                          FFIcons.kk2kEbT01,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 45.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'arial',
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.tripInfoRes =
                        await PhpApiGroupGroup.deviceTripInfoCall.call(
                      apiKey: FFAppState().userJwt,
                      deviceImei: getJsonField(
                        widget.selectedDeviceData,
                        r'''$.imei''',
                      ).toString(),
                      startDate: _model.startDate,
                      endDate: _model.endDate,
                      stops: _model.dropDownValue2,
                    );

                    if ((_model.tripInfoRes?.succeeded ?? true)) {
                      context.pushNamed(
                        TripInfoWidget.routeName,
                        queryParameters: {
                          'tripData': serializeParam(
                            (_model.tripInfoRes?.jsonBody ?? ''),
                            ParamType.JSON,
                          ),
                          'selectedDeviceImei': serializeParam(
                            getJsonField(
                              widget.selectedDeviceData,
                              r'''$.imei''',
                            ).toString(),
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            getJsonField(
                              (_model.tripInfoRes?.jsonBody ?? ''),
                              r'''$.message''',
                            ).toString(),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }

                    safeSetState(() {});
                  },
                  text: FFLocalizations.of(context).getText(
                    '277rrag7' /* View Trip Info */,
                  ),
                  options: FFButtonOptions(
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'arial',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
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
