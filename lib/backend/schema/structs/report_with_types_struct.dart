// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportWithTypesStruct extends BaseStruct {
  ReportWithTypesStruct({
    String? reportLabel,
    String? reportVal,
  })  : _reportLabel = reportLabel,
        _reportVal = reportVal;

  // "reportLabel" field.
  String? _reportLabel;
  String get reportLabel => _reportLabel ?? '';
  set reportLabel(String? val) => _reportLabel = val;

  bool hasReportLabel() => _reportLabel != null;

  // "reportVal" field.
  String? _reportVal;
  String get reportVal => _reportVal ?? '';
  set reportVal(String? val) => _reportVal = val;

  bool hasReportVal() => _reportVal != null;

  static ReportWithTypesStruct fromMap(Map<String, dynamic> data) =>
      ReportWithTypesStruct(
        reportLabel: data['reportLabel'] as String?,
        reportVal: data['reportVal'] as String?,
      );

  static ReportWithTypesStruct? maybeFromMap(dynamic data) => data is Map
      ? ReportWithTypesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'reportLabel': _reportLabel,
        'reportVal': _reportVal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reportLabel': serializeParam(
          _reportLabel,
          ParamType.String,
        ),
        'reportVal': serializeParam(
          _reportVal,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReportWithTypesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportWithTypesStruct(
        reportLabel: deserializeParam(
          data['reportLabel'],
          ParamType.String,
          false,
        ),
        reportVal: deserializeParam(
          data['reportVal'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReportWithTypesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportWithTypesStruct &&
        reportLabel == other.reportLabel &&
        reportVal == other.reportVal;
  }

  @override
  int get hashCode => const ListEquality().hash([reportLabel, reportVal]);
}

ReportWithTypesStruct createReportWithTypesStruct({
  String? reportLabel,
  String? reportVal,
}) =>
    ReportWithTypesStruct(
      reportLabel: reportLabel,
      reportVal: reportVal,
    );
