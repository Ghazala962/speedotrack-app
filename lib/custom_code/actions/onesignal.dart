// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future onesignal() async {
  // Add your function code here!
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("b11b328a-9765-41be-a5d3-755c4991ad52");
  OneSignal.Notifications.requestPermission(true);
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
