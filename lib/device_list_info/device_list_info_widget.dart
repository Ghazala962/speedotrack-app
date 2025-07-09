import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'device_list_info_model.dart';
export 'device_list_info_model.dart';

class DeviceListInfoWidget extends StatefulWidget {
  const DeviceListInfoWidget({super.key});

  static String routeName = 'DeviceListInfo';
  static String routePath = '/deviceListInfo';

  @override
  State<DeviceListInfoWidget> createState() => _DeviceListInfoWidgetState();
}

class _DeviceListInfoWidgetState extends State<DeviceListInfoWidget> {
  late DeviceListInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeviceListInfoModel());

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
          title: Text(
            FFLocalizations.of(context).getText(
              'r0mxcqrh' /* Trip Information List */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'arial',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 15.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(CreateDeviceListWidget.routeName);
                },
                child: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 20.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final test = FFAppState().allDeviceData.toList();

                      return FlutterFlowDataTable<dynamic>(
                        controller: _model.paginatedDataTableController,
                        data: test,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'i12mtuwu' /* Edit Header 1 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'q72zp75d' /* Edit Header 2 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'h0pr2u16' /* Edit Header 3 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'arial',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder:
                            (testItem, testIndex, selected, onSelectChanged) =>
                                DataRow(
                          color: WidgetStateProperty.all(
                            testIndex % 2 == 0
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                          ),
                          cells: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'cs5o7756' /* Edit Column 1 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '8z95qpcm' /* Edit Column 2 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'xmhrk4bb' /* Edit Column 3 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'arial',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        paginated: true,
                        selectable: false,
                        hidePaginator: false,
                        showFirstLastButtons: false,
                        headingRowHeight: 42.0,
                        dataRowHeight: 40.0,
                        columnSpacing: 20.0,
                        headingRowColor: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(5.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        horizontalDividerThickness: 1.0,
                        addVerticalDivider: false,
                      );
                    },
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
