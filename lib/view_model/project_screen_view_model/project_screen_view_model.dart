import 'package:flutter/cupertino.dart';
import 'package:wmidgb/model/hive_models/add_project_model.dart';

class ProjectScreenViewModel extends ChangeNotifier {
  void projectDelete(AddProjectModel addProjectModel) async {
    await addProjectModel.delete();
    notifyListeners();
  }
}
