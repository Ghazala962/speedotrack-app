// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnlodingPointsDataTypeStruct extends BaseStruct {
  UnlodingPointsDataTypeStruct({
    String? unloadingPoint,
    String? invoiceNo,
  })  : _unloadingPoint = unloadingPoint,
        _invoiceNo = invoiceNo;

  // "unloading_point" field.
  String? _unloadingPoint;
  String get unloadingPoint => _unloadingPoint ?? '';
  set unloadingPoint(String? val) => _unloadingPoint = val;

  bool hasUnloadingPoint() => _unloadingPoint != null;

  // "invoice_no" field.
  String? _invoiceNo;
  String get invoiceNo => _invoiceNo ?? '';
  set invoiceNo(String? val) => _invoiceNo = val;

  bool hasInvoiceNo() => _invoiceNo != null;

  static UnlodingPointsDataTypeStruct fromMap(Map<String, dynamic> data) =>
      UnlodingPointsDataTypeStruct(
        unloadingPoint: data['unloading_point'] as String?,
        invoiceNo: data['invoice_no'] as String?,
      );

  static UnlodingPointsDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? UnlodingPointsDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'unloading_point': _unloadingPoint,
        'invoice_no': _invoiceNo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'unloading_point': serializeParam(
          _unloadingPoint,
          ParamType.String,
        ),
        'invoice_no': serializeParam(
          _invoiceNo,
          ParamType.String,
        ),
      }.withoutNulls;

  static UnlodingPointsDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UnlodingPointsDataTypeStruct(
        unloadingPoint: deserializeParam(
          data['unloading_point'],
          ParamType.String,
          false,
        ),
        invoiceNo: deserializeParam(
          data['invoice_no'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UnlodingPointsDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UnlodingPointsDataTypeStruct &&
        unloadingPoint == other.unloadingPoint &&
        invoiceNo == other.invoiceNo;
  }

  @override
  int get hashCode => const ListEquality().hash([unloadingPoint, invoiceNo]);
}

UnlodingPointsDataTypeStruct createUnlodingPointsDataTypeStruct({
  String? unloadingPoint,
  String? invoiceNo,
}) =>
    UnlodingPointsDataTypeStruct(
      unloadingPoint: unloadingPoint,
      invoiceNo: invoiceNo,
    );
