import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Php Api Group Group Code

class PhpApiGroupGroup {
  static String getBaseUrl() => 'https://gps.speedotrack.com/';
  static Map<String, String> headers = {};
  static PhpLoginApiCall phpLoginApiCall = PhpLoginApiCall();
  static PhpGetUserAPIKeyCall phpGetUserAPIKeyCall = PhpGetUserAPIKeyCall();
  static PhpGetUserObjectsCall phpGetUserObjectsCall = PhpGetUserObjectsCall();
  static GetSingleObjectDataCall getSingleObjectDataCall =
      GetSingleObjectDataCall();
  static TestLargeDeviceCall testLargeDeviceCall = TestLargeDeviceCall();
  static FnConnectLOGINTRACKINGApiCall fnConnectLOGINTRACKINGApiCall =
      FnConnectLOGINTRACKINGApiCall();
  static PhpGetEventsOneDayCall phpGetEventsOneDayCall =
      PhpGetEventsOneDayCall();
  static HistoryRouteCall historyRouteCall = HistoryRouteCall();
  static GprsCommandEngineLockUnlockCall gprsCommandEngineLockUnlockCall =
      GprsCommandEngineLockUnlockCall();
  static DeviceGeneralInfoCall deviceGeneralInfoCall = DeviceGeneralInfoCall();
  static GetDeviceHistoryCall getDeviceHistoryCall = GetDeviceHistoryCall();
  static GetUserCommandsExecCall getUserCommandsExecCall =
      GetUserCommandsExecCall();
  static ReportsDownloadCall reportsDownloadCall = ReportsDownloadCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static GetUserProfileDataCall getUserProfileDataCall =
      GetUserProfileDataCall();
  static PlaybackTestHistoryRouteCall playbackTestHistoryRouteCall =
      PlaybackTestHistoryRouteCall();
  static NewPlaybackHistoryRouteCall newPlaybackHistoryRouteCall =
      NewPlaybackHistoryRouteCall();
  static DeviceTripInfoCall deviceTripInfoCall = DeviceTripInfoCall();
  static PlaybackTestAfterErrorCall playbackTestAfterErrorCall =
      PlaybackTestAfterErrorCall();
  static GetUserCommandsCall getUserCommandsCall = GetUserCommandsCall();
  static UpdateOdometerCall updateOdometerCall = UpdateOdometerCall();
  static UpdateEngineHourCall updateEngineHourCall = UpdateEngineHourCall();
  static UpdateCostAndMileageCall updateCostAndMileageCall =
      UpdateCostAndMileageCall();
  static UpdateIconCall updateIconCall = UpdateIconCall();
  static GetMaintainenceListCall getMaintainenceListCall =
      GetMaintainenceListCall();
  static AddMaintainenceCall addMaintainenceCall = AddMaintainenceCall();
  static DeleteDeviceCall deleteDeviceCall = DeleteDeviceCall();
}

class PhpLoginApiCall {
  Future<ApiCallResponse> call({
    String? username = 'flaves',
    String? password = '123456',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Php Login Api',
      apiUrl:
          '${baseUrl}login.php?username=${username}&password=${password}&mobile=false',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhpGetUserAPIKeyCall {
  Future<ApiCallResponse> call({
    String? usernameForApiKey = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Php Get User API key',
      apiUrl:
          '${baseUrl}api/api.php?api=server&ver=1.0&key=2C805608B18ED88096531BC30C8F1008&cmd=GET_USER_API_KEY,${usernameForApiKey}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhpGetUserObjectsCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Php Get User Objects',
      apiUrl:
          '${baseUrl}api/api.php?api=user&ver=1.0&key=${userApiKey}&cmd=USER_GET_OBJECTS',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSingleObjectDataCall {
  Future<ApiCallResponse> call({
    String? deviceImeiForData = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get SingleObject Data',
      apiUrl:
          '${baseUrl}api/api.php?api=user&ver=1.0&key=0F81DB92DEA0BA1240375BE6EBB97677&cmd=OBJECT_GET_LOCATIONS,${deviceImeiForData};',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestLargeDeviceCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    int? pageNumber = 1,
    String? rows = '1000',
    String? fv = 'total',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'test large device',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${apiKey}&cmd=USER_GET_OBJECTS&page=${pageNumber}&rows=${rows}&sidx=name&sord=ASC&ff=status&fv=${fv}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FnConnectLOGINTRACKINGApiCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'fn Connect LOGIN TRACKING Api',
      apiUrl: '${baseUrl}func/fn_connect.php',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'cmd': "login",
        'mobile': "false",
        'remember_me': "true",
        'username': username,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhpGetEventsOneDayCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '0F81DB92DEA0BA1240375BE6EBB97677',
    int? pageNumber = 1,
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Php Get Events One Day',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=OBJECT_GET_LAST_EVENTS&page=${pageNumber}&rows=20',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistoryRouteCall {
  Future<ApiCallResponse> call({
    String? userApiKey = 'DE94E9E4F69FFCBAF1820F61BA8B8564',
    String? deviceImeiForHistoryData = '350544505840549',
    String? startDate = '2024-03-03 00:00:00',
    String? endDate = '2024-04-03 00:00:00',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'History Route',
      apiUrl:
          '${baseUrl}api/api.php?api=user&ver=1.0&key=${userApiKey}&cmd=OBJECT_GET_ROUTE,${deviceImeiForHistoryData},${startDate},${endDate},5',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GprsCommandEngineLockUnlockCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImeiForLockUnlock = '',
    String? lockUnlockCommandForDevice = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Gprs Command Engine lock unlock',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=OBJECT_CMD_GPRS',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': "Comand",
        'type': "ascii",
        'cmd': lockUnlockCommandForDevice,
        'imei': deviceImeiForLockUnlock,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeviceGeneralInfoCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImeiForInfo = '',
    String? dateFrom = '',
    String? dateTo = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deviceGeneralInfo',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=REPORT_GENERAL',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': deviceImeiForInfo,
        'dtf': dateFrom,
        'dtt': dateTo,
        'speed_limit': "60",
        'stop_duration': "1",
        'data_items':
            "route_start,route_end,route_length,move_duration,stop_duration,stop_count,top_speed,avg_speed,overspeed_count,fuel_consumption,avg_fuel_consumption,fuel_cost,engine_work,engine_idle,odometer,engine_hours,driver,trailer",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDeviceHistoryCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? reportName = '',
    String? reportType = '',
    String? reportFormat = '',
    String? deviceImeiForReport = '',
    String? dateFrom = '',
    String? dateTo = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get Device History',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=REPORT',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'report_id': "4",
        'name': reportName,
        'type': reportType,
        'ignore_empty_reports': false,
        'format': reportFormat,
        'show_coordinates': true,
        'show_addresses': false,
        'zones_addresses': false,
        'stop_duration': 1,
        'speed_limit': 80,
        'imei': deviceImeiForReport,
        'marker_ids': "1",
        'zone_ids': "1",
        'sensor_names': "1",
        'data_items':
            "route_start,route_end,route_length,move_duration,stop_duration,stop_count,top_speed,avg_speed,overspeed_count,fuel_consumption,avg_fuel_consumption,fuel_cost,engine_work,engine_idle,odometer,engine_hours,driver,trailer",
        'other': "1",
        'schedule_period': "1",
        'schedule_email_address': "1",
        'dtf': dateFrom,
        'dtt': dateTo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserCommandsExecCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImeiForCommandList = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get user Commands Exec',
      apiUrl:
          '${baseUrl}api/api.php?api=user&ver=1.0&key=${userApiKey}&cmd=OBJECT_GET_CMD_EXEC,${deviceImeiForCommandList}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportsDownloadCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? reportName = '',
    String? reportType = '',
    String? reportFormat = '',
    bool? ignoreEmptyReports,
    bool? showCoordinates = true,
    bool? showAddresses,
    bool? zoneAddresses,
    int? stopDuration = 1,
    int? speedLimit = 80,
    String? selectedVehicleForReport = '',
    String? markerIdForReport = '',
    String? zoneIdForReport = '',
    String? sensorNamesForReport = '',
    String? dataItems =
        'route_start,route_end,route_length,move_duration,stop_duration,stop_count,top_speed,avg_speed,overspeed_count,fuel_consumption,avg_fuel_consumption,fuel_cost,engine_work,engine_idle,odometer,engine_hours,driver,trailer',
    String? otherItemsForReport = '',
    String? schedulePeriod = '',
    String? scheduleEmailAddresses = '',
    String? dateFrom = '',
    String? dateTo = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Reports Download',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=REPORT',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': reportName,
        'type': reportType,
        'format': reportFormat,
        'ignore_empty_reports': ignoreEmptyReports,
        'show_coordinates': showCoordinates,
        'show_addresses': showAddresses,
        'zones_addresses': zoneAddresses,
        'stop_duration': stopDuration,
        'speed_limit': speedLimit,
        'imei': selectedVehicleForReport,
        'marker_ids': markerIdForReport,
        'zone_ids': zoneIdForReport,
        'sensor_names': sensorNamesForReport,
        'data_items': dataItems,
        'other': otherItemsForReport,
        'schedule_period': schedulePeriod,
        'schedule_email_address': scheduleEmailAddresses,
        'dtf': dateFrom,
        'dtt': dateTo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? oldPassword = '',
    String? newPassword = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'change Password',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=CHANGE_PASSWORD',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'old_password': oldPassword,
        'new_password': newPassword,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserProfileDataCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Profile Data',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=GET_USER_PROFILE',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlaybackTestHistoryRouteCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImei = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PlaybackTestHistoryRoute',
      apiUrl:
          '${baseUrl}/api.php?api=user&ver=1.0&key=EA65D4BA8273DCF57F82E5AB84D611A4&cmd=OBJECT_GET_ROUTE%2C111111111111111%2C1jan%2000%3A00%3A00%2C10june%2000%3A00%3A00%2C1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NewPlaybackHistoryRouteCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImei = '',
    String? dateFrom = '',
    String? dateTo = '',
    String? minStopDuration = '2',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'NewPlaybackHistoryRoute',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=LOAD_ROUTE_DATA',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': deviceImei,
        'dtf': dateFrom,
        'dtt': dateTo,
        'min_stop_duration': minStopDuration,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeviceTripInfoCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? deviceImei = '',
    String? startDate = '',
    String? endDate = '',
    String? stops = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Device Trip Info',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${apiKey}&cmd=OBJECT_GET_TRIPS,${deviceImei},${startDate},${endDate},${stops}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlaybackTestAfterErrorCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    String? selectedDeviceImei = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PlaybackTestAfterError',
      apiUrl:
          '${baseUrl}api/api.php?api=user&ver=1.0&key=${apiKey}&cmd=OBJECT_GET_ROUTE,${selectedDeviceImei},${startDate},${endDate},1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserCommandsCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImei = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get User Commands',
      apiUrl:
          '${baseUrl}/api/api.php?api=user&ver=1.0&key=${userApiKey}&cmd=OBJECT_GET_CMDS,${deviceImei}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateOdometerCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImei = '',
    String? odometerValue = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Odometer',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=EDIT_OBJECT_ODOMETER',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': deviceImei,
        'odometer': odometerValue,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateEngineHourCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? deviceImei = '',
    String? engineHourValue = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Engine Hour',
      apiUrl:
          '${baseUrl}/api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=EDIT_OBJECT_ENGINE_HOUR',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': deviceImei,
        'engine_hours': engineHourValue,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCostAndMileageCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? selectedDeviceImei = '',
    String? fuelCost = '',
    String? mileage = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Cost and Mileage',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=EDIT_OBJECT_FUEL_COST_AND_MILEAGE',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': selectedDeviceImei,
        'cost': fuelCost,
        'mileage': mileage,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateIconCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? selectedDeviceImei = '',
    String? iconString = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Update Icon',
      apiUrl:
          '${baseUrl}api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=EDIT_OBJECT_ICON',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'imei': selectedDeviceImei,
        'icon': iconString,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMaintainenceListCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get Maintainence List',
      apiUrl:
          '${baseUrl}/api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=USER_GET_MAINTENANCE,*',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddMaintainenceCall {
  Future<ApiCallResponse> call({
    String? userApiKey = '',
    String? name = '',
    String? imeis = '',
    bool? dataList,
    bool? popup,
    bool? odo,
    String? odoInterval = '',
    String? odoLast = '',
    bool? engh,
    String? enghInterval = '',
    String? enghLast = '',
    bool? days,
    String? daysInterval = '',
    String? daysLast = '',
    bool? odoLeft,
    String? odoLeftNum = '',
    bool? daysLeft,
    String? daysLeftNum = '',
    bool? updateLast,
    bool? enghLeft,
    String? enghLeftNum = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Add Maintainence',
      apiUrl:
          '${baseUrl}/api/api.php?api=mobile&ver=1.0&key=${userApiKey}&cmd=USER_ADD_MAINTENANCE',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'name': name,
        'imeis': imeis,
        'data_list': dataList,
        'popup': popup,
        'odo': odo,
        'odo_interval': odoInterval,
        'odo_last': odoLast,
        'engh': engh,
        'engh_interval': enghInterval,
        'engh_last': enghLast,
        'days': days,
        'days_interval': daysInterval,
        'days_last': daysLast,
        'odo_left': odoLeft,
        'odo_left_num': odoLeftNum,
        'engh_left': enghLeft,
        'engh_left_num': enghLeftNum,
        'days_left': daysLeft,
        'days_left_num': daysLeftNum,
        'update_last': updateLast,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteDeviceCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = PhpApiGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'delete device',
      apiUrl: '${baseUrl}/api/cpanel/device/${id}',
      callType: ApiCallType.DELETE,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Php Api Group Group Code

/// Start New Speedotrack JS Api  Group Code

class NewSpeedotrackJSApiGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://gps.speedotrack.com/';
  static Map<String, String> headers = {
    'Authorization': '[jwt]',
  };
  static LoginApiCall loginApiCall = LoginApiCall();
  static LoadDeviceDataApiCall loadDeviceDataApiCall = LoadDeviceDataApiCall();
  static ChnagePaswordCall chnagePaswordCall = ChnagePaswordCall();
  static GeneralInformationCall generalInformationCall =
      GeneralInformationCall();
  static CommandListApiCall commandListApiCall = CommandListApiCall();
  static GetDevicesListCall getDevicesListCall = GetDevicesListCall();
  static GetDeviceTripListCall getDeviceTripListCall = GetDeviceTripListCall();
  static PostTripDeviceCall postTripDeviceCall = PostTripDeviceCall();
  static PatchTripDeviceCall patchTripDeviceCall = PatchTripDeviceCall();
  static MarkerListApiCall markerListApiCall = MarkerListApiCall();
  static DeleteTripListCall deleteTripListCall = DeleteTripListCall();
  static LockSealApiCall lockSealApiCall = LockSealApiCall();
  static UnlockSealListCall unlockSealListCall = UnlockSealListCall();
  static MarkerListCall markerListCall = MarkerListCall();
  static AddMarkerCall addMarkerCall = AddMarkerCall();
  static EditMarkerCall editMarkerCall = EditMarkerCall();
  static DeleteMarkerListApiCall deleteMarkerListApiCall =
      DeleteMarkerListApiCall();
  static SingleMarkerListCall singleMarkerListCall = SingleMarkerListCall();
  static TripDashboardCall tripDashboardCall = TripDashboardCall();
  static TripTrackingCall tripTrackingCall = TripTrackingCall();
  static AllTripTrackingCall allTripTrackingCall = AllTripTrackingCall();
  static StartTripPostAPICall startTripPostAPICall = StartTripPostAPICall();
  static EndTripPOSTAPICall endTripPOSTAPICall = EndTripPOSTAPICall();
  static TripLoginApiCall tripLoginApiCall = TripLoginApiCall();
  static UtilMarkerListCall utilMarkerListCall = UtilMarkerListCall();
  static ReportExcelCall reportExcelCall = ReportExcelCall();
  static TripHistoryCall tripHistoryCall = TripHistoryCall();
  static GeneratedEventsGetApiCall generatedEventsGetApiCall =
      GeneratedEventsGetApiCall();
  static GetSubUserCall getSubUserCall = GetSubUserCall();
  static GenerateSubUserTokenCall generateSubUserTokenCall =
      GenerateSubUserTokenCall();
  static EventApiCall eventApiCall = EventApiCall();
  static AllEventListApiCall allEventListApiCall = AllEventListApiCall();
  static DriversGetApiCall driversGetApiCall = DriversGetApiCall();
  static GetSelfCall getSelfCall = GetSelfCall();
  static SubUsersGetApiCall subUsersGetApiCall = SubUsersGetApiCall();
  static AddDeviceApiCall addDeviceApiCall = AddDeviceApiCall();
  static DashboardUserApiCall dashboardUserApiCall = DashboardUserApiCall();
  static GeoFenceListApiCall geoFenceListApiCall = GeoFenceListApiCall();
  static AddGeofenceListPolygonCall addGeofenceListPolygonCall =
      AddGeofenceListPolygonCall();
  static AddGeofenceListCircleCall addGeofenceListCircleCall =
      AddGeofenceListCircleCall();
  static EditGeofenceApiCircleCall editGeofenceApiCircleCall =
      EditGeofenceApiCircleCall();
  static EditGeofenceApiPolygonCall editGeofenceApiPolygonCall =
      EditGeofenceApiPolygonCall();
  static GeofenceFillFormDataCall geofenceFillFormDataCall =
      GeofenceFillFormDataCall();
  static DeleteGeofenceApiCall deleteGeofenceApiCall = DeleteGeofenceApiCall();
  static POIListScreenCall pOIListScreenCall = POIListScreenCall();
  static AddPOIScreenCall addPOIScreenCall = AddPOIScreenCall();
  static EditPOIScreenCall editPOIScreenCall = EditPOIScreenCall();
  static MarkerFillDataCall markerFillDataCall = MarkerFillDataCall();
  static DeletePOIScreenCall deletePOIScreenCall = DeletePOIScreenCall();
  static ActivityDetailsAPiCall activityDetailsAPiCall =
      ActivityDetailsAPiCall();
  static PlaybackAPICall playbackAPICall = PlaybackAPICall();
  static GetDeviceApiCall getDeviceApiCall = GetDeviceApiCall();
  static SignUpApiCall signUpApiCall = SignUpApiCall();
  static ForgetPasswordCall forgetPasswordCall = ForgetPasswordCall();
  static OTPVerifyCall oTPVerifyCall = OTPVerifyCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static GroupsGetAPiCall groupsGetAPiCall = GroupsGetAPiCall();
  static AddGroupCall addGroupCall = AddGroupCall();
  static AttachDevicePostApiCall attachDevicePostApiCall =
      AttachDevicePostApiCall();
  static EditGroupCall editGroupCall = EditGroupCall();
  static DeleteGroupCall deleteGroupCall = DeleteGroupCall();
  static SubUserListApiResponseCall subUserListApiResponseCall =
      SubUserListApiResponseCall();
  static AddSubUserListCall addSubUserListCall = AddSubUserListCall();
  static EventTemplatesListCall eventTemplatesListCall =
      EventTemplatesListCall();
  static DeleteSubUserListCall deleteSubUserListCall = DeleteSubUserListCall();
  static AddCommandCall addCommandCall = AddCommandCall();
  static UpdateDriverCall updateDriverCall = UpdateDriverCall();
  static AddDriverCall addDriverCall = AddDriverCall();
  static DeleteDriverCall deleteDriverCall = DeleteDriverCall();
  static GroupGetAPICall groupGetAPICall = GroupGetAPICall();
  static AddGroupApiCall addGroupApiCall = AddGroupApiCall();
  static UpdateGroupApiCall updateGroupApiCall = UpdateGroupApiCall();
  static DeleteGroupAPiCall deleteGroupAPiCall = DeleteGroupAPiCall();
  static DeleteDeviceListCall deleteDeviceListCall = DeleteDeviceListCall();
  static DevicdEditApiCall devicdEditApiCall = DevicdEditApiCall();
  static DeviceFillDataCall deviceFillDataCall = DeviceFillDataCall();
  static DeviceShareApiCall deviceShareApiCall = DeviceShareApiCall();
  static ReportPDFApiCall reportPDFApiCall = ReportPDFApiCall();
  static ReportApiCall reportApiCall = ReportApiCall();
  static DriverGetApisCall driverGetApisCall = DriverGetApisCall();
}

class LoginApiCall {
  Future<ApiCallResponse> call({
    String? uname = '',
    String? pwd = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "uname": "${uname}",
  "pwd": "${pwd}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login Api ',
      apiUrl: '${baseUrl}api/auth/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LoadDeviceDataApiCall {
  Future<ApiCallResponse> call({
    String? pageNo = '',
    String? sortVal = '',
    String? noOfRow = '2000',
    String? filter = '',
    String? searchval = '',
    String? conn = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
"filter": {   
        "status":"${filter}",
"conn": "${conn}"
    }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Load Device Data Api ',
      apiUrl:
          '${baseUrl}api/tracking/load-device-data?page=${pageNo}&sort=${sortVal}&rows=2000&search=${searchval}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? total(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_''',
      ));
  int? moving(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.moving''',
      ));
  int? stopped(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.stopped''',
      ));
  int? idle(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.idle''',
      ));
}

class ChnagePaswordCall {
  Future<ApiCallResponse> call({
    String? oldPass = '',
    String? newPass = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "old_pass": "${oldPass}",
  "new_pass": "${newPass}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Chnage Pasword ',
      apiUrl: '${baseUrl}api/user/change-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeneralInformationCall {
  Future<ApiCallResponse> call({
    String? imeis = '',
    String? dateTimeFrom = '',
    String? dateTimeTo = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "report_type": "general-info",
  "imeis": [
    "${imeis}"
  ],
  "data_items": [
    "route_start",
    "route_end",
    "route_length",
    "move_duration",
    "stop_duration",
    "stop_count",
    "top_speed",
    "avg_speed",
    "overspeed_count",
    "fuel_consumption",
    "avg_fuel_consumption",
    "fuel_cost",
    "engine_work",
    "engine_idle",
    "odometer",
    "engine_hours",
    "driver",
    "trailer",
    "time",
    "position",
    "speed",
    "altitude",
    "angle"
  ],
  "dt_from": "${dateTimeFrom}",
  "dt_to": "${dateTimeTo}",
  "speed_limit": 30,
  "stop_duration": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'General Information ',
      apiUrl: '${baseUrl}api/reports',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CommandListApiCall {
  Future<ApiCallResponse> call({
    int? pageNo = 1,
    String? noOfRows = '20',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Command List Api',
      apiUrl:
          '${baseUrl}api/device-commands?page=${pageNo}&rows=${noOfRows}&sort=-cmd_id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDevicesListCall {
  Future<ApiCallResponse> call({
    String? pageNo = '',
    String? noOfRows = '',
    String? sortVal = '',
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Devices List',
      apiUrl:
          '${baseUrl}api/cpanel/device?page=${pageNo}&rows=${noOfRows}&sort=${sortVal}&search=${searchVal}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDeviceTripListCall {
  Future<ApiCallResponse> call({
    String? pageNo = '',
    String? noOfRows = '',
    String? sortVal = '',
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Trip List',
      apiUrl: '${baseUrl}api/trip-manager/trip?page=1&rows=100&sort=name',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostTripDeviceCall {
  Future<ApiCallResponse> call({
    String? device = '',
    String? imei = '',
    String? buyer = '',
    String? seller = '',
    String? transportNameAndNo = '',
    String? vehicleNo = '',
    String? driverName = '',
    String? driverMobileNo = '',
    String? licenceNo = '',
    String? lrNo = '',
    String? doNo = '',
    String? loadingPoint = '',
    String? cargo = '',
    int? weight,
    dynamic unloadingPointsJson,
    int? distance,
    String? estimatedTime = '',
    List<String>? customersList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final customers = _serializeList(customersList);
    final unloadingPoints = _serializeJson(unloadingPointsJson, true);
    final ffApiRequestBody = '''
{
  "device": "${escapeStringForJson(device)}",
  "imei": "${escapeStringForJson(imei)}",
  "buyer": "${escapeStringForJson(buyer)}",
  "seller": "${escapeStringForJson(seller)}",
  "transport_name_and_no": "${escapeStringForJson(transportNameAndNo)}",
  "vehicle_no": "${escapeStringForJson(vehicleNo)}",
  "driver_name": "${escapeStringForJson(driverName)}",
  "customers": ${customers},
  "driver_mobile_no": "${escapeStringForJson(driverMobileNo)}",
  "licence_no": "${escapeStringForJson(licenceNo)}",
  "lr_no": "${escapeStringForJson(lrNo)}",
  "do_no": "${escapeStringForJson(doNo)}",
  "loading_point": "${escapeStringForJson(loadingPoint)}",
  "cargo": "${escapeStringForJson(cargo)}",
  "weight": ${weight},
  "unloading_points":${unloadingPoints}, 
  "distance": ${distance},
  "estimated_time": "${escapeStringForJson(estimatedTime)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Trip Device',
      apiUrl: '${baseUrl}api/trip-manager/trip',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PatchTripDeviceCall {
  Future<ApiCallResponse> call({
    String? device = '',
    String? imei = '',
    String? buyer = '',
    String? seller = '',
    String? transportNameAndNo = '',
    String? vehicleNo = '',
    String? driverName = '',
    String? driverMobileNo = '',
    String? licenceNo = '',
    String? lrNo = '',
    String? doNo = '',
    String? loadingPoint = '',
    String? cargo = '',
    int? weight,
    String? unloadingPointsUnloadingPoint = '',
    String? unloadingPointsInvoiceNo = '',
    int? distance,
    String? estimatedTime = '',
    String? tripID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
    "device": "${escapeStringForJson(device)}",
    "imei": "${escapeStringForJson(imei)}",
    "buyer": "${escapeStringForJson(buyer)}",
    "seller": "${escapeStringForJson(seller)}",
    "transport_name_and_no": "${escapeStringForJson(transportNameAndNo)}",
    "vehicle_no": "${escapeStringForJson(vehicleNo)}",
    "driver_name": "${escapeStringForJson(driverName)}",
    "driver_mobile_no": "${escapeStringForJson(driverMobileNo)}",
    "licence_no": "${escapeStringForJson(licenceNo)}",
    "lr_no": "${escapeStringForJson(lrNo)}",
    "do_no": "${escapeStringForJson(doNo)}",
    "loading_point": "${escapeStringForJson(loadingPoint)}",
    "cargo": "${escapeStringForJson(cargo)}",
    "weight": ${weight},
    "unloading_points": [
        {
            "unloading_point": "${escapeStringForJson(unloadingPointsUnloadingPoint)}",
            "invoice_no": "${escapeStringForJson(unloadingPointsInvoiceNo)}"
        }        ],
    "distance": ${distance},
    "estimated_time": "${escapeStringForJson(estimatedTime)}" 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Patch Trip Device ',
      apiUrl: '${baseUrl}api/trip-manager/trip/${tripID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MarkerListApiCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Marker List Api',
      apiUrl: '${baseUrl}api/user/places/marker',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTripListCall {
  Future<ApiCallResponse> call({
    String? deleteTrip = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Trip List',
      apiUrl: '${baseUrl}api/trip-manager/trip/${deleteTrip}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LockSealApiCall {
  Future<ApiCallResponse> call({
    String? barCodeId = '',
    String? tripId = '',
    List<FFUploadedFile>? imagesList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final images = imagesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'Lock Seal Api',
      apiUrl: '${baseUrl}api/trip-manager/seal/lock',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'bar_code_id': barCodeId,
        'trip_id': tripId,
        'images': images,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UnlockSealListCall {
  Future<ApiCallResponse> call({
    String? barCodeId = '',
    String? tripId = '',
    List<FFUploadedFile>? imagesList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final images = imagesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'Unlock Seal List',
      apiUrl: '${baseUrl}api/trip-manager/seal/unlock',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'bar_code_id': barCodeId,
        'trip_id': tripId,
        'images': images,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MarkerListCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Marker  List',
      apiUrl: '${baseUrl}api/user/places/marker',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddMarkerCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? desc = '',
    String? icon = '',
    bool? visible,
    String? lat = '',
    String? lng = '',
    String? radius = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "desc": "${escapeStringForJson(desc)}",
  "icon": "${escapeStringForJson(icon)}",
  "visible": ${visible},
  "lat": "${escapeStringForJson(lat)}",
  "lng": "${escapeStringForJson(lng)}",
  "radius": "${escapeStringForJson(radius)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Marker',
      apiUrl: '${baseUrl}api/user/places/marker',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditMarkerCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? desc = '',
    String? icon = '',
    bool? visible,
    String? lat = '',
    String? lng = '',
    String? radius = '',
    String? markerId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "desc": "${escapeStringForJson(desc)}",
  "icon": "${escapeStringForJson(icon)}",
  "visible": ${visible},
  "lat": "${escapeStringForJson(lat)}",
  "lng": "${escapeStringForJson(lng)}",
  "radius": "${escapeStringForJson(radius)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Marker',
      apiUrl: '${baseUrl}api/user/places/marker/${markerId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteMarkerListApiCall {
  Future<ApiCallResponse> call({
    String? markerDeleteId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Marker List Api',
      apiUrl: '${baseUrl}api/user/places/marker/${markerDeleteId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SingleMarkerListCall {
  Future<ApiCallResponse> call({
    String? getMarkerID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Single Marker List',
      apiUrl: '${baseUrl}api/user/places/marker/${getMarkerID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TripDashboardCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Trip Dashboard',
      apiUrl: '${baseUrl}api/trip-manager/trip/dashboard/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TripTrackingCall {
  Future<ApiCallResponse> call({
    String? tripId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Trip Tracking',
      apiUrl: '${baseUrl}api/trip-manager/trip/track/${tripId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllTripTrackingCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Trip Tracking',
      apiUrl: '${baseUrl}api/trip-manager/trip/track/all',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StartTripPostAPICall {
  Future<ApiCallResponse> call({
    String? tripId = '',
    String? startDate = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "start": "${escapeStringForJson(startDate)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Start Trip Post API',
      apiUrl: '${baseUrl}api/trip-manager/trip/${tripId}/start',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EndTripPOSTAPICall {
  Future<ApiCallResponse> call({
    String? tripId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'End Trip POST API',
      apiUrl: '${baseUrl}/api/trip-manager/trip/${tripId}/end',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TripLoginApiCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "username": "${escapeStringForJson(username)}",
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Trip Login Api',
      apiUrl: '${baseUrl}api/auth/trip-login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UtilMarkerListCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Util Marker List',
      apiUrl: '${baseUrl}api/utils/marker-list?search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportExcelCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Report Excel',
      apiUrl: '${baseUrl}api/trip-manager/trip/report/excel',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TripHistoryCall {
  Future<ApiCallResponse> call({
    String? tripId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Trip History',
      apiUrl: '${baseUrl}api/trip-manager/trip/history/${tripId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeneratedEventsGetApiCall {
  Future<ApiCallResponse> call({
    int? pageNo,
    String? noOfRows = '20',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Generated Events Get Api',
      apiUrl: '${baseUrl}/api/user/event?page=${pageNo}&rows=${noOfRows}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSubUserCall {
  Future<ApiCallResponse> call({
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Sub User',
      apiUrl: '${baseUrl}api/hierarchy/get-sub-users?search=${searchVal}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateSubUserTokenCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Generate Sub User Token',
      apiUrl: '${baseUrl}api/hierarchy/get-token/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventApiCall {
  Future<ApiCallResponse> call({
    int? pageNo = 1,
    String? noRow = '20',
    String? imei = '',
    String? startDate = '',
    String? endDate = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Event Api',
      apiUrl:
          '${baseUrl}api/user/event/last?page=${pageNo}&rows=${noRow}&imei=${imei}&start=${startDate}&end=${endDate}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllEventListApiCall {
  Future<ApiCallResponse> call({
    int? pageNo = 1,
    String? noRow = '20',
    String? startDate = '',
    String? endDate = '',
    String? imei = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'All Event List Api',
      apiUrl:
          '${baseUrl}api/user/event/last?page=${pageNo}&rows=${noRow}&start=${startDate}&end=${endDate}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DriversGetApiCall {
  Future<ApiCallResponse> call({
    int? pageNo,
    String? noOfRows = '',
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Drivers Get Api',
      apiUrl:
          '${baseUrl}api/user/settings/driver?page=${pageNo}&rows=${noOfRows}&search=${searchVal}&sort=name&search-field=all&search-value=john',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSelfCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Self',
      apiUrl: '${baseUrl}api/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubUsersGetApiCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Sub Users Get Api',
      apiUrl: '${baseUrl}api/user/sub-user?page=1&rows=100&sort=username',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddDeviceApiCall {
  Future<ApiCallResponse> call({
    bool? active = true,
    String? coins = '1',
    String? name = '',
    String? imei = '',
    String? simNumber = '',
    String? vin = '',
    String? plateNumber = '',
    String? model = '',
    String? vehicleType = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
    "active": ${active},
    "coins": "${escapeStringForJson(coins)}",
    "name": "${escapeStringForJson(name)}",
    "imei": "${escapeStringForJson(imei)}",
    "sim_number": "${escapeStringForJson(simNumber)}",
    "vin": "${escapeStringForJson(vin)}",
    "plate_number": "${escapeStringForJson(plateNumber)}",
    "model":  "${escapeStringForJson(model)}",
   "vehicle_type": "${escapeStringForJson(vehicleType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Device Api',
      apiUrl: '${baseUrl}api/device',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DashboardUserApiCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Dashboard User Api',
      apiUrl: '${baseUrl}api/dashboard/user',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeoFenceListApiCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Geo Fence List Api ',
      apiUrl: '${baseUrl}api/user/places/zone?rows=1000&search=${search}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddGeofenceListPolygonCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? color = '',
    String? area = '',
    String? shape = '',
    String? group = '',
    dynamic verticesJson,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final vertices = _serializeJson(verticesJson, true);
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "color": "${escapeStringForJson(color)}",
  "area": "${escapeStringForJson(area)}",
  "group": "${escapeStringForJson(group)}",
  "shape": "${escapeStringForJson(shape)}",
  "vertices": ${vertices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Geofence List  polygon',
      apiUrl: '${baseUrl}api/user/places/zone',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddGeofenceListCircleCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? color = '',
    bool? visible,
    bool? nameVisible,
    String? area = '',
    String? shape = '',
    double? radius,
    double? originLat,
    double? originLng,
    String? group = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "color": "${escapeStringForJson(color)}",
  "visible": ${visible},
  "nameVisible": ${nameVisible},
  "area": "${escapeStringForJson(area)}",
  "group": "${escapeStringForJson(group)}",
  "shape": "${escapeStringForJson(shape)}",
  "origin": {
    "lat": "${originLat}",
    "lng": "${originLng}"
  },
  "radius": "${radius}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Geofence List  circle',
      apiUrl: '${baseUrl}api/user/places/zone',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditGeofenceApiCircleCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? color = '',
    String? geofenceID = '',
    String? radius = '',
    String? shape = '',
    String? group = '',
    double? originLat,
    double? originLng,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "color": "${escapeStringForJson(color)}",
  "group":"${escapeStringForJson(group)}",
  "shape":"${escapeStringForJson(shape)}" ,
  "radius": "${escapeStringForJson(radius)}",
  "origin": {
    "lat": "${originLat}",
    "lng": "${originLng}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Geofence Api circle',
      apiUrl: '${baseUrl}api/user/places/zone/${geofenceID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditGeofenceApiPolygonCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? color = '',
    String? geofenceID = '',
    String? shape = '',
    String? group = '',
    dynamic verticesJson,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final vertices = _serializeJson(verticesJson, true);
    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "color": "${escapeStringForJson(color)}",
  "area": "<area>",
  "group":"${escapeStringForJson(group)}",
  "shape":"${escapeStringForJson(shape)}" ,
  "radius": "<radius>",
  "origin": {
    "lat": "<origin_lat>",
    "lng": "<origin_lng>"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit Geofence Api  polygon',
      apiUrl: '${baseUrl}api/user/places/zone/${geofenceID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeofenceFillFormDataCall {
  Future<ApiCallResponse> call({
    String? geofenceID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Geofence Fill Form Data',
      apiUrl: '${baseUrl}api/user/places/zone/${geofenceID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteGeofenceApiCall {
  Future<ApiCallResponse> call({
    String? geofenceId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Geofence Api',
      apiUrl: '${baseUrl}api/user/places/zone/${geofenceId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class POIListScreenCall {
  Future<ApiCallResponse> call({
    String? searchValue = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'POI List Screen',
      apiUrl:
          '${baseUrl}api/user/places/marker?&rows=1000&search=${searchValue}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPOIScreenCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? desc = 'desc',
    String? icon = 'home',
    bool? visible,
    String? lat = '',
    String? lng = '',
    String? radius = '1',
    String? colour = '',
    FFUploadedFile? image,
    String? group = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Add POI Screen',
      apiUrl: '${baseUrl}api/user/places/marker',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'name': name,
        'desc': desc,
        'icon': icon,
        'visible': visible,
        'lat': lat,
        'lng': lng,
        'radius': radius,
        'colour': colour,
        'image': image,
        'group': group,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditPOIScreenCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? desc = '',
    String? icon = '',
    bool? visible,
    String? lat = '',
    String? lng = '',
    String? radius = '',
    String? markerID = '',
    String? colour = '',
    FFUploadedFile? image,
    String? group = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Edit  POI Screen',
      apiUrl: '${baseUrl}api/user/places/marker/${markerID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'name': name,
        'desc': desc,
        'icon': icon,
        'visible': visible,
        'lat': lat,
        'lng': lng,
        'radius': radius,
        'colour': colour,
        'image': image,
        'group': group,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MarkerFillDataCall {
  Future<ApiCallResponse> call({
    String? markerId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Marker Fill Data',
      apiUrl: '${baseUrl}api/user/places/marker/${markerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePOIScreenCall {
  Future<ApiCallResponse> call({
    String? deleteID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete POI Screen',
      apiUrl: '${baseUrl}api/user/places/marker/${deleteID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActivityDetailsAPiCall {
  Future<ApiCallResponse> call({
    String? reportType = '',
    String? imeis = '',
    String? dtFrom = '',
    String? dtTo = '',
    String? speedLimit = '',
    String? stopDuration = '',
    String? sensors = '',
    String? markers = '',
    String? dataItems = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
    "report_type": "general-info", 
    "imeis": "357544372396602",
    "dt_from": "2024-08-24T00:00:00Z",
    "dt_to": "2024-08-25T00:00:00Z",
    "speed_limit": 10,
    "stop_duration": 1,
    "sensors": "on",
    "markers": "653282be4e26be9aba05a7a1",
    "data_items":"angle"
    
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Activity Details APi',
      apiUrl: '${baseUrl}api/reports',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PlaybackAPICall {
  Future<ApiCallResponse> call({
    String? imei = '',
    String? dtf = '',
    String? dtt = '',
    String? minStopDuration = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
    "cmd": "load_route_data",
    "imei": "${escapeStringForJson(imei)}",
    "dtf": "${escapeStringForJson(dtf)}",
    "dtt": "${escapeStringForJson(dtt)}",
    "min_stop_duration": "${escapeStringForJson(minStopDuration)}" 
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Playback API ',
      apiUrl: '${baseUrl}api/device-history',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDeviceApiCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Device Api',
      apiUrl: '${baseUrl}api/device/required-data',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? username = '',
    String? email = '',
    String? countryCode = '',
    int? number,
    String? password = '',
    String? country = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "username": "${escapeStringForJson(username)}",
  "email": "${escapeStringForJson(email)}",
  "country": "${escapeStringForJson(country)}",
  "phone": {
    "country_code": "${escapeStringForJson(countryCode)}",
    "number": ${number}
  },
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignUpApi',
      apiUrl: '${baseUrl}api/public/user/register-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forget Password',
      apiUrl: '${baseUrl}api/public/user/forget-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OTPVerifyCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? otp = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "otp": "${escapeStringForJson(otp)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OTP Verify ',
      apiUrl: '${baseUrl}api/public/user/verify-otp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? newPassword = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(token)}",
  "newPassword": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${baseUrl}api/public/user/reset-password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroupsGetAPiCall {
  Future<ApiCallResponse> call({
    int? pageNo = 1,
    String? noOfRows = '10',
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Groups Get APi',
      apiUrl:
          '${baseUrl}api/user/settings/device-group?page=${pageNo}&rows=${noOfRows}&sort=name&search=${searchVal}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddGroupCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    List<String>? devicesList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final devices = _serializeList(devicesList);

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "description": "${escapeStringForJson(description)}",
  "devices": ${devices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Group',
      apiUrl: '${baseUrl}api/user/settings/device-group',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AttachDevicePostApiCall {
  Future<ApiCallResponse> call({
    String? imei = '',
    String? sim = '',
    String? plateNumber = '',
    String? vehicleType = '',
    String? manufacturer = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "imei": "${escapeStringForJson(imei)}",
  "sim": "${escapeStringForJson(sim)}",
  "plate_number": "${escapeStringForJson(plateNumber)}",
  "vehicle_type": "${escapeStringForJson(vehicleType)}",
  "manufacturer": "${escapeStringForJson(manufacturer)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Attach Device Post Api',
      apiUrl: '${baseUrl}api/user/attach-device',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditGroupCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = '',
    List<String>? devicesList,
    String? groupid = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final devices = _serializeList(devicesList);

    final ffApiRequestBody = '''
{ "name": "${escapeStringForJson(name)}",
  "description": "${escapeStringForJson(description)}",
  "devices": ${devices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Edit  Group',
      apiUrl: '${baseUrl}api/user/settings/device-group/${groupid}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteGroupCall {
  Future<ApiCallResponse> call({
    String? groupid = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Group',
      apiUrl: '${baseUrl}api/user/settings/device-group/${groupid}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SubUserListApiResponseCall {
  Future<ApiCallResponse> call({
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SUB USER LIST API RESPONSE',
      apiUrl:
          '${baseUrl}api/user/sub-user?page=1&rows=100&sort=username&search=${searchVal}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddSubUserListCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? nameLast = '',
    String? email = '',
    String? phone = '',
    String? addressCity = '',
    String? addressState = '',
    List<String>? eventTemplatesList,
    List<String>? devicesList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final eventTemplates = _serializeList(eventTemplatesList);
    final devices = _serializeList(devicesList);

    final ffApiRequestBody = '''
{
  "name": {
    "first": "${escapeStringForJson(name)}",
    "last": "${escapeStringForJson(nameLast)}"
  },
  "email": "${escapeStringForJson(email)}",
  "phone": {
    "number": "${escapeStringForJson(phone)}"
  },
  "address": {
    "city": "${escapeStringForJson(addressCity)}",
    "state": "${escapeStringForJson(addressState)}"
  },
  "event_templates": ${eventTemplates},
  "devices": ${devices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Sub User List',
      apiUrl: '${baseUrl}api/user/sub-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EventTemplatesListCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Event Templates List',
      apiUrl: '${baseUrl}api/template/event',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSubUserListCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Sub User List',
      apiUrl: '${baseUrl}api/user/sub-user/${username}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddCommandCall {
  Future<ApiCallResponse> call({
    String? imeis = '',
    String? cmd = '',
    String? name = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "imeis": "${escapeStringForJson(imeis)}",
  "cmd": "${escapeStringForJson(cmd)}",
  "name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Command',
      apiUrl: '${baseUrl}api/device-commands',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateDriverCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? driverImg,
    String? name = '',
    String? phone = '',
    String? email = '',
    String? joiningDate = '',
    String? icNo = '',
    FFUploadedFile? icNoImg,
    bool? status,
    String? licenseClass = '',
    String? licenseExpiryDate = '',
    String? vehicleAssigned = '',
    FFUploadedFile? licenseImg,
    String? assignId = '',
    String? address = '',
    String? desc = '',
    String? imei = '',
    String? driverID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Update Driver',
      apiUrl: '${baseUrl}api/user/settings/driver/${driverID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'driver_img': driverImg,
        'name': name,
        'phone': phone,
        'email': email,
        'joining_date': joiningDate,
        'ic_no': icNo,
        'ic_no_img': icNoImg,
        'status': status,
        'license_class': licenseClass,
        'license_expiry_date': licenseExpiryDate,
        'vehicle_assigned': vehicleAssigned,
        'license_img': licenseImg,
        'assign_id': assignId,
        'address': address,
        'desc': address,
        'imei': imei,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddDriverCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? driverImg,
    String? name = '',
    String? phone = '',
    String? email = '',
    String? joiningDate = '',
    String? icNo = '',
    FFUploadedFile? icNoImg,
    bool? status,
    String? licenseClass = '',
    String? licenseExpiryDate = '',
    String? vehicleAssigned = '',
    FFUploadedFile? licenseImg,
    String? assignId = '',
    String? address = '',
    String? desc = '',
    String? imei = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Add Driver ',
      apiUrl: '${baseUrl}api/user/settings/driver',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'driver_img': driverImg,
        'name': name,
        'phone': phone,
        'email': email,
        'joining_date': joiningDate,
        'ic_no': icNo,
        'ic_no_img': icNoImg,
        'status': status,
        'license_class': licenseClass,
        'license_expiry_date': licenseExpiryDate,
        'vehicle_assigned': vehicleAssigned,
        'license_img': licenseImg,
        'assign_id': assignId,
        'address': address,
        'desc': address,
        'imei': imei,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteDriverCall {
  Future<ApiCallResponse> call({
    String? deleteDriverID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Driver',
      apiUrl: '${baseUrl}api/user/settings/driver/${deleteDriverID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GroupGetAPICall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Group Get API',
      apiUrl: '${baseUrl}api/user/places/group?page=1&rows=10&sort=name',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddGroupApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = 'test',
    List<String>? devicesList,
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final devices = _serializeList(devicesList);

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "description": "",
  "devices": ${devices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Group Api ',
      apiUrl: '${baseUrl}api/user/settings/device-group',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateGroupApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? description = 'test',
    List<String>? devicesList,
    String? grouID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );
    final devices = _serializeList(devicesList);

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "description": "",
  "devices": ${devices}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Group Api',
      apiUrl: '${baseUrl}api/user/settings/device-group/${grouID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteGroupAPiCall {
  Future<ApiCallResponse> call({
    String? deleteGroupID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Group APi',
      apiUrl: '${baseUrl}api/user/settings/device-group/${deleteGroupID}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteDeviceListCall {
  Future<ApiCallResponse> call({
    String? deleteImei = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Device List',
      apiUrl: '${baseUrl}api/device/${deleteImei}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DevicdEditApiCall {
  Future<ApiCallResponse> call({
    bool? active = true,
    String? coins = '',
    String? name = '',
    String? imei = '',
    String? simNumber = '',
    String? vin = '',
    String? plateNumber = '',
    String? model = '',
    String? deviceID = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "active": ${active},
  "coins": "${escapeStringForJson(coins)}",
  "name": "${escapeStringForJson(name)}",
  "imei": "${escapeStringForJson(imei)}",
  "sim_number": "${escapeStringForJson(simNumber)}",
  "vin": "${escapeStringForJson(vin)}",
  "plate_number": "${escapeStringForJson(plateNumber)}",
  "model": "${escapeStringForJson(model)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Devicd Edit Api',
      apiUrl: '${baseUrl}api/device/${deviceID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeviceFillDataCall {
  Future<ApiCallResponse> call({
    String? deviceImei = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Device Fill Data',
      apiUrl: '${baseUrl}api/device/${deviceImei}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeviceShareApiCall {
  Future<ApiCallResponse> call({
    String? imei = '',
    String? duration = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "imei": "${escapeStringForJson(imei)}",
  "duration": "${escapeStringForJson(duration)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Device Share Api',
      apiUrl: '${baseUrl}api/device/share',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportPDFApiCall {
  Future<ApiCallResponse> call({
    String? reportType = '',
    String? imeis = '',
    String? dtFrom = '',
    String? dtTo = '',
    int? speedLimit,
    int? stopDuration,
    String? sensors = '',
    String? dataItems = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "report_type": "${escapeStringForJson(reportType)}",
  "imeis": [
    "${escapeStringForJson(imeis)}"
  ],
  "dt_from": "${escapeStringForJson(dtFrom)}",
  "dt_to": "${escapeStringForJson(dtTo)}",
  "speed_limit": ${speedLimit},
  "stop_duration": ${stopDuration},
  "sensors": [
    "Air Con",
    "Battery Status",
    "Battery Voltage",
    "Device Battery",
    "Door",
    "Door Sensor",
    "Electricity",
    "Engine",
    "Engine Status",
    "External Battery",
    "Fuel Level",
    "Generator",
    "GPS Level",
    "GPS Signal",
    "GSM Level",
    "Ignition",
    "Internal Battery Voltage"
  ],
  "data_items": [
    "status",
    "start",
    "end",
    "duration",
    "route_start",
    "route_end",
    "route_length",
    "move_duration",
    "stop_duration",
    "stop_count",
    "top_speed",
    "avg_speed",
    "overspeed_count",
    "fuel_consumption",
    "avg_fuel_consumption",
    "fuel_cost",
    "engine_work",
    "engine_idle",
    "odometer",
    "engine_hours",
    "driver",
    "trailer",
    "time",
    "position",
    "speed",
    "altitude",
    "angle"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Report PDF Api',
      apiUrl: '${baseUrl}api/reports/pdf',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportApiCall {
  Future<ApiCallResponse> call({
    String? reportType = '',
    String? imei = '',
    String? dtFrom = '',
    String? dtTo = '',
    String? speedLimit = '',
    String? stopDuration = '',
    String? sensors = '',
    String? dataItems = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "report_type": "${escapeStringForJson(reportType)}",
  "imeis": 
    "${escapeStringForJson(imei)}",
  "dt_from": "${escapeStringForJson(dtFrom)}",
  "dt_to": "${escapeStringForJson(dtTo)}",
  "speed_limit": ${escapeStringForJson(speedLimit)},
  "stop_duration": ${escapeStringForJson(stopDuration)},
  "sensors": [
    "Air Con",
    "Battery Status",
    "Battery Voltage",
    "Device Battery",
    "Door",
    "Door Sensor",
    "Electricity",
    "Engine",
    "Engine Status",
    "External Battery",
    "Fuel Level",
    "Generator",
    "GPS Level",
    "GPS Signal",
    "GSM Level",
    "Ignition",
    "Internal Battery Voltage"
  ],
  "data_items": [
    "status",
    "start",
    "end",
    "duration",
    "route_start",
    "route_end",
    "route_length",
    "move_duration",
    "stop_duration",
    "stop_count",
    "top_speed",
    "avg_speed",
    "overspeed_count",
    "fuel_consumption",
    "avg_fuel_consumption",
    "fuel_cost",
    "engine_work",
    "engine_idle",
    "odometer",
    "engine_hours",
    "driver",
    "trailer",
    "time",
    "position",
    "speed",
    "altitude",
    "angle"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Report Api',
      apiUrl: '${baseUrl}api/reports',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DriverGetApisCall {
  Future<ApiCallResponse> call({
    String? driverId = '',
    String? jwt = '',
  }) async {
    final baseUrl = NewSpeedotrackJSApiGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Driver Get Apis',
      apiUrl: '${baseUrl}api/user/settings/driver/${driverId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End New Speedotrack JS Api  Group Code

/// Start SpeedoTrack Seals Group Code

class SpeedoTrackSealsGroup {
  static String getBaseUrl({
    String? jwt = '',
  }) =>
      'https://gps.speedotrack.com/';
  static Map<String, String> headers = {
    'Authorization': '[jwt]',
  };
  static GetSealApiCall getSealApiCall = GetSealApiCall();
  static PostSealApiCall postSealApiCall = PostSealApiCall();
  static PatchSealApiCall patchSealApiCall = PatchSealApiCall();
  static DeleteSealApiCall deleteSealApiCall = DeleteSealApiCall();
  static PostBulkSealApiCall postBulkSealApiCall = PostBulkSealApiCall();
  static DeleteDevicesCall deleteDevicesCall = DeleteDevicesCall();
  static UpdateDeviceCall updateDeviceCall = UpdateDeviceCall();
  static GetUserApiCall getUserApiCall = GetUserApiCall();
  static PatchUserApiCall patchUserApiCall = PatchUserApiCall();
  static PostUserApiCall postUserApiCall = PostUserApiCall();
  static DeleteUserApiCall deleteUserApiCall = DeleteUserApiCall();
}

class GetSealApiCall {
  Future<ApiCallResponse> call({
    String? pageNo = '',
    String? noOfRows = '',
    String? sortVal = '',
    String? searchVal = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Seal Api',
      apiUrl:
          '${baseUrl}/api/trip-manager/seal?page=${pageNo}&rows=${noOfRows}&sort=${sortVal}&search=${searchVal}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostSealApiCall {
  Future<ApiCallResponse> call({
    String? barCodeId = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "bar_code_id": "${escapeStringForJson(barCodeId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Post Seal Api',
      apiUrl: '${baseUrl}/api/trip-manager/seal',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PatchSealApiCall {
  Future<ApiCallResponse> call({
    String? sealId = '',
    String? status = '',
    String? barCodeId = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "status": "${escapeStringForJson(status)}",
  "bar_code_id": "${escapeStringForJson(barCodeId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Patch Seal Api',
      apiUrl: '${baseUrl}/api/trip-manager/seal/${sealId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteSealApiCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Seal Api',
      apiUrl: '${baseUrl}/api/trip-manager/seal/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostBulkSealApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? seals,
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Post Bulk Seal Api',
      apiUrl: '${baseUrl}/api/trip-manager/seal/bulk',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {
        'seals': seals,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteDevicesCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete devices',
      apiUrl: '${baseUrl}/api/cpanel/device/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateDeviceCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? protocol = '',
    String? netProtocol = '',
    String? name = '',
    String? simNumber = '',
    String? imei = '',
    String? email = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "_id": "${escapeStringForJson(id)}",
  "protocol": "${escapeStringForJson(protocol)}",
  "net_protocol": "${escapeStringForJson(netProtocol)}",
  "name": "${escapeStringForJson(name)}",
  "sim_number": "${escapeStringForJson(simNumber)}",
  "imei": "${escapeStringForJson(imei)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update Device ',
      apiUrl: '${baseUrl}/api/cpanel/device/${id}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserApiCall {
  Future<ApiCallResponse> call({
    int? pageNo,
    String? searchVal = '',
    String? sortVal = '',
    String? noOfRows = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get user api',
      apiUrl: '${baseUrl}api/trip-manager/user?page=1&rows=100&sort=-createdAt',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PatchUserApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? password = '',
    String? company = '',
    String? state = '',
    String? contact = '',
    String? email = '',
    String? address = '',
    String? userID = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "password": "${escapeStringForJson(password)}",
  "company": "${escapeStringForJson(company)}",
  "state": "${escapeStringForJson(state)}",
  "contact": "${escapeStringForJson(contact)}",
  "email": "${escapeStringForJson(email)}",
  "address": "${escapeStringForJson(address)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Patch user api',
      apiUrl: '${baseUrl}/api/trip-manager/user/${userID}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostUserApiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? password = '',
    String? company = '',
    String? state = '',
    String? contact = '',
    String? email = '',
    String? address = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",
  "password": "${escapeStringForJson(password)}",
  "company": "${escapeStringForJson(company)}",
  "state": "${escapeStringForJson(state)}",
  "contact": "${escapeStringForJson(contact)}",
  "email": "${escapeStringForJson(email)}",
  "address": "${escapeStringForJson(address)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'post user api ',
      apiUrl: '${baseUrl}/api/trip-manager/user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserApiCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? jwt = '',
  }) async {
    final baseUrl = SpeedoTrackSealsGroup.getBaseUrl(
      jwt: jwt,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'delete user api',
      apiUrl: '${baseUrl}/api/trip-manager/user/${id}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': '${jwt}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SpeedoTrack Seals Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
