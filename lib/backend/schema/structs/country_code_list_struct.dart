// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountryCodeListStruct extends BaseStruct {
  CountryCodeListStruct({
    String? countryName,
    String? countryCode,
  })  : _countryName = countryName,
        _countryCode = countryCode;

  // "countryName" field.
  String? _countryName;
  String get countryName => _countryName ?? '';
  set countryName(String? val) => _countryName = val;

  bool hasCountryName() => _countryName != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;

  bool hasCountryCode() => _countryCode != null;

  static CountryCodeListStruct fromMap(Map<String, dynamic> data) =>
      CountryCodeListStruct(
        countryName: data['countryName'] as String?,
        countryCode: data['countryCode'] as String?,
      );

  static CountryCodeListStruct? maybeFromMap(dynamic data) => data is Map
      ? CountryCodeListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'countryName': _countryName,
        'countryCode': _countryCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'countryName': serializeParam(
          _countryName,
          ParamType.String,
        ),
        'countryCode': serializeParam(
          _countryCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static CountryCodeListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CountryCodeListStruct(
        countryName: deserializeParam(
          data['countryName'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['countryCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CountryCodeListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CountryCodeListStruct &&
        countryName == other.countryName &&
        countryCode == other.countryCode;
  }

  @override
  int get hashCode => const ListEquality().hash([countryName, countryCode]);
}

CountryCodeListStruct createCountryCodeListStruct({
  String? countryName,
  String? countryCode,
}) =>
    CountryCodeListStruct(
      countryName: countryName,
      countryCode: countryCode,
    );
