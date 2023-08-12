import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart' as sql;
import '../config/config.dart';

class BaseController {
  // base for HTTP Client Request
  final httpClient = http.Client();
  handleError(error) {
    // hideLoading();
    // if (error is BadRequestException) {
    //   var message = error.message;
    // } else if (error is FetchDataException) {
    //   var message = error.message;
    // } else if (error is ApiNotRespondingException) {}
  }

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

  // Base for SQLite
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      AppDatabase.database,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
}
