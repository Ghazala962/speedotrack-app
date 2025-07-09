import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'details14_destination_model.dart';
export 'details14_destination_model.dart';

class Details14DestinationWidget extends StatefulWidget {
  const Details14DestinationWidget({super.key});

  static String routeName = 'Details14Destination';
  static String routePath = '/details14Destination';

  @override
  State<Details14DestinationWidget> createState() =>
      _Details14DestinationWidgetState();
}

class _Details14DestinationWidgetState
    extends State<Details14DestinationWidget> {
  late Details14DestinationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Details14DestinationModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
