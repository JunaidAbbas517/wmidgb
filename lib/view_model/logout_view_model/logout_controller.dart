import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wmidgb/res/app_url.dart';

import '../../utils/utils.dart';

class LogoutViewModel extends ChangeNotifier {
  bool loading = false;

  Future<void> logoutApi() async {
    loading = true;
    notifyListeners();

    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse(AppUrl.logoutApiUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        Utils.toastMessage(await response.stream.bytesToString());
      } else {
        print("cvbcvbcb ${response.reasonPhrase}");
        Utils.toastMessage('Log Out Successfully');
      }

      token = '';
    } catch (e) {
      Utils.toastMessage('Log Out Successfully');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
