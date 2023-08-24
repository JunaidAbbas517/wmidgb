import 'package:flutter/material.dart';

import '../../model/api_model/get_scheme_model.dart';
import '../../respository/get_scheme_respository.dart';

class GetSchemeViewModel extends ChangeNotifier {
  final _api = GetSchemeRepository();
  final getSchemeModel =  GetSchemeModel();

  bool loading = false;
  var  response ;
  Future<void> getSchemeApi() async {
    print('inside provider');
    loading = true;


    try {
      print('hghjghj${await _api.getSchemeApi()}');
       response =  await _api.getSchemeApi();
      print('hghjghj1$response');
    } catch (e) {
      print('error $e');
    }  loading = false;
    notifyListeners();
  }

}