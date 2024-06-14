import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start tools Group Code

class ToolsGroup {
  static String getBaseUrl({
    String? bodyAuthKey = 'cnafrestapimobile',
    String? bodyClientService = 'BodyClientService',
  }) =>
      'http://34.101.123.70/apivx/index.php/';
  static Map<String, String> headers = {};
  static SetsendleadsCall setsendleadsCall = SetsendleadsCall();
}

class SetsendleadsCall {
  Future<ApiCallResponse> call({
    String? nama = '',
    String? email = '',
    String? phone = '',
    String? bodyAuthKey = 'cnafrestapimobile',
    String? bodyClientService = 'BodyClientService',
  }) async {
    final baseUrl = ToolsGroup.getBaseUrl(
      bodyAuthKey: bodyAuthKey,
      bodyClientService: bodyClientService,
    );

    final ffApiRequestBody = '''
{
  "nama": "$nama",
  "email": "$email",
  "phone": "$phone",
  "AuthKey": "$bodyAuthKey",
  "ClientService": "$bodyClientService"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'setsendleads',
      apiUrl: '$baseUrl/tools/setsendleads',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End tools Group Code

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
