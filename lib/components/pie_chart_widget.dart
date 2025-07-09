import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pie_chart_model.dart';
export 'pie_chart_model.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({
    super.key,
    this.parameter1,
  });

  final dynamic parameter1;

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  late PieChartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PieChartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList = [
      Color(0xFF8F47E9),
      Color(0xFF7029CC),
      Color(0xFF2636A5),
      Color(0xFF4A57C2)
    ];
    return Container(
      width: 200.0,
      height: 200.0,
      child: FlutterFlowPieChart(
        data: FFPieChartData(
          values: widget.parameter1!,
          colors: chartPieChartColorsList,
          radius: [60.0],
          borderColor: [Color(0x00000000)],
        ),
        donutHoleRadius: 50.0,
        donutHoleColor: Colors.transparent,
        sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
              fontFamily: 'arial',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
