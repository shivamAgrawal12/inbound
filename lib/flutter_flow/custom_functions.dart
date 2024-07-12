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
import '/auth/custom_auth/auth_util.dart';

bool? checklength(String? textfield) {
  // Check if the input string is not null and has a length of 10
  return textfield != null && textfield.length == 10;
}

dynamic jsontostring(String? jsonstring) {
  return jsonstring;
}

DateTime? tokenexp(int secondsToAdd) {
  DateTime currentTime = DateTime.now();

  // Add seconds to the current time
  DateTime newDateTime = currentTime.add(Duration(seconds: secondsToAdd));

  // Return the resulting DateTime object
  return newDateTime;
}

List<dynamic> singleitemview(List<dynamic>? itemslist) {
  // Check if itemslist is a List
  if (itemslist == null || itemslist is! List) {
    return [];
  }

  for (var item in itemslist) {
    if (item['item_pick_status'] == 'ready_for_pickup') {
      return [item];
    }
  }

  return [];
}

dynamic newCustomFunction(
  List<dynamic>? jsonval,
  List<String>? num,
) {
  dynamic resultList;

  if (jsonval == null || num == null) {
    return resultList; // Return null if either jsonval or num is null
  }

  // Iterate through each JSON value
  for (var item in jsonval) {
    // Check if item is a Map and contains 'item_barcode' key
    if (item is Map<String, dynamic> && item.containsKey('item_barcode')) {
      // Get the item_barcode value
      String? barcode = item['item_barcode'];

      // Check if the barcode is in the num list
      if (barcode != null && num.contains(barcode)) {
        // Assign the matched item to resultList
        resultList = item;
        // Return the matched item immediately since only one item is expected
        return resultList;
      }
    }
  }

  // If no match found, resultList remains null
  return resultList;
}

dynamic newCustomFunction2(
  List<dynamic>? jsonval,
  List<String>? valnum,
) {
  List<dynamic> matchedItems = [];

  if (jsonval != null && valnum != null) {
    for (var item in jsonval) {
      if (item['item_barcode'] != null &&
          valnum.contains(item['item_barcode'])) {
        matchedItems.add(item);
      }
    }
  }

  return matchedItems;
}

List<dynamic>? compairvalue(
  List<String>? value,
  List<dynamic>? jsonval,
) {
  if (value == null || jsonval == null) {
    return null;
  }

  return jsonval.where((jsonItem) {
    if (jsonItem is Map<String, dynamic> && jsonItem.containsKey('item_id')) {
      return value.contains(jsonItem['item_id']);
    }
    return false;
  }).toList();
}

dynamic filterdata(
  List<dynamic>? jsonval1,
  List<dynamic>? jsonval2,
) {
  if (jsonval1 == null && jsonval2 == null) {
    return [];
  }
  if (jsonval1 == null) {
    return jsonval2;
  }
  if (jsonval2 == null) {
    return jsonval1;
  }

  return [...jsonval1, ...jsonval2];
}
