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

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

Future<String> savePdfFileFromBytes(List<int> pdfBytes, String filename) async {
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/$filename';
  final file = File(filePath);
  await file.writeAsBytes(Uint8List.fromList(pdfBytes));
  return filePath;
}
