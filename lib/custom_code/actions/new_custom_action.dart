// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

Future<dynamic> newCustomAction(
  List<dynamic>? listvalue,
  List<String>? value,
) async {
  // Add your function code here!

  if (listvalue == null || value == null) {
    return [];
  }

  // Function to check if any value in the JSON object matches any string in the string list
  bool matches(Map<String, dynamic> jsonObject, List<String> stringList) {
    for (var key in jsonObject.keys) {
      var jsonValue = jsonObject[key];
      if (jsonValue != null) {
        if (stringList.contains(jsonValue.toString())) {
          return true;
        }
      }
    }
    return false;
  }

  // Iterate through the JSON list and filter based on the condition
  List<dynamic> filteredList = [];
  for (var jsonObject in listvalue) {
    if (jsonObject is Map<String, dynamic> && matches(jsonObject, value)) {
      filteredList.add(jsonObject);
    }
  }

  return filteredList;
}
