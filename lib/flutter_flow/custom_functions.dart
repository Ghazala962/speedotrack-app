import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

List<LatLng>? returnLatLngArray(
  List<String> latArray,
  List<String> lngArray,
) {
  List<LatLng> latLngList = [];

  // Ensure both lists have the same length
  if (latArray.length == lngArray.length) {
    // Iterate over the lists and combine latitude and longitude
    for (int i = 0; i < latArray.length; i++) {
      double lat = double.tryParse(latArray[i]) ?? 0.0;
      double lng = double.tryParse(lngArray[i]) ?? 0.0;

      latLngList.add(LatLng(lat, lng));
    }
  }

  return latLngList;
}

LatLng? returnLatLngDataType(
  String? lat,
  String? lng,
) {
  // return LatLng data type
  if (lat != null && lng != null) {
    final latitude = double.tryParse(lat);
    final longitude = double.tryParse(lng);
    if (latitude != null && longitude != null) {
      return LatLng(latitude, longitude);
    }
  }
  return null;
}

List<dynamic> returnFilteredDeviceListOnStatus(
  String? filterStatus,
  List<dynamic> deviceList,
  String? searchValue,
) {
  if (filterStatus == 'All') {
    if (searchValue == null || searchValue == '') {
      return deviceList;
    } else {
      return deviceList
          .where((device) => device['name'].contains(searchValue))
          .toList();
    }
  } else {
    if (filterStatus == 'Moving') {
      return deviceList
          .where((device) => device['status'] == 'Moving')
          .toList();
    } else if (filterStatus == 'Stopped') {
      return deviceList
          .where((device) => device['status'] == 'Stopped')
          .toList();
    } else if (filterStatus == 'Engine Idle') {
      return deviceList
          .where((device) => device['status'] == 'Engine Idle')
          .toList();
    } else if (filterStatus == 'Offline') {
      return deviceList
          .where((device) => device['status'] == 'Offline')
          .toList();
    } else {
      return deviceList;
    }
  }
}

String? getTommorowDate() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(tomorrow);
}

String? getCurrentDate() {
  DateTime now = DateTime.now();
  DateTime today = DateTime(now.year, now.month, now.day);
  String formattedDate = DateFormat('yyyy-MM-dd 00:00:00').format(today);
  return formattedDate;
}

List<dynamic>? returnFilteredEventsDevices(
  String deviceImei,
  List<dynamic> eventsList,
) {
  final filteredEvents =
      eventsList.where((event) => event[2] == deviceImei).toList();
  return filteredEvents;
}

String? returnUnlockCommand(String? deviceModelCommand) {
  if (deviceModelCommand == null) {
    return null;
  }
  final List<String> commands = deviceModelCommand.split('@');
  if (commands.length != 2) {
    return null;
  }

  List<String> letters = commands[1].split('');

  for (int i = 0; i < letters.length; i++) {
    if (letters[i] == '#') {
      letters[i] = "%23";
    }
  }

  return letters.join();
}

List<dynamic> findSpecficVehicleWithImei(
  dynamic allDeviceList,
  String vehicleImeiToFind,
) {
  return allDeviceList
      .where((device) => device['imei'] == vehicleImeiToFind)
      .toList();
}

String convertArrayToString(List<String> selectedDeviceList) {
  return selectedDeviceList.join(',');
}

String returnTommorowDate() {
  // return tommorow date as string
  final now = DateTime.now();
  final tomorrow = now.add(Duration(days: 1));
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(tomorrow);
}

String? returnCurrentDate() {
  // return date of today as string
  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(now);
}

String? returnYesterdayDate() {
  // return date of yesterday as string
  final now = DateTime.now();
  final yesterday = now.subtract(Duration(days: 1));
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(yesterday);
}

String? returnTwoDaysBefore() {
  // return date of two days before as string
  final now = DateTime.now();
  final twoDaysBefore = now.subtract(Duration(days: 2));
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(twoDaysBefore);
}

String? returnThisWeek() {
  // return the starting date of this week as string
  final now = DateTime.now();
  final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(startOfWeek);
}

List<dynamic>? returnFilteredDeviceList(
  String? filterStatus,
  List<dynamic> deviceList,
  String? searchValue,
) {
  List<dynamic> filteredList = [];

  // Priority map: Lower number = higher priority
  final statusPriority = {
    'Moving': 0,
    'Engine idle': 1,
    'Stopped': 2,
    'Offline': 3,
  };

  if (searchValue != null && searchValue.isNotEmpty) {
    String lowerSearch = searchValue.toLowerCase();

    for (var category in deviceList) {
      var matchingDevices = category['devices'].where((device) {
        String imei = device['imei'].toString().toLowerCase();
        String name = device['name'].toString().toLowerCase();
        return imei.contains(lowerSearch) || name.contains(lowerSearch);
      }).toList();

      // Sort the matching devices by status priority
      matchingDevices.sort((a, b) => (statusPriority[a['status']] ?? 99)
          .compareTo(statusPriority[b['status']] ?? 99));

      if (matchingDevices.isNotEmpty) {
        filteredList.add({...category, 'devices': matchingDevices});
      }
    }
    return filteredList;
  }

  for (var category in deviceList) {
    List<dynamic> filteredVehicles = [];

    if (filterStatus == 'all') {
      filteredVehicles = category['devices'];
    } else {
      filteredVehicles = category['devices'].where((vehicle) {
        if (filterStatus == 'moving') return vehicle['status'] == 'Moving';
        if (filterStatus == 'stopped') return vehicle['status'] == 'Stopped';
        if (filterStatus == 'offline') return vehicle['status'] == 'Offline';
        if (filterStatus == 'engine-idle')
          return vehicle['status'] == 'Engine idle';
        return false;
      }).toList();
    }

    // Sort filtered vehicles by status priority
    filteredVehicles.sort((a, b) => (statusPriority[a['status']] ?? 99)
        .compareTo(statusPriority[b['status']] ?? 99));

    if (filteredVehicles.isNotEmpty) {
      filteredList.add({...category, 'devices': filteredVehicles});
    }
  }

  return filteredList;
}

String? returnLastWeek() {
  // retur first date of last week as string
  final now = DateTime.now();
  final lastWeek = now.subtract(Duration(days: 7));
  final firstDateOfLastWeek =
      lastWeek.subtract(Duration(days: lastWeek.weekday - 1));
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(firstDateOfLastWeek);
}

String? returnThisMonth() {
  // return first date of this month as string
  DateTime now = DateTime.now();
  DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
  String formattedDate =
      DateFormat('yyyy-MM-dd 00:00:00').format(firstDayOfMonth);
  return formattedDate;
}

String? returnLastMonth() {
  // return first date ofa lasta month as string
  final now = DateTime.now();
  final lastMonth = DateTime(now.year, now.month - 1, 1);
  final formatter = DateFormat('yyyy-MM-dd 00:00:00');
  return formatter.format(lastMonth);
}

String? returnLockCommand(String? deviceModelCommand) {
  if (deviceModelCommand == null) {
    return null;
  }
  final List<String> commands = deviceModelCommand.split('@');
  if (commands.length != 2) {
    return null;
  }

  List<String> letters = commands[0].split('');

  for (int i = 0; i < letters.length; i++) {
    if (letters[i] == '#') {
      letters[i] = "%23";
    }
  }

  return letters.join();
}

String vechileImage(
  String? status,
  int? vechileId,
) {
  /// vechileIs = 1 => Car
  /// vechileIs = 2 => Truck
  /// vechileIs = 3 => Bike

  if (vechileId == 1) {
    if (status == "Moving") {
      return "assets/images/car_g.png";
    } else if (status == "Stopped") {
      return "assets/images/car_r.png";
    } else {
      return "assets/images/car_y.png";
    }
  } else if (vechileId == 2) {
    if (status == "Moving") {
      return "assets/images/truck_g.png";
    } else if (status == "Stopped") {
      return "assets/images/truck_r.png";
    } else {
      return "assets/images/truck_y.png";
    }
  } else {
    if (status == "Moving") {
      return "assets/images/bike_g.png";
    } else if (status == "Stopped") {
      return "assets/images/bike_r.png";
    } else {
      return "assets/images/bike_y.png";
    }
  }
}

bool containsAtSymbol(String command) {
  // return true if the string contains @
  bool containsAtSymbol = command.contains('@');
  return containsAtSymbol;
}

String returnGoogleMapTile(
  String zoomLevel,
  String latValue,
  String lonValue,
) {
  double latitude = double.parse(latValue);
  double longitude = double.parse(lonValue);

  final int fixedZoomLevel = int.parse(zoomLevel); // Use provided zoom level

  // Error handling (optional)
  if (fixedZoomLevel < 0 ||
      fixedZoomLevel > 21 ||
      latitude < -90 ||
      latitude > 90 ||
      longitude < -180 ||
      longitude > 180) {
    return "Invalid input values";
  }

  final tileX =
      (longitude + 180.0) / 360.0 * math.pow(2.0, fixedZoomLevel.floor());
  final tileY = (1 -
          math.log(math.tan(latitude * math.pi / 180.0) +
                  1 / math.cos(latitude * math.pi / 180.0)) /
              math.pi) /
      2.0 *
      math.pow(2.0, fixedZoomLevel.floor());

  // Construct the updated tile URL with {x}, {y}, {z} replaced
  final url =
      "https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i${fixedZoomLevel.floor()}!2i${tileX.floor()}!3i${tileY.floor()}!4i256!2m3!1e0!2sm!3i702451461!3m12!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!4e0!5m2!1e3!5f2";

  return url;
}

int retunArrayLength(List<dynamic> array) {
  // return the length of the list
  return array.length;
}

String? returnOsmTile(
  String latVal,
  String lonVal,
  String zoomVal,
) {
  final latRad = double.parse(latVal) * math.pi / 180;
  final n = math.pow(2.0, int.parse(zoomVal));
  final xTile = ((double.parse(lonVal) + 180.0) / 360.0 * n).floor();
  final yTile =
      ((1.0 - math.log(math.tan(latRad) + (1 / math.cos(latRad))) / math.pi) /
              2.0 *
              n)
          .floor();

  return "https://tile.openstreetmap.org/${zoomVal}/${xTile}/${yTile}.png";
//
}

String returnGoogleMapNavigateLink(
  String lat,
  String lng,
) {
  return "https://www.google.com/maps/search/?api=1&query=${lat},${lng}";
}

int returnTextLength(String textForLength) {
  // return length of the text
  return textForLength.length;
}

List<String>? seperateLockUnlockCommandFromStringCopy(
    String? deviceModelCommand) {
  if (deviceModelCommand == null) {
    return null;
  }
  final List<String> commands = deviceModelCommand.split('@');
  if (commands.length != 2) {
    return null;
  }
  return commands;
}

bool checkTextLength(int lengthOfTheText) {
  // return true if lenghtOfTheText is greater then 20
  return lengthOfTheText > 10;
}

List<dynamic> returnExpiringDevices(dynamic allDeviceListData) {
  // List to store the devices expiring within 7 days
  List<dynamic> expiringDevices = [];

  // Get the current date
  DateTime now = DateTime.now();

  // Iterate through all device data
  for (var device in allDeviceListData) {
    // Parse the expiration date from the device data
    DateTime expirationDate =
        DateFormat("yyyy-MM-dd").parse(device['object_expire_dt']);

    // Calculate the number of days between now and the expiration date
    int daysToExpire = expirationDate.difference(now).inDays;

    // Check if the device expires within the next 7 days (inclusive)
    if (daysToExpire >= 0 && daysToExpire <= 7) {
      expiringDevices.add(device);
    }
  }

  return expiringDevices;
}

String? userNameSmallLetter(String? usrname) {
  // write a funtion t take a word and make it all lower case and return
  if (usrname != null) {
    return usrname.toLowerCase();
  }
  return null;
}

bool checkIfTrue(String stringValue) {
  if (stringValue == 'true') {
    return true;
  } else {
    return false;
  }
}

dynamic returnDevicesList(List<dynamic> deviceList) {
  List<dynamic> newDeviceList = [];

  for (int i = 0; i < deviceList.length; i++) {
    for (int j = 0; j < deviceList[i]['devices'].length; j++) {
      newDeviceList.add(deviceList[i]['devices'][j]);
    }
  }

  print(newDeviceList);

  return newDeviceList;
}

List<dynamic> setMarkersList(dynamic markersList) {
  List<dynamic> markers = [];

  if (markersList is Map<String, dynamic>) {
    markersList.forEach((key, value) {
      if (value is List) {
        for (var item in value) {
          markers.add(item);
        }
      }
    });
  }

  return markers;
}

String returnFormattedDate(String date) {
  // take this date format - 2025-01-07T06:46:47.825Z and convert it in this format - 07 January 2025 06:46:47
  DateTime dateTime = DateTime.parse(date);
  String formattedDate = DateFormat('dd MMMM yyyy HH:mm:ss').format(dateTime);
  return formattedDate;
}

String findDeviceFromId(
  dynamic devicelist,
  String deviceId,
) {
  dynamic deviceImei =
      devicelist.filter((item) => item['_id'] == deviceId).toList()[0]['imei'];

  return deviceImei.toString();
}

List<dynamic> unloadingPoint(List<dynamic> unloadingPointRaw) {
  List<Map<String, String>> outputJson = [];

  for (var item in unloadingPointRaw) {
    var unloadingPointId = item['unloading_point']['_id'];
    var invoiceNo = item['invoice_no'];

    outputJson.add({
      'unloading_point': unloadingPointId,
      'invoice_no': invoiceNo,
    });
  }

  return outputJson;
}

int? returnPlusOne(int pageNumber) {
  int result = pageNumber + 1;
  return result;
}

bool checkLessThanThree(int length) {
  bool check = length >= 3 ? false : true;

  return check;
}

String? capitalizeFirstLetter(String? text) {
  String capitalizeFirstLetter(String? text) {
    if (text == null || text.isEmpty) return "";
    return text[0].toUpperCase() + text.substring(1);
  }
}

String? returnNextDay(DateTime? currentDate) {
// take the date and return next day in string format yyyy-mm-dd-00:00:00
  if (currentDate == null) {
    return '';
  }

  final nextDay = currentDate.add(Duration(days: 1));
  final formattedDate = DateFormat('yyyy-MM-dd').format(nextDay);

  return '$formattedDate 00:00:00';
}

List<dynamic> searchDevices(
  dynamic devicesList,
  String searchQuery,
) {
  if (searchQuery.isEmpty) {
    return devicesList;
  }

  String lowerCaseQuery = searchQuery.toLowerCase();
  List<dynamic> devices = devicesList.where((device) {
    var deviceData = device['device'];

    if (deviceData == null) return false;

    String imei = deviceData['imei']?.toLowerCase() ?? "";
    String name = deviceData['name']?.toLowerCase() ?? "";

    return imei.contains(lowerCaseQuery) || name.contains(lowerCaseQuery);
  }).toList();

  return devices;
}

String colorToString(Color colorVal) {
  // color to string
  return '#${colorVal.value.toRadixString(16).padLeft(8, '0')}';
}

Color stringToColor(String? colorString) {
  // create a function string to color
  // Convert a hex color string to a Color object
  if (colorString == null || colorString.isEmpty) {
    return Colors.grey; // or any default color
  }

  if (colorString.startsWith('#')) {
    colorString = colorString.substring(1);
  }

  if (colorString.length == 6) {
    colorString = 'FF' + colorString; // Add alpha value
  }

  try {
    int colorInt = int.parse(colorString, radix: 16);
    return Color(colorInt);
  } catch (e) {
    return Colors.grey; // fallback color on format error
  }
}

List<dynamic>? returnFilteredGroupList(
  String? filterGroup,
  List<dynamic> groupData,
  String? searchValue,
) {
  // Convert the groupData list into a list of categories
  List<dynamic> groupList = groupData.map((entry) {
    return {
      'groupName': entry['groupName'],
      'items': entry['items'],
    };
  }).toList();

  List<dynamic> filteredList = [];

  // Handle search functionality
  if (searchValue != null && searchValue.isNotEmpty) {
    String lowerSearch = searchValue.toLowerCase();

    for (var category in groupList) {
      var matchingItems = (category['items'] as List).where((item) {
        String name = item['name']?.toString().toLowerCase() ?? '';
        String desc = item['desc']?.toString().toLowerCase() ?? '';

        return name.contains(lowerSearch) || desc.contains(lowerSearch);
      }).toList();

      if (matchingItems.isNotEmpty) {
        filteredList.add({
          'groupName': category['groupName'],
          'items': matchingItems,
        });
      }
    }
    return filteredList;
  }

  // Handle group filtering
  for (var category in groupList) {
    if (filterGroup == 'all' || filterGroup == null || filterGroup.isEmpty) {
      if (category['items'].isNotEmpty) {
        filteredList.add(category);
      }
    } else if (category['groupName'].toLowerCase() ==
        filterGroup.toLowerCase()) {
      filteredList.add(category);
    }
  }

  return filteredList.isNotEmpty ? filteredList : null;
}

String? createWhatsappShareLink(String suLink) {
  final encodedUrl = Uri.encodeComponent(suLink);
  return 'https://wa.me/?text=$encodedUrl';
}

String returnmarkerImage(String imagepath) {
  return 'https://gps.speedotrack.com/${imagepath}';
}

List<dynamic>? flattenGroupedMarkers(dynamic groupedResult) {
  // write the code
  if (groupedResult == null) return null;

  List<dynamic> flattenedList = [];

  for (var group in groupedResult) {
    if (group is List) {
      flattenedList.addAll(flattenGroupedMarkers(group) as Iterable);
    } else {
      flattenedList.add(group);
    }
  }

  return flattenedList;
}

List<dynamic> formatMarkerData(dynamic markerWithGroup) {
  List<dynamic> markersList = [];

  markerWithGroup.forEach((groupName, items) {
    for (int i = 0; i < items.length; i++) {
      markersList.add(items[i]);
    }
  });

  return markersList;
}

String? breakStringOnSpace(String? breakString) {
  if (breakString == null) return null;

  List<String> words = breakString.split(' ');
  if (words.length <= 3) return breakString; // Avoid underflow

  return words.sublist(0, words.length - 3).join(' ');
}

String formateDtTracker(String formateDt) {
  // take this date formate 30-05-2025 09:38:00 AM and convert it like 30/05/2025 10:20
  DateFormat inputFormat = DateFormat("dd-MM-yyyy hh:mm:ss a");
  DateFormat outputFormat = DateFormat("dd/MM/yyyy HH:mm");
  DateTime dateTime = inputFormat.parse(formateDt);
  return outputFormat.format(dateTime);
}

bool? shouldShowText(String? text) {
  if (text == null || text.trim().isEmpty) {
    return false;
  }

  try {
    final decoded = jsonDecode(text);
    return decoded != null;
  } catch (e) {
    return false;
  }
}
