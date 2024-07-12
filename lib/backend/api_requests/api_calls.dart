import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start inbound group Group Code

class InboundGroupGroup {
  static String getBaseUrl() => 'https://rahul.qikpod.com:8983/';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
    'accept': 'application/json',
  };
  static RegisterapiCall registerapiCall = RegisterapiCall();
  static ConsumerPostCall consumerPostCall = ConsumerPostCall();
  static GenrateOtpCall genrateOtpCall = GenrateOtpCall();
  static ValidateOtpCall validateOtpCall = ValidateOtpCall();
  static ItemDetailsCall itemDetailsCall = ItemDetailsCall();
  static InboundDataCall inboundDataCall = InboundDataCall();
  static CustomerDetailsCall customerDetailsCall = CustomerDetailsCall();
  static MatchOrderSlotIdCall matchOrderSlotIdCall = MatchOrderSlotIdCall();
  static InboundOrderDetailsCall inboundOrderDetailsCall =
      InboundOrderDetailsCall();
  static RobotDatailsCall robotDatailsCall = RobotDatailsCall();
}

class RegisterapiCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? email = '',
    String? address = '',
    String? phone = '',
    int? storeid,
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "$name",
  "email": "$email",
  "address": "$address",
  "phone": "$phone",
  "storeid": $storeid
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerapi',
      apiUrl: '${baseUrl}nanostore/customer/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
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

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
  int? customerid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
}

class ConsumerPostCall {
  Future<ApiCallResponse> call({
    int? customerId,
    int? storeId,
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": $customerId,
  "store_id": $storeId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'consumer post',
      apiUrl: '${baseUrl}nanostore/consumer/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
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

class GenrateOtpCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GenrateOtp',
      apiUrl: '${baseUrl}auth/generate_mock_otp/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': userPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
}

class ValidateOtpCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
    String? otpText = '',
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ValidateOtp',
      apiUrl: '${baseUrl}auth/validate_mock_otp/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': userPhone,
        'otp_text': otpText,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accesstoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  int? tokenexpiry(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiry''',
      ));
  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
}

class ItemDetailsCall {
  Future<ApiCallResponse> call({
    String? tableName = '',
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'item details',
      apiUrl: '${baseUrl}dbcall/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'table_name': tableName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? record(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class InboundDataCall {
  Future<ApiCallResponse> call({
    String? orderStatus = '',
    int? userRecordId,
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'inbound data',
      apiUrl: '${baseUrl}nanostore/inbound_order/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'order_status': orderStatus,
        'user_record_id': userRecordId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
}

class CustomerDetailsCall {
  Future<ApiCallResponse> call({
    String? userPhone = '',
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'customer details',
      apiUrl: '${baseUrl}nanostore/users/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {
        'user_phone': userPhone,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.records[:].id''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.records[:].user_name''',
      ));
  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
}

class MatchOrderSlotIdCall {
  Future<ApiCallResponse> call({
    int? orderId,
    String? slotFriendlyName = '',
    int? itemQuantity,
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'match order slot id',
      apiUrl:
          '${baseUrl}nanostore/update_inbound_items/?order_id=$orderId&item_quantity=$itemQuantity&slot_friendly_name=$slotFriendlyName',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
}

class InboundOrderDetailsCall {
  Future<ApiCallResponse> call({
    String? itemBarcode = '',
    int? userRecordId,
    String? robotId = '',
  }) async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'inbound order details',
      apiUrl:
          '${baseUrl}nanostore/create_inbound/?user_record_id=$userRecordId&robot_id=$robotId&item_barcode=$itemBarcode',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
}

class RobotDatailsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = InboundGroupGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'robot datails',
      apiUrl: '${baseUrl}nanostore/robot_details/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE4NjQzNzUxODN9.3nKvoS0uuSwwZXPnv0-MyXKucUnpMBlCJuI97FR84z4',
        'accept': 'application/json',
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

  List? records(dynamic response) => getJsonField(
        response,
        r'''$.records''',
        true,
      ) as List?;
  bool? statusbool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.statusbool''',
      ));
  List<String>? robotids(dynamic response) => (getJsonField(
        response,
        r'''$.records[:].robot_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End inbound group Group Code

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
