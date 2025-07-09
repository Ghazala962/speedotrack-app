// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LatLngStructStruct extends BaseStruct {
  LatLngStructStruct({
    List<LatLng>? latitude,
    List<LatLng>? longitude,
  })  : _latitude = latitude,
        _longitude = longitude;

  // "latitude" field.
  List<LatLng>? _latitude;
  List<LatLng> get latitude => _latitude ?? const [];
  set latitude(List<LatLng>? val) => _latitude = val;

  void updateLatitude(Function(List<LatLng>) updateFn) {
    updateFn(_latitude ??= []);
  }

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  List<LatLng>? _longitude;
  List<LatLng> get longitude => _longitude ?? const [];
  set longitude(List<LatLng>? val) => _longitude = val;

  void updateLongitude(Function(List<LatLng>) updateFn) {
    updateFn(_longitude ??= []);
  }

  bool hasLongitude() => _longitude != null;

  static LatLngStructStruct fromMap(Map<String, dynamic> data) =>
      LatLngStructStruct(
        latitude: getDataList(data['latitude']),
        longitude: getDataList(data['longitude']),
      );

  static LatLngStructStruct? maybeFromMap(dynamic data) => data is Map
      ? LatLngStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'latitude': serializeParam(
          _latitude,
          ParamType.LatLng,
          isList: true,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.LatLng,
          isList: true,
        ),
      }.withoutNulls;

  static LatLngStructStruct fromSerializableMap(Map<String, dynamic> data) =>
      LatLngStructStruct(
        latitude: deserializeParam<LatLng>(
          data['latitude'],
          ParamType.LatLng,
          true,
        ),
        longitude: deserializeParam<LatLng>(
          data['longitude'],
          ParamType.LatLng,
          true,
        ),
      );

  @override
  String toString() => 'LatLngStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LatLngStructStruct &&
        listEquality.equals(latitude, other.latitude) &&
        listEquality.equals(longitude, other.longitude);
  }

  @override
  int get hashCode => const ListEquality().hash([latitude, longitude]);
}

LatLngStructStruct createLatLngStructStruct() => LatLngStructStruct();
