import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';
import '../app_excaptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    print('$url');
    print('inside provider3');
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url),headers: {
            "Authorization": "Bearer $token",
          }).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    print('inside provider$responseJson');
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    print('$url');
    print('inside provider3');
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 30));
      print('sdfsdfsd ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server with status code${response.statusCode}');
    }
  }
}
