import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  HttpService._privateConstructor();
  static final HttpService _instance = HttpService._privateConstructor();
  static HttpService get instance => _instance;

  final int httpTimoutSeconds = 15;

  static const Map<String, String>? defaultHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  /// GET Request
  Future<dynamic> get(
    String url, {
    Map<String, String>? headers = defaultHeader,
  }) async {
    dynamic responseJson;
    try {
      if (await checkConnectivity()) {
        Uri _uri = Uri.parse(url);
        final response = await http
            .get(_uri, headers: headers)
            .timeout(Duration(seconds: httpTimoutSeconds));
        responseJson = _response(response);
        return responseJson;
      }
    } on HandshakeException {
      throw Exception('error.connetion_timeout'.tr());
    } on TimeoutException {
      throw Exception('error.connetion_timeout'.tr());
    } catch (e) {
      if (kDebugMode) {
        print('get :  error $e');
      }
      rethrow;
    }
  }

  /// POST Request
  Future<dynamic> post(
    String url, {
    dynamic parameter,
    Map<String, String>? headers = defaultHeader,
  }) async {
    dynamic responseJson;
    try {
      if (await checkConnectivity()) {
        Uri _uri = Uri.parse(url);
        final response = await http
            .post(
              _uri,
              headers: headers,
              body: json.encode(parameter),
            )
            .timeout(Duration(seconds: httpTimoutSeconds));

        responseJson = _response(response);
        return responseJson;
      }
    } on HandshakeException {
      throw Exception('error.connetion_timeout'.tr());
    } on TimeoutException {
      throw Exception('error.connetion_timeout'.tr());
    } catch (e) {
      if (kDebugMode) {
        print('post :  error $e');
      }
      rethrow;
    }
  }

  /// Single File Upload
  Future<bool> uploadSingle(
    String url, {
    required File file,
    required String fileName,
    Map<String, String>? parameters,
    Map<String, String>? headers = defaultHeader,
  }) async {
    try {
      if (await checkConnectivity()) {
        var uri = Uri.parse(url);
        var stream = http.ByteStream(file.readAsBytes().asStream());
        var length = await file.length();

        var request = http.MultipartRequest("POST", uri);
        var multipartFile = http.MultipartFile(
          fileName,
          stream,
          length,
          filename: file.path.split("/").last,
        );

        request.files.add(multipartFile);
        if (parameters != null) {
          for (var key in parameters.keys) {
            request.fields[key] = parameters[key]!;
          }
        }

        request
            .send()
            .timeout(Duration(seconds: httpTimoutSeconds))
            .then((response) {
          if (response.statusCode == 200) {
            if (kDebugMode) {
              print("File Uploading Success");
            }
          } else {
            throw CustomHttpException(response.statusCode);
          }
        });
      }

      return true;
    } on HandshakeException {
      throw Exception('error.connetion_timeout'.tr());
    } on TimeoutException {
      throw Exception('error.connetion_timeout'.tr());
    } catch (e) {
      if (kDebugMode) {
        print('upload :  error $e');
      }
      rethrow;
    }
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseJson = json.decode(response.body.toString());

      return responseJson;
    } else {
      throw CustomHttpException(response.statusCode);
    }
  }

  Future<bool> checkConnectivity() async {
    bool status = false;

    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile) {
        status = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        status = true;
      } else {
        throw CustomHttpException.message('error.connectivity_error'.tr());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw CustomHttpException.message('error.connectivity_error'.tr());
    }

    return status;
  }
}

class CustomHttpException implements Exception {
  late String message;
  late int code;

  CustomHttpException(this.code) {
    message = tr("error.exception_$code");
  }

  CustomHttpException.message(this.message) {
    message = message;
  }

  @override
  String toString() {
    return message;
  }
}
