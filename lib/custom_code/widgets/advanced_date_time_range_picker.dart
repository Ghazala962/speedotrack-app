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

import 'package:intl/intl.dart';
import 'dart:async';

/// FlutterFlow Custom Widget: AdvancedDateTimeRangePicker
class AdvancedDateTimeRangePicker extends StatefulWidget {
  const AdvancedDateTimeRangePicker({
    super.key,
    this.width,
    this.height,
    required this.setStartDate,
    required this.setEndDate,
  });

  final double? width;
  final double? height;
  final Future Function(String startDate) setStartDate;
  final Future Function(String endDate) setEndDate;

  @override
  State<AdvancedDateTimeRangePicker> createState() =>
      _AdvancedDateTimeRangePickerState();
}

class _AdvancedDateTimeRangePickerState
    extends State<AdvancedDateTimeRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay _startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 23, minute: 59);
  String? _selectedPreset;
  DateTime _currentViewDate = DateTime.now();

  // Preset options
  final List<Map<String, dynamic>> _presetOptions = [
    {'label': 'Today', 'days': 0},
    {'label': 'Yesterday', 'days': 1},
    {'label': 'This Week', 'days': 7},
    {'label': 'Last Week', 'days': 14},
    {'label': 'This Month', 'days': 30},
    {'label': 'Last Month', 'days': 60},
    {'label': 'Custom Range', 'days': null},
  ];

  // Color constants
  static const Color _primaryGray = Color(0xFF4A5568);
  static const Color _selectedGray = Color(0xFF2D3748);
  static const Color _lightGray = Color(0xFFF7FAFC);
  static const Color _borderGray = Color(0xFFE2E8F0);
  static const Color _textGray = Color(0xFF718096);
  static const Color _mutedTextGray = Color(0xFFA0AEC0);

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now().add(Duration(days: 1));
    // Initialize with Today preset if no initial dates provided
    if (_startDate == null && _endDate == null) {
      _applyPreset('Today', 0);
    }
  }

  void _onDateSelected(DateTime selectedDate) {
    setState(() {
      if (_startDate == null || (_startDate != null && _endDate != null)) {
        // Start new selection
        _startDate = selectedDate;
        _endDate = null;
        _selectedPreset = 'Custom Range';
      } else {
        // Complete selection
        if (selectedDate.isBefore(_startDate!)) {
          _endDate = _startDate;
          _startDate = selectedDate;
        } else {
          _endDate = selectedDate;
        }
        _selectedPreset = 'Custom Range';
      }

      // Navigate calendar to show the selected date when manually selecting
      if (_startDate != null) {
        _navigateToDateRange(_startDate!, _endDate ?? _startDate!);
      }
    });
  }

  Future<void> _pickTime(bool isStart) async {
    final initialTime = isStart ? _startTime : _endTime;

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: TimePickerThemeData(
                backgroundColor: Colors.white,
                hourMinuteTextColor: _primaryGray,
                hourMinuteColor: _lightGray,
                dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
                  return states.contains(MaterialState.selected)
                      ? Colors.white
                      : Colors.black;
                }),
                dayPeriodColor: MaterialStateColor.resolveWith((states) {
                  return states.contains(MaterialState.selected)
                      ? Colors.black
                      : Colors.white;
                }),
                dayPeriodBorderSide:
                    const BorderSide(color: Colors.grey, width: 1),
                dialHandColor: Colors.black,
                dialBackgroundColor: const Color(0xFF2C2C2C),
                dialTextColor: Colors.white,
                entryModeIconColor: _primaryGray,
                hourMinuteTextStyle: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: _primaryGray,
                ),
                dayPeriodTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              colorScheme: ColorScheme.light(
                primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: _primaryGray,
                secondary: Colors.white,
                onSecondary: Colors.black,
              ),
            ),
            child: Transform.scale(
              scale: 1.0, // Increased scale from 0.6 to 1.0
              child: Container(
                width: 300, // Increased width from 180 to 300
                height: 300, // Increased height from 180 to 300
                child: child!,
              ),
            ),
          ),
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  void _changeMonth(int direction) {
    setState(() {
      _currentViewDate = DateTime(
        _currentViewDate.year,
        _currentViewDate.month + direction,
        1,
      );
    });
  }

  void _applyPreset(String preset, int days) {
    final now = DateTime.now();
    late DateTime start;
    late DateTime end;

    switch (preset) {
      case 'Today':
        start = DateTime(now.year, now.month, now.day);
        end = DateTime(now.year, now.month, now.day);
        break;
      case 'Yesterday':
        start = DateTime(now.year, now.month, now.day - 1);
        end = DateTime(now.year, now.month, now.day - 1);
        break;
      case 'This Week':
        final weekday = now.weekday;
        start = DateTime(now.year, now.month, now.day - weekday + 1);
        end = DateTime(now.year, now.month, now.day);
        break;
      case 'Last Week':
        final weekday = now.weekday;
        start = DateTime(now.year, now.month, now.day - weekday - 6);
        end = DateTime(now.year, now.month, now.day - weekday);
        break;
      case 'This Month':
        start = DateTime(now.year, now.month, 1);
        end = DateTime(now.year, now.month, now.day);
        break;
      case 'Last Month':
        start = DateTime(now.year, now.month - 1, 1);
        end = DateTime(now.year, now.month, 0);
        break;
      default:
        start = DateTime(now.year, now.month, now.day - days + 1);
        end = DateTime(now.year, now.month, now.day);
    }

    setState(() {
      _startDate = start;
      _endDate = end;
      _selectedPreset = preset;

      // Navigate calendar to show the selected date range
      _navigateToDateRange(start, end);
    });
  }

  void _navigateToDateRange(DateTime start, DateTime end) {
    // Navigate to the month that contains the start date
    // This ensures the calendar shows the selected range
    _currentViewDate = DateTime(start.year, start.month, 1);
  }

  DateTime _combineDateTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  String _formatTime24Hour(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  String get _formattedRange {
    if (_startDate == null || _endDate == null) return "No date selected";

    final dateFormatter = DateFormat('dd/MM/yy');

    final startStr = dateFormatter.format(_startDate!);
    final endStr = dateFormatter.format(_endDate!);
    final startTimeStr = _formatTime24Hour(_startTime);
    final endTimeStr = _formatTime24Hour(_endTime);

    return "$startStr $startTimeStr - $endStr $endTimeStr";
  }

  Widget _buildCustomCalendar() {
    return Column(
      children: [
        // Calendar header - Single month navigation
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: Icon(Icons.chevron_left, color: _textGray, size: 16),
                padding: EdgeInsets.all(2),
                constraints: BoxConstraints(minWidth: 24, minHeight: 24),
              ),
              Text(
                DateFormat('MMM yyyy').format(_currentViewDate),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _textGray,
                ),
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: Icon(Icons.chevron_right, color: _textGray, size: 16),
                padding: EdgeInsets.all(2),
                constraints: BoxConstraints(minWidth: 24, minHeight: 24),
              ),
            ],
          ),
        ),
        // Single calendar grid
        Expanded(
          child: _buildMonthGrid(_currentViewDate),
        ),
      ],
    );
  }

  Widget _buildMonthGrid(DateTime monthDate) {
    final firstDay = DateTime(monthDate.year, monthDate.month, 1);
    final lastDay = DateTime(monthDate.year, monthDate.month + 1, 0);
    final startWeekday = firstDay.weekday;
    final daysInMonth = lastDay.day;

    return Column(
      children: [
        // Weekday headers
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
                .map((day) => Expanded(
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            fontSize: 9,
                            color: _mutedTextGray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 2),
        // Calendar days
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),
            itemCount: 42, // 6 weeks * 7 days
            itemBuilder: (context, index) {
              final dayNumber = index - (startWeekday % 7) + 1;
              if (dayNumber < 1 || dayNumber > daysInMonth) {
                return const SizedBox();
              }

              final date = DateTime(monthDate.year, monthDate.month, dayNumber);
              final isSelected = _isDateSelected(date);
              final isInRange = _isDateInRange(date);
              final isToday = _isToday(date);
              final isStartDate =
                  _startDate != null && _isSameDay(date, _startDate!);
              final isEndDate = _endDate != null && _isSameDay(date, _endDate!);

              return GestureDetector(
                onTap: () => _onDateSelected(date),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _selectedGray
                        : isInRange
                            ? _lightGray
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                    border: isToday
                        ? Border.all(color: _primaryGray, width: 1)
                        : null,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayNumber.toString(),
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected
                                ? Colors.white
                                : isInRange
                                    ? _primaryGray
                                    : _textGray,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                        // Add small indicators for start and end dates
                        if (isStartDate || isEndDate)
                          Container(
                            width: 2,
                            height: 2,
                            margin: const EdgeInsets.only(top: 1),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.white : _selectedGray,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _isDateSelected(DateTime date) {
    return (_startDate != null && _isSameDay(date, _startDate!)) ||
        (_endDate != null && _isSameDay(date, _endDate!));
  }

  bool _isDateInRange(DateTime date) {
    if (_startDate == null || _endDate == null) return false;
    return date.isAfter(_startDate!) && date.isBefore(_endDate!);
  }

  bool _isToday(DateTime date) {
    final today = DateTime.now();
    return _isSameDay(date, today);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void _applySelection() {
    if (_startDate != null && _endDate != null) {
      final startDateTime = _combineDateTime(_startDate!, _startTime);
      final endDateTime = _combineDateTime(_endDate!, _endTime);

      widget.setStartDate(startDateTime.toString());
      widget.setEndDate(endDateTime.toString());

      // Close the widget
      Navigator.of(context).pop();
    }
  }

  void _cancelSelection() {
    // Close the widget without applying changes
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 350,
      height: widget.height ?? 550,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calendar section - now full width
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              child: _buildCustomCalendar(),
            ),
          ),
          // Bottom section with presets, time and buttons
          Container(
            padding: const EdgeInsets.all(16), // Increased padding
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: _borderGray)),
            ),
            child: Column(
              children: [
                // Preset options - now horizontal with bigger buttons
                Container(
                  height: 50, // Increased height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _presetOptions.map((preset) {
                        final isSelected = _selectedPreset == preset['label'];
                        return Container(
                          margin: const EdgeInsets.only(
                              right: 8), // Increased margin
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (preset['label'] == 'Custom Range') {
                                  setState(() {
                                    _selectedPreset = preset['label'];
                                    _startDate = null;
                                    _endDate = null;
                                  });
                                } else {
                                  _applyPreset(
                                      preset['label'], preset['days'] ?? 0);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12), // Increased padding
                                decoration: BoxDecoration(
                                  color:
                                      isSelected ? _selectedGray : _lightGray,
                                  borderRadius: BorderRadius.circular(
                                      6), // Increased border radius
                                  border: Border.all(color: _borderGray),
                                ),
                                child: Text(
                                  preset['label'],
                                  style: TextStyle(
                                    fontSize: 14, // Increased font size
                                    fontWeight: FontWeight.normal,
                                    color:
                                        isSelected ? Colors.white : _textGray,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Increased spacing
                // Time selection with centered aligned text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: _textGray,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: _borderGray),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: GestureDetector(
                        onTap: () => _pickTime(true),
                        child: Center(
                          child: Text(
                            _formatTime24Hour(_startTime),
                            style: TextStyle(
                              fontSize: 14,
                              color: _textGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "-",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _textGray,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 70,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: _borderGray),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: GestureDetector(
                        onTap: () => _pickTime(false),
                        child: Center(
                          child: Text(
                            _formatTime24Hour(_endTime),
                            style: TextStyle(
                              fontSize: 14,
                              color: _textGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Increased spacing
                // Date range display - centered text
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    _formattedRange,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: _textGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Increased spacing
                // Action buttons - Cancel and Apply
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Cancel button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _cancelSelection,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: _textGray,
                          side: BorderSide(color: _borderGray),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          minimumSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Apply button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _applySelection,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedGray,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          minimumSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
    );
  }
}
