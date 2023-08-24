
import 'package:flutter/material.dart';

import '../../model/api_model/profile_model.dart';
import '../../respository/profile_repositroy.dart';

class ProfileViewModel extends ChangeNotifier {
  final _api = ProfileRepository();
  final getProfileModel =  GetProfileModel();

  bool loading = false;
  var  response ;
  Future<void> profileApi() async {

    loading = true;


    try {

      response =  await _api.profileApi();

    } catch (e) {
      print('error $e');
    }  loading = false;
    notifyListeners();
  }

}