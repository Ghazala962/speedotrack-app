import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'calendar_model.dart';
export 'calendar_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    super.key,
    this.setStartDate,
    this.setEndDate,
  });

  final Future Function(String startDate)? setStartDate;
  final Future Function(String endDate)? setEndDate;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarModel());

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
      child: Container(
        width: 350.0,
        height: 550.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.AdvancedDateTimeRangePicker(
            width: double.infinity,
            height: double.infinity,
            setStartDate: (startDate) async {
              await widget.setStartDate?.call(
                startDate,
              );
            },
            setEndDate: (endDate) async {
              await widget.setEndDate?.call(
                endDate,
              );
            },
          ),
        ),
      ),
    );
  }
}
