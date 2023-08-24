import 'package:flutter/material.dart';
import '../../model/api_model/login_model.dart';
import '../../respository/login_repository.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class LoginViewModel extends ChangeNotifier {
  final _api = LoginRepository();
  final loginModel =  LoginModel();

  bool loading = false;

  Future<void> loginApi(BuildContext context, Map data) async {
    print('inside provider');
    loading = true;
    notifyListeners();

    try {
      final response = await _api.loginApi(data);
      loginModel.message = response.message;
      loginModel.token = response.token;

      print('inside provider7 ${response.message}');

      if (loginModel.message == 'Logged in successfully') {
        token = loginModel.token!;
        print('inside provider8');
        Utils.toastMessage('${loginModel.message}');
        Navigator.pushNamed(context, RoutesName.dashboardScreen);
      } else {
        Utils.toastMessage('${loginModel.message}');
      }
    } catch (e) {
      Utils.toastMessage('Error: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

}
