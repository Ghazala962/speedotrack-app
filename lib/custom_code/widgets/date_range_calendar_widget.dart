// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeCalendarWidget extends StatefulWidget {
  final double? width;
  final double? height;

  const DateRangeCalendarWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<DateRangeCalendarWidget> createState() =>
      _DateRangeCalendarWidgetState();
}

class _DateRangeCalendarWidgetState extends State<DateRangeCalendarWidget> {
  DateTime? _startDate;
  DateTime? _endDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    final PickerDateRange range = args.value;
    setState(() {
      _startDate = range.startDate;
      _endDate = range.endDate;
    });
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "Select Date";
    return "${_getWeekday(date)}, ${date.day.toString().padLeft(2, '0')} ${_getMonth(date.month)}";
  }

  String _getWeekday(DateTime date) {
    return ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][date.weekday - 1];
  }

  String _getMonth(int month) {
    return [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ][month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // From - To Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDateHeader("From", _startDate),
              _buildDateHeader("To", _endDate),
            ],
          ),
          const SizedBox(height: 8),
          // Calendar
          SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: _onSelectionChanged,
            startRangeSelectionColor: Colors.deepPurple,
            endRangeSelectionColor: Colors.deepPurple,
            rangeSelectionColor: Colors.deepPurple.shade100,
            headerStyle: const DateRangePickerHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            monthViewSettings: const DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              viewHeaderStyle: DateRangePickerViewHeaderStyle(
                textStyle: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton("Cancel", Colors.grey, () {
                setState(() {
                  _startDate = null;
                  _endDate = null;
                });
              }),
              _buildActionButton("Apply", Colors.deepPurple, () {
                if (_startDate != null && _endDate != null) {
                  print("Date Range: $_startDate to $_endDate");
                  // TODO: Call a callback or send to state if needed
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String label, DateTime? date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          _formatDate(date),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      ),
      child: Text(text),
    );
  }
}
