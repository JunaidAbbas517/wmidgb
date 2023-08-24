
import 'package:flutter/material.dart';

import '../../model/api_model/project_status_model.dart';
import '../../respository/project_status_repository.dart';
import '../../utils/utils.dart';

class ProjectStatusViewModel extends ChangeNotifier {
  final _api = ProjectStatusRepository();
  final projectStatusModel =  ProjectStatusModel();

  bool loading = false;
   var response ;
  Future<void> projectStatusApi() async {
    print('inside provider');
    loading = true;


    try {
        response =  await _api.projectStatusApi();

    } catch (e) {
      print('error: $e');
    }  loading = false;
    notifyListeners();
  }

}