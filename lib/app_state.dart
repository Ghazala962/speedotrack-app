import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userJwt = prefs.getString('ff_userJwt') ?? _userJwt;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_oneDayEventData')) {
        try {
          _oneDayEventData =
              jsonDecode(prefs.getString('ff_oneDayEventData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _selectedMapType = prefs.containsKey('ff_selectedMapType')
          ? deserializeEnum<Types>(prefs.getString('ff_selectedMapType'))
          : _selectedMapType;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userProfileData')) {
        try {
          _userProfileData =
              jsonDecode(prefs.getString('ff_userProfileData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
    _safeInit(() {
      _showRouteOnTracking =
          prefs.getBool('ff_showRouteOnTracking') ?? _showRouteOnTracking;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userLoginDetails')) {
        try {
          _userLoginDetails =
              jsonDecode(prefs.getString('ff_userLoginDetails') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _excelData = prefs.getStringList('ff_excelData')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _excelData;
    });
    _safeInit(() {
      _isTripUserLoggedIn =
          prefs.getBool('ff_isTripUserLoggedIn') ?? _isTripUserLoggedIn;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_DeviceList')) {
        try {
          _DeviceList = jsonDecode(prefs.getString('ff_DeviceList') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_markerList')) {
        try {
          _markerList = jsonDecode(prefs.getString('ff_markerList') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ListViewData')) {
        try {
          _ListViewData = jsonDecode(prefs.getString('ff_ListViewData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_monitorScreenEagleEyeData')) {
        try {
          _monitorScreenEagleEyeData =
              jsonDecode(prefs.getString('ff_monitorScreenEagleEyeData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _ChangeAccountJWT =
          prefs.getString('ff_ChangeAccountJWT') ?? _ChangeAccountJWT;
    });
    _safeInit(() {
      _SelectedColumItems =
          prefs.getStringList('ff_SelectedColumItems') ?? _SelectedColumItems;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userSelfData')) {
        try {
          _userSelfData = jsonDecode(prefs.getString('ff_userSelfData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_vehicleModel')) {
        try {
          _vehicleModel = jsonDecode(prefs.getString('ff_vehicleModel') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _themeMode = prefs.getBool('ff_themeMode') ?? _themeMode;
    });
    _safeInit(() {
      _createGeofenceVertices = prefs
              .getStringList('ff_createGeofenceVertices')
              ?.map(latLngFromString)
              .withoutNulls ??
          _createGeofenceVertices;
    });
    _safeInit(() {
      _userLocation =
          latLngFromString(prefs.getString('ff_userLocation')) ?? _userLocation;
    });
    _safeInit(() {
      _geofencePolygonColor =
          _colorFromIntValue(prefs.getInt('ff_geofencePolygonColor')) ??
              _geofencePolygonColor;
    });
    _safeInit(() {
      _geofenceCircleColor =
          _colorFromIntValue(prefs.getInt('ff_geofenceCircleColor')) ??
              _geofenceCircleColor;
    });
    _safeInit(() {
      _geofenceMainColor =
          _colorFromIntValue(prefs.getInt('ff_geofenceMainColor')) ??
              _geofenceMainColor;
    });
    _safeInit(() {
      _markerIcon = prefs.getString('ff_markerIcon') ?? _markerIcon;
    });
    _safeInit(() {
      _editMarkerIcon = prefs.getString('ff_editMarkerIcon') ?? _editMarkerIcon;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userJwt = '';
  String get userJwt => _userJwt;
  set userJwt(String value) {
    _userJwt = value;
    prefs.setString('ff_userJwt', value);
  }

  dynamic _allDeviceData;
  dynamic get allDeviceData => _allDeviceData;
  set allDeviceData(dynamic value) {
    _allDeviceData = value;
  }

  dynamic _oneDayEventData;
  dynamic get oneDayEventData => _oneDayEventData;
  set oneDayEventData(dynamic value) {
    _oneDayEventData = value;
    prefs.setString('ff_oneDayEventData', jsonEncode(value));
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  List<String> _reportTypes = [
    'general',
    'drives_stops',
    'drives_stops_sensors',
    'drives_stops_logic',
    'travel_sheet',
    'travel-sheet-dn',
    'mileage-daily',
    'overspeed',
    'underspeed',
    'zone_in_out',
    'events',
    'service',
    'fuelfillings',
    'fuelthefts',
    'logic_sensors',
    'single_generator',
    'multi_generator',
    'speed_graph',
    'altitude_graph',
    'acc_graph',
    'fuellevel_graph',
    'temperature_graph',
    'sensor_graph',
    'routes',
    'routes_stops',
    'image_gallery',
    'general_merged',
    'general_analysis',
    'object_info',
    'current_position',
    'current_position_off',
    'rag',
    'rag_driver',
    'tasks',
    'rilogbook',
    'dtc',
    'expenses'
  ];
  List<String> get reportTypes => _reportTypes;
  set reportTypes(List<String> value) {
    _reportTypes = value;
  }

  void addToReportTypes(String value) {
    reportTypes.add(value);
  }

  void removeFromReportTypes(String value) {
    reportTypes.remove(value);
  }

  void removeAtIndexFromReportTypes(int index) {
    reportTypes.removeAt(index);
  }

  void updateReportTypesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    reportTypes[index] = updateFn(_reportTypes[index]);
  }

  void insertAtIndexInReportTypes(int index, String value) {
    reportTypes.insert(index, value);
  }

  dynamic _singleDeviceLocationData;
  dynamic get singleDeviceLocationData => _singleDeviceLocationData;
  set singleDeviceLocationData(dynamic value) {
    _singleDeviceLocationData = value;
  }

  String _selectedDeviceForData = '';
  String get selectedDeviceForData => _selectedDeviceForData;
  set selectedDeviceForData(String value) {
    _selectedDeviceForData = value;
  }

  LatLng? _tapped = LatLng(35.1503787, 33.3410323);
  LatLng? get tapped => _tapped;
  set tapped(LatLng? value) {
    _tapped = value;
  }

  LatLng? _center = LatLng(23.3200688, 85.2953349);
  LatLng? get center => _center;
  set center(LatLng? value) {
    _center = value;
  }

  List<MarkersNumberStruct> _markers = [
    MarkersNumberStruct.fromSerializableMap(jsonDecode(
        '{\"coordinates\":\"37.955654,23.698765\",\"value\":\"100\"}')),
    MarkersNumberStruct.fromSerializableMap(jsonDecode(
        '{\"coordinates\":\"37.98381,23.727539\",\"value\":\"20\"}')),
    MarkersNumberStruct.fromSerializableMap(
        jsonDecode('{\"coordinates\":\"38.05,23.83333\",\"value\":\"2.5\"}'))
  ];
  List<MarkersNumberStruct> get markers => _markers;
  set markers(List<MarkersNumberStruct> value) {
    _markers = value;
  }

  void addToMarkers(MarkersNumberStruct value) {
    markers.add(value);
  }

  void removeFromMarkers(MarkersNumberStruct value) {
    markers.remove(value);
  }

  void removeAtIndexFromMarkers(int index) {
    markers.removeAt(index);
  }

  void updateMarkersAtIndex(
    int index,
    MarkersNumberStruct Function(MarkersNumberStruct) updateFn,
  ) {
    markers[index] = updateFn(_markers[index]);
  }

  void insertAtIndexInMarkers(int index, MarkersNumberStruct value) {
    markers.insert(index, value);
  }

  Types? _selectedMapType = Types.normal;
  Types? get selectedMapType => _selectedMapType;
  set selectedMapType(Types? value) {
    _selectedMapType = value;
    value != null
        ? prefs.setString('ff_selectedMapType', value.serialize())
        : prefs.remove('ff_selectedMapType');
  }

  String _carListFilterValue = 'All';
  String get carListFilterValue => _carListFilterValue;
  set carListFilterValue(String value) {
    _carListFilterValue = value;
  }

  String _startDate = '';
  String get startDate => _startDate;
  set startDate(String value) {
    _startDate = value;
  }

  String _endDate = '';
  String get endDate => _endDate;
  set endDate(String value) {
    _endDate = value;
  }

  dynamic _userProfileData;
  dynamic get userProfileData => _userProfileData;
  set userProfileData(dynamic value) {
    _userProfileData = value;
    prefs.setString('ff_userProfileData', jsonEncode(value));
  }

  String _deviceSearchValue = '';
  String get deviceSearchValue => _deviceSearchValue;
  set deviceSearchValue(String value) {
    _deviceSearchValue = value;
  }

  dynamic _valZero = jsonDecode('0');
  dynamic get valZero => _valZero;
  set valZero(dynamic value) {
    _valZero = value;
  }

  dynamic _doubleZero = jsonDecode('0');
  dynamic get doubleZero => _doubleZero;
  set doubleZero(dynamic value) {
    _doubleZero = value;
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  List<String> _barLabelNames = ['Bar1', 'Bar2', 'Bar3', 'Bar4'];
  List<String> get barLabelNames => _barLabelNames;
  set barLabelNames(List<String> value) {
    _barLabelNames = value;
  }

  void addToBarLabelNames(String value) {
    barLabelNames.add(value);
  }

  void removeFromBarLabelNames(String value) {
    barLabelNames.remove(value);
  }

  void removeAtIndexFromBarLabelNames(int index) {
    barLabelNames.removeAt(index);
  }

  void updateBarLabelNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    barLabelNames[index] = updateFn(_barLabelNames[index]);
  }

  void insertAtIndexInBarLabelNames(int index, String value) {
    barLabelNames.insert(index, value);
  }

  List<String> _barLabelValues = ['10', '20', '30', '40'];
  List<String> get barLabelValues => _barLabelValues;
  set barLabelValues(List<String> value) {
    _barLabelValues = value;
  }

  void addToBarLabelValues(String value) {
    barLabelValues.add(value);
  }

  void removeFromBarLabelValues(String value) {
    barLabelValues.remove(value);
  }

  void removeAtIndexFromBarLabelValues(int index) {
    barLabelValues.removeAt(index);
  }

  void updateBarLabelValuesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    barLabelValues[index] = updateFn(_barLabelValues[index]);
  }

  void insertAtIndexInBarLabelValues(int index, String value) {
    barLabelValues.insert(index, value);
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  dynamic _containsMoving = jsonDecode('{\"m\":\"Moving\"}');
  dynamic get containsMoving => _containsMoving;
  set containsMoving(dynamic value) {
    _containsMoving = value;
  }

  dynamic _containsStopped = jsonDecode('{\"s\":\"Stopped\"}');
  dynamic get containsStopped => _containsStopped;
  set containsStopped(dynamic value) {
    _containsStopped = value;
  }

  dynamic _containsIdle = jsonDecode('{\"i\":\"Engine idle\"}');
  dynamic get containsIdle => _containsIdle;
  set containsIdle(dynamic value) {
    _containsIdle = value;
  }

  dynamic _containsCnOff = jsonDecode('{\"cn\":0}');
  dynamic get containsCnOff => _containsCnOff;
  set containsCnOff(dynamic value) {
    _containsCnOff = value;
  }

  dynamic _containsIgnitionOn = jsonDecode('{\"i\":\"1\"}');
  dynamic get containsIgnitionOn => _containsIgnitionOn;
  set containsIgnitionOn(dynamic value) {
    _containsIgnitionOn = value;
  }

  bool _isLoadingVehicleData = false;
  bool get isLoadingVehicleData => _isLoadingVehicleData;
  set isLoadingVehicleData(bool value) {
    _isLoadingVehicleData = value;
  }

  bool _showRouteOnTracking = true;
  bool get showRouteOnTracking => _showRouteOnTracking;
  set showRouteOnTracking(bool value) {
    _showRouteOnTracking = value;
    prefs.setBool('ff_showRouteOnTracking', value);
  }

  List<dynamic> _expiringDevicesList = [];
  List<dynamic> get expiringDevicesList => _expiringDevicesList;
  set expiringDevicesList(List<dynamic> value) {
    _expiringDevicesList = value;
  }

  void addToExpiringDevicesList(dynamic value) {
    expiringDevicesList.add(value);
  }

  void removeFromExpiringDevicesList(dynamic value) {
    expiringDevicesList.remove(value);
  }

  void removeAtIndexFromExpiringDevicesList(int index) {
    expiringDevicesList.removeAt(index);
  }

  void updateExpiringDevicesListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    expiringDevicesList[index] = updateFn(_expiringDevicesList[index]);
  }

  void insertAtIndexInExpiringDevicesList(int index, dynamic value) {
    expiringDevicesList.insert(index, value);
  }

  dynamic _userLoginDetails;
  dynamic get userLoginDetails => _userLoginDetails;
  set userLoginDetails(dynamic value) {
    _userLoginDetails = value;
    prefs.setString('ff_userLoginDetails', jsonEncode(value));
  }

  dynamic _trackingData;
  dynamic get trackingData => _trackingData;
  set trackingData(dynamic value) {
    _trackingData = value;
  }

  int _colorChanges = 0;
  int get colorChanges => _colorChanges;
  set colorChanges(int value) {
    _colorChanges = value;
  }

  List<dynamic> _excelData = [];
  List<dynamic> get excelData => _excelData;
  set excelData(List<dynamic> value) {
    _excelData = value;
    prefs.setStringList(
        'ff_excelData', value.map((x) => jsonEncode(x)).toList());
  }

  void addToExcelData(dynamic value) {
    excelData.add(value);
    prefs.setStringList(
        'ff_excelData', _excelData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromExcelData(dynamic value) {
    excelData.remove(value);
    prefs.setStringList(
        'ff_excelData', _excelData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromExcelData(int index) {
    excelData.removeAt(index);
    prefs.setStringList(
        'ff_excelData', _excelData.map((x) => jsonEncode(x)).toList());
  }

  void updateExcelDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    excelData[index] = updateFn(_excelData[index]);
    prefs.setStringList(
        'ff_excelData', _excelData.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInExcelData(int index, dynamic value) {
    excelData.insert(index, value);
    prefs.setStringList(
        'ff_excelData', _excelData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _markersList = [];
  List<dynamic> get markersList => _markersList;
  set markersList(List<dynamic> value) {
    _markersList = value;
  }

  void addToMarkersList(dynamic value) {
    markersList.add(value);
  }

  void removeFromMarkersList(dynamic value) {
    markersList.remove(value);
  }

  void removeAtIndexFromMarkersList(int index) {
    markersList.removeAt(index);
  }

  void updateMarkersListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    markersList[index] = updateFn(_markersList[index]);
  }

  void insertAtIndexInMarkersList(int index, dynamic value) {
    markersList.insert(index, value);
  }

  dynamic _TripTrackingData;
  dynamic get TripTrackingData => _TripTrackingData;
  set TripTrackingData(dynamic value) {
    _TripTrackingData = value;
  }

  List<dynamic> _AllTripTracking = [];
  List<dynamic> get AllTripTracking => _AllTripTracking;
  set AllTripTracking(List<dynamic> value) {
    _AllTripTracking = value;
  }

  void addToAllTripTracking(dynamic value) {
    AllTripTracking.add(value);
  }

  void removeFromAllTripTracking(dynamic value) {
    AllTripTracking.remove(value);
  }

  void removeAtIndexFromAllTripTracking(int index) {
    AllTripTracking.removeAt(index);
  }

  void updateAllTripTrackingAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    AllTripTracking[index] = updateFn(_AllTripTracking[index]);
  }

  void insertAtIndexInAllTripTracking(int index, dynamic value) {
    AllTripTracking.insert(index, value);
  }

  bool _isTripUserLoggedIn = false;
  bool get isTripUserLoggedIn => _isTripUserLoggedIn;
  set isTripUserLoggedIn(bool value) {
    _isTripUserLoggedIn = value;
    prefs.setBool('ff_isTripUserLoggedIn', value);
  }

  List<String> _TripLabelList = [
    'Total Trips Count',
    'Active Trips Count',
    'Ended Trips Count',
    'Delayed Trips',
    'Unstarted Trips'
  ];
  List<String> get TripLabelList => _TripLabelList;
  set TripLabelList(List<String> value) {
    _TripLabelList = value;
  }

  void addToTripLabelList(String value) {
    TripLabelList.add(value);
  }

  void removeFromTripLabelList(String value) {
    TripLabelList.remove(value);
  }

  void removeAtIndexFromTripLabelList(int index) {
    TripLabelList.removeAt(index);
  }

  void updateTripLabelListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    TripLabelList[index] = updateFn(_TripLabelList[index]);
  }

  void insertAtIndexInTripLabelList(int index, String value) {
    TripLabelList.insert(index, value);
  }

  List<int> _TripValueList = [];
  List<int> get TripValueList => _TripValueList;
  set TripValueList(List<int> value) {
    _TripValueList = value;
  }

  void addToTripValueList(int value) {
    TripValueList.add(value);
  }

  void removeFromTripValueList(int value) {
    TripValueList.remove(value);
  }

  void removeAtIndexFromTripValueList(int index) {
    TripValueList.removeAt(index);
  }

  void updateTripValueListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    TripValueList[index] = updateFn(_TripValueList[index]);
  }

  void insertAtIndexInTripValueList(int index, int value) {
    TripValueList.insert(index, value);
  }

  dynamic _DeviceList;
  dynamic get DeviceList => _DeviceList;
  set DeviceList(dynamic value) {
    _DeviceList = value;
    prefs.setString('ff_DeviceList', jsonEncode(value));
  }

  dynamic _markerList;
  dynamic get markerList => _markerList;
  set markerList(dynamic value) {
    _markerList = value;
    prefs.setString('ff_markerList', jsonEncode(value));
  }

  dynamic _ListViewData;
  dynamic get ListViewData => _ListViewData;
  set ListViewData(dynamic value) {
    _ListViewData = value;
    prefs.setString('ff_ListViewData', jsonEncode(value));
  }

  dynamic _monitorScreenEagleEyeData;
  dynamic get monitorScreenEagleEyeData => _monitorScreenEagleEyeData;
  set monitorScreenEagleEyeData(dynamic value) {
    _monitorScreenEagleEyeData = value;
    prefs.setString('ff_monitorScreenEagleEyeData', jsonEncode(value));
  }

  List<String> _selectedDeviceToView = [];
  List<String> get selectedDeviceToView => _selectedDeviceToView;
  set selectedDeviceToView(List<String> value) {
    _selectedDeviceToView = value;
  }

  void addToSelectedDeviceToView(String value) {
    selectedDeviceToView.add(value);
  }

  void removeFromSelectedDeviceToView(String value) {
    selectedDeviceToView.remove(value);
  }

  void removeAtIndexFromSelectedDeviceToView(int index) {
    selectedDeviceToView.removeAt(index);
  }

  void updateSelectedDeviceToViewAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedDeviceToView[index] = updateFn(_selectedDeviceToView[index]);
  }

  void insertAtIndexInSelectedDeviceToView(int index, String value) {
    selectedDeviceToView.insert(index, value);
  }

  List<String> _selectedDeviceForTrack = [];
  List<String> get selectedDeviceForTrack => _selectedDeviceForTrack;
  set selectedDeviceForTrack(List<String> value) {
    _selectedDeviceForTrack = value;
  }

  void addToSelectedDeviceForTrack(String value) {
    selectedDeviceForTrack.add(value);
  }

  void removeFromSelectedDeviceForTrack(String value) {
    selectedDeviceForTrack.remove(value);
  }

  void removeAtIndexFromSelectedDeviceForTrack(int index) {
    selectedDeviceForTrack.removeAt(index);
  }

  void updateSelectedDeviceForTrackAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedDeviceForTrack[index] = updateFn(_selectedDeviceForTrack[index]);
  }

  void insertAtIndexInSelectedDeviceForTrack(int index, String value) {
    selectedDeviceForTrack.insert(index, value);
  }

  String _ChangeAccountJWT = '';
  String get ChangeAccountJWT => _ChangeAccountJWT;
  set ChangeAccountJWT(String value) {
    _ChangeAccountJWT = value;
    prefs.setString('ff_ChangeAccountJWT', value);
  }

  int _sidebarNav = 0;
  int get sidebarNav => _sidebarNav;
  set sidebarNav(int value) {
    _sidebarNav = value;
  }

  List<String> _SelectedColumItems = ['DEVICENAME', 'DEVICEIMEI', 'ODOMETER'];
  List<String> get SelectedColumItems => _SelectedColumItems;
  set SelectedColumItems(List<String> value) {
    _SelectedColumItems = value;
    prefs.setStringList('ff_SelectedColumItems', value);
  }

  void addToSelectedColumItems(String value) {
    SelectedColumItems.add(value);
    prefs.setStringList('ff_SelectedColumItems', _SelectedColumItems);
  }

  void removeFromSelectedColumItems(String value) {
    SelectedColumItems.remove(value);
    prefs.setStringList('ff_SelectedColumItems', _SelectedColumItems);
  }

  void removeAtIndexFromSelectedColumItems(int index) {
    SelectedColumItems.removeAt(index);
    prefs.setStringList('ff_SelectedColumItems', _SelectedColumItems);
  }

  void updateSelectedColumItemsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    SelectedColumItems[index] = updateFn(_SelectedColumItems[index]);
    prefs.setStringList('ff_SelectedColumItems', _SelectedColumItems);
  }

  void insertAtIndexInSelectedColumItems(int index, String value) {
    SelectedColumItems.insert(index, value);
    prefs.setStringList('ff_SelectedColumItems', _SelectedColumItems);
  }

  dynamic _userSelfData;
  dynamic get userSelfData => _userSelfData;
  set userSelfData(dynamic value) {
    _userSelfData = value;
    prefs.setString('ff_userSelfData', jsonEncode(value));
  }

  dynamic _tripHistoryData;
  dynamic get tripHistoryData => _tripHistoryData;
  set tripHistoryData(dynamic value) {
    _tripHistoryData = value;
  }

  List<CountryCodeListStruct> _countryCodeList = [
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"India\",\"countryCode\":\"+91\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Malaysia \",\"countryCode\":\"+60\"}')),
    CountryCodeListStruct.fromSerializableMap(jsonDecode(
        '{\"countryName\":\"Bangladesh\",\"countryCode\":\"+880\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Pakistan\",\"countryCode\":\"+92\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Nepal\",\"countryCode\":\"+977\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Thailand\",\"countryCode\":\"+66\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Iran\",\"countryCode\":\"+98\"}')),
    CountryCodeListStruct.fromSerializableMap(jsonDecode(
        '{\"countryName\":\"Saudi Arabia\",\"countryCode\":\"+966\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"China\",\"countryCode\":\"+86\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Indonesia\",\"countryCode\":\"+62\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Puerto Rico\",\"countryCode\":\"+1\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Kenya\",\"countryCode\":\"+254\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Sri Lanka\",\"countryCode\":\"+94\"}')),
    CountryCodeListStruct.fromSerializableMap(
        jsonDecode('{\"countryName\":\"Morocco\",\"countryCode\":\"+212\"}')),
    CountryCodeListStruct.fromSerializableMap(jsonDecode(
        '{\"countryName\":\"South Africa\",\"countryCode\":\"+27\"}'))
  ];
  List<CountryCodeListStruct> get countryCodeList => _countryCodeList;
  set countryCodeList(List<CountryCodeListStruct> value) {
    _countryCodeList = value;
  }

  void addToCountryCodeList(CountryCodeListStruct value) {
    countryCodeList.add(value);
  }

  void removeFromCountryCodeList(CountryCodeListStruct value) {
    countryCodeList.remove(value);
  }

  void removeAtIndexFromCountryCodeList(int index) {
    countryCodeList.removeAt(index);
  }

  void updateCountryCodeListAtIndex(
    int index,
    CountryCodeListStruct Function(CountryCodeListStruct) updateFn,
  ) {
    countryCodeList[index] = updateFn(_countryCodeList[index]);
  }

  void insertAtIndexInCountryCodeList(int index, CountryCodeListStruct value) {
    countryCodeList.insert(index, value);
  }

  dynamic _vehicleModel;
  dynamic get vehicleModel => _vehicleModel;
  set vehicleModel(dynamic value) {
    _vehicleModel = value;
    prefs.setString('ff_vehicleModel', jsonEncode(value));
  }

  LatLng? _flaves = LatLng(23.320076, 85.297937);
  LatLng? get flaves => _flaves;
  set flaves(LatLng? value) {
    _flaves = value;
  }

  dynamic _listViewScreen;
  dynamic get listViewScreen => _listViewScreen;
  set listViewScreen(dynamic value) {
    _listViewScreen = value;
  }

  bool _themeMode = false;
  bool get themeMode => _themeMode;
  set themeMode(bool value) {
    _themeMode = value;
    prefs.setBool('ff_themeMode', value);
  }

  double _selectedLat = 0.0;
  double get selectedLat => _selectedLat;
  set selectedLat(double value) {
    _selectedLat = value;
  }

  double _selectedLng = 0.0;
  double get selectedLng => _selectedLng;
  set selectedLng(double value) {
    _selectedLng = value;
  }

  List<LatLng> _createGeofenceVertices = [LatLng(0.0, 0.0)];
  List<LatLng> get createGeofenceVertices => _createGeofenceVertices;
  set createGeofenceVertices(List<LatLng> value) {
    _createGeofenceVertices = value;
    prefs.setStringList(
        'ff_createGeofenceVertices', value.map((x) => x.serialize()).toList());
  }

  void addToCreateGeofenceVertices(LatLng value) {
    createGeofenceVertices.add(value);
    prefs.setStringList('ff_createGeofenceVertices',
        _createGeofenceVertices.map((x) => x.serialize()).toList());
  }

  void removeFromCreateGeofenceVertices(LatLng value) {
    createGeofenceVertices.remove(value);
    prefs.setStringList('ff_createGeofenceVertices',
        _createGeofenceVertices.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCreateGeofenceVertices(int index) {
    createGeofenceVertices.removeAt(index);
    prefs.setStringList('ff_createGeofenceVertices',
        _createGeofenceVertices.map((x) => x.serialize()).toList());
  }

  void updateCreateGeofenceVerticesAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    createGeofenceVertices[index] = updateFn(_createGeofenceVertices[index]);
    prefs.setStringList('ff_createGeofenceVertices',
        _createGeofenceVertices.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCreateGeofenceVertices(int index, LatLng value) {
    createGeofenceVertices.insert(index, value);
    prefs.setStringList('ff_createGeofenceVertices',
        _createGeofenceVertices.map((x) => x.serialize()).toList());
  }

  LatLng? _userLocation = LatLng(23.3440997, 85.309562);
  LatLng? get userLocation => _userLocation;
  set userLocation(LatLng? value) {
    _userLocation = value;
    value != null
        ? prefs.setString('ff_userLocation', value.serialize())
        : prefs.remove('ff_userLocation');
  }

  String _geofenceType = 'polygon or circle';
  String get geofenceType => _geofenceType;
  set geofenceType(String value) {
    _geofenceType = value;
  }

  LatLng? _geofenceCircle = LatLng(0.0, 0.0);
  LatLng? get geofenceCircle => _geofenceCircle;
  set geofenceCircle(LatLng? value) {
    _geofenceCircle = value;
  }

  double _geofenceRadius = 100.0;
  double get geofenceRadius => _geofenceRadius;
  set geofenceRadius(double value) {
    _geofenceRadius = value;
  }

  LatLng? _geofenceCenter = LatLng(0.0, 0.0);
  LatLng? get geofenceCenter => _geofenceCenter;
  set geofenceCenter(LatLng? value) {
    _geofenceCenter = value;
  }

  String _geofenceMode = 'circle';
  String get geofenceMode => _geofenceMode;
  set geofenceMode(String value) {
    _geofenceMode = value;
  }

  List<ReportWithTypesStruct> _reportTypesList = [
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"General Information\",\"reportVal\":\"general-info\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"General Information Merged\",\"reportVal\":\"general-info-merged\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Drives and Stops\",\"reportVal\":\"drives-and-stops\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Travel Sheet\",\"reportVal\":\"travel-sheet\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Travel Sheet DN\",\"reportVal\":\"travel-sheet-dn\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Drives and stops with sensors\",\"reportVal\":\"drives-and-stops-with-sensors\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Drives and Stops With Logic Sensor\",\"reportVal\":\"drives-and-stops-with-logic-sensors\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Mileage Daily\",\"reportVal\":\"mileage-daily\"}')),
    ReportWithTypesStruct.fromSerializableMap(jsonDecode(
        '{\"reportLabel\":\"Overspeed\",\"reportVal\":\"overspeed\"}'))
  ];
  List<ReportWithTypesStruct> get reportTypesList => _reportTypesList;
  set reportTypesList(List<ReportWithTypesStruct> value) {
    _reportTypesList = value;
  }

  void addToReportTypesList(ReportWithTypesStruct value) {
    reportTypesList.add(value);
  }

  void removeFromReportTypesList(ReportWithTypesStruct value) {
    reportTypesList.remove(value);
  }

  void removeAtIndexFromReportTypesList(int index) {
    reportTypesList.removeAt(index);
  }

  void updateReportTypesListAtIndex(
    int index,
    ReportWithTypesStruct Function(ReportWithTypesStruct) updateFn,
  ) {
    reportTypesList[index] = updateFn(_reportTypesList[index]);
  }

  void insertAtIndexInReportTypesList(int index, ReportWithTypesStruct value) {
    reportTypesList.insert(index, value);
  }

  List<String> _pieChartLabels = ['moving', 'stopped', 'idling', 'offline'];
  List<String> get pieChartLabels => _pieChartLabels;
  set pieChartLabels(List<String> value) {
    _pieChartLabels = value;
  }

  void addToPieChartLabels(String value) {
    pieChartLabels.add(value);
  }

  void removeFromPieChartLabels(String value) {
    pieChartLabels.remove(value);
  }

  void removeAtIndexFromPieChartLabels(int index) {
    pieChartLabels.removeAt(index);
  }

  void updatePieChartLabelsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    pieChartLabels[index] = updateFn(_pieChartLabels[index]);
  }

  void insertAtIndexInPieChartLabels(int index, String value) {
    pieChartLabels.insert(index, value);
  }

  List<double> _pieChartValues = [10.0, 20.0, 30.0, 88.9];
  List<double> get pieChartValues => _pieChartValues;
  set pieChartValues(List<double> value) {
    _pieChartValues = value;
  }

  void addToPieChartValues(double value) {
    pieChartValues.add(value);
  }

  void removeFromPieChartValues(double value) {
    pieChartValues.remove(value);
  }

  void removeAtIndexFromPieChartValues(int index) {
    pieChartValues.removeAt(index);
  }

  void updatePieChartValuesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    pieChartValues[index] = updateFn(_pieChartValues[index]);
  }

  void insertAtIndexInPieChartValues(int index, double value) {
    pieChartValues.insert(index, value);
  }

  Color _geofencePolygonColor = Colors.transparent;
  Color get geofencePolygonColor => _geofencePolygonColor;
  set geofencePolygonColor(Color value) {
    _geofencePolygonColor = value;
    prefs.setInt('ff_geofencePolygonColor', value.value);
  }

  Color _geofenceCircleColor = Colors.transparent;
  Color get geofenceCircleColor => _geofenceCircleColor;
  set geofenceCircleColor(Color value) {
    _geofenceCircleColor = value;
    prefs.setInt('ff_geofenceCircleColor', value.value);
  }

  Color _geofenceMainColor = Color(4280860368);
  Color get geofenceMainColor => _geofenceMainColor;
  set geofenceMainColor(Color value) {
    _geofenceMainColor = value;
    prefs.setInt('ff_geofenceMainColor', value.value);
  }

  List<LatLng> _updateGeofenceVertices = [];
  List<LatLng> get updateGeofenceVertices => _updateGeofenceVertices;
  set updateGeofenceVertices(List<LatLng> value) {
    _updateGeofenceVertices = value;
  }

  void addToUpdateGeofenceVertices(LatLng value) {
    updateGeofenceVertices.add(value);
  }

  void removeFromUpdateGeofenceVertices(LatLng value) {
    updateGeofenceVertices.remove(value);
  }

  void removeAtIndexFromUpdateGeofenceVertices(int index) {
    updateGeofenceVertices.removeAt(index);
  }

  void updateUpdateGeofenceVerticesAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    updateGeofenceVertices[index] = updateFn(_updateGeofenceVertices[index]);
  }

  void insertAtIndexInUpdateGeofenceVertices(int index, LatLng value) {
    updateGeofenceVertices.insert(index, value);
  }

  String _selectedLatString = '';
  String get selectedLatString => _selectedLatString;
  set selectedLatString(String value) {
    _selectedLatString = value;
  }

  String _selectedLngString = '';
  String get selectedLngString => _selectedLngString;
  set selectedLngString(String value) {
    _selectedLngString = value;
  }

  LatLng? _selectedLatLng;
  LatLng? get selectedLatLng => _selectedLatLng;
  set selectedLatLng(LatLng? value) {
    _selectedLatLng = value;
  }

  double _selectedLatitude = 0.0;
  double get selectedLatitude => _selectedLatitude;
  set selectedLatitude(double value) {
    _selectedLatitude = value;
  }

  double _selectedLongitude = 0.0;
  double get selectedLongitude => _selectedLongitude;
  set selectedLongitude(double value) {
    _selectedLongitude = value;
  }

  dynamic _groupData;
  dynamic get groupData => _groupData;
  set groupData(dynamic value) {
    _groupData = value;
  }

  Color _markerColor = Color(4280860368);
  Color get markerColor => _markerColor;
  set markerColor(Color value) {
    _markerColor = value;
  }

  String _markerIcon = '';
  String get markerIcon => _markerIcon;
  set markerIcon(String value) {
    _markerIcon = value;
    prefs.setString('ff_markerIcon', value);
  }

  List<String> _MarkerIconName = [
    '\'location_on\'',
    '\'place\'',
    '\'pin_drop\'',
    '\'room\'',
    '\'location_pin\'',
    'my_location\'',
    '\'map\'',
    '\'flag\'',
    '\'home\'',
    '\'business\''
  ];
  List<String> get MarkerIconName => _MarkerIconName;
  set MarkerIconName(List<String> value) {
    _MarkerIconName = value;
  }

  void addToMarkerIconName(String value) {
    MarkerIconName.add(value);
  }

  void removeFromMarkerIconName(String value) {
    MarkerIconName.remove(value);
  }

  void removeAtIndexFromMarkerIconName(int index) {
    MarkerIconName.removeAt(index);
  }

  void updateMarkerIconNameAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    MarkerIconName[index] = updateFn(_MarkerIconName[index]);
  }

  void insertAtIndexInMarkerIconName(int index, String value) {
    MarkerIconName.insert(index, value);
  }

  Color _EditMarkerColor = Color(4280860368);
  Color get EditMarkerColor => _EditMarkerColor;
  set EditMarkerColor(Color value) {
    _EditMarkerColor = value;
  }

  bool _poiVisible = true;
  bool get poiVisible => _poiVisible;
  set poiVisible(bool value) {
    _poiVisible = value;
  }

  String _editMarkerIcon = '';
  String get editMarkerIcon => _editMarkerIcon;
  set editMarkerIcon(String value) {
    _editMarkerIcon = value;
    prefs.setString('ff_editMarkerIcon', value);
  }

  List<double> _geofencePolygonLatitudes = [];
  List<double> get geofencePolygonLatitudes => _geofencePolygonLatitudes;
  set geofencePolygonLatitudes(List<double> value) {
    _geofencePolygonLatitudes = value;
  }

  void addToGeofencePolygonLatitudes(double value) {
    geofencePolygonLatitudes.add(value);
  }

  void removeFromGeofencePolygonLatitudes(double value) {
    geofencePolygonLatitudes.remove(value);
  }

  void removeAtIndexFromGeofencePolygonLatitudes(int index) {
    geofencePolygonLatitudes.removeAt(index);
  }

  void updateGeofencePolygonLatitudesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    geofencePolygonLatitudes[index] =
        updateFn(_geofencePolygonLatitudes[index]);
  }

  void insertAtIndexInGeofencePolygonLatitudes(int index, double value) {
    geofencePolygonLatitudes.insert(index, value);
  }

  List<double> _geofencePolygonLongitudes = [];
  List<double> get geofencePolygonLongitudes => _geofencePolygonLongitudes;
  set geofencePolygonLongitudes(List<double> value) {
    _geofencePolygonLongitudes = value;
  }

  void addToGeofencePolygonLongitudes(double value) {
    geofencePolygonLongitudes.add(value);
  }

  void removeFromGeofencePolygonLongitudes(double value) {
    geofencePolygonLongitudes.remove(value);
  }

  void removeAtIndexFromGeofencePolygonLongitudes(int index) {
    geofencePolygonLongitudes.removeAt(index);
  }

  void updateGeofencePolygonLongitudesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    geofencePolygonLongitudes[index] =
        updateFn(_geofencePolygonLongitudes[index]);
  }

  void insertAtIndexInGeofencePolygonLongitudes(int index, double value) {
    geofencePolygonLongitudes.insert(index, value);
  }

  bool _isPOIVisible = true;
  bool get isPOIVisible => _isPOIVisible;
  set isPOIVisible(bool value) {
    _isPOIVisible = value;
  }

  bool _isPOINameVisible = false;
  bool get isPOINameVisible => _isPOINameVisible;
  set isPOINameVisible(bool value) {
    _isPOINameVisible = value;
  }

  String _geofenceShape = '\"circle\"';
  String get geofenceShape => _geofenceShape;
  set geofenceShape(String value) {
    _geofenceShape = value;
  }

  String _geofenceColor = '\"#9BFF4F\"';
  String get geofenceColor => _geofenceColor;
  set geofenceColor(String value) {
    _geofenceColor = value;
  }

  List<double> _geofenceVertices = [];
  List<double> get geofenceVertices => _geofenceVertices;
  set geofenceVertices(List<double> value) {
    _geofenceVertices = value;
  }

  void addToGeofenceVertices(double value) {
    geofenceVertices.add(value);
  }

  void removeFromGeofenceVertices(double value) {
    geofenceVertices.remove(value);
  }

  void removeAtIndexFromGeofenceVertices(int index) {
    geofenceVertices.removeAt(index);
  }

  void updateGeofenceVerticesAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    geofenceVertices[index] = updateFn(_geofenceVertices[index]);
  }

  void insertAtIndexInGeofenceVertices(int index, double value) {
    geofenceVertices.insert(index, value);
  }

  double _geofenceOrigin = 0.0;
  double get geofenceOrigin => _geofenceOrigin;
  set geofenceOrigin(double value) {
    _geofenceOrigin = value;
  }

  String _geofenceName = '';
  String get geofenceName => _geofenceName;
  set geofenceName(String value) {
    _geofenceName = value;
  }

  bool _geofenceVisible = false;
  bool get geofenceVisible => _geofenceVisible;
  set geofenceVisible(bool value) {
    _geofenceVisible = value;
  }

  double _geofenceOriginLat = 0.0;
  double get geofenceOriginLat => _geofenceOriginLat;
  set geofenceOriginLat(double value) {
    _geofenceOriginLat = value;
  }

  double _geofenceOriginLng = 0.0;
  double get geofenceOriginLng => _geofenceOriginLng;
  set geofenceOriginLng(double value) {
    _geofenceOriginLng = value;
  }

  List<dynamic> _polygonVertices = [];
  List<dynamic> get polygonVertices => _polygonVertices;
  set polygonVertices(List<dynamic> value) {
    _polygonVertices = value;
  }

  void addToPolygonVertices(dynamic value) {
    polygonVertices.add(value);
  }

  void removeFromPolygonVertices(dynamic value) {
    polygonVertices.remove(value);
  }

  void removeAtIndexFromPolygonVertices(int index) {
    polygonVertices.removeAt(index);
  }

  void updatePolygonVerticesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    polygonVertices[index] = updateFn(_polygonVertices[index]);
  }

  void insertAtIndexInPolygonVertices(int index, dynamic value) {
    polygonVertices.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
