import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseAPIService {
  final httpClient = http.Client();
  Future<void> handleApiError(dynamic error) async {
    if (error is String) {
      debugPrint('API Error: $error');
    } else if (error is Map<String, dynamic> &&
        error.containsKey('statusCode')) {
      final statusCode = error['statusCode'];
      final message = error['message'];
      if (statusCode == HttpStatus.unprocessableEntity) {
        // Handle 422 error
        debugPrint('Unprocessable Entity: $message');
      } else if (statusCode == HttpStatus.notFound) {
        // Handle 404 error
        debugPrint('Not Found: $message');
      } else {
        // Handle other status codes
        debugPrint(
            'HTTP Request Failed: Status Code $statusCode, Message: $message');
      }
    } else {
      // Handle other errors
      debugPrint('An error occurred: $error');
    }
  }
}
