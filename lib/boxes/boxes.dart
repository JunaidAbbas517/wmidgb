import 'package:hive/hive.dart';

import '../model/hive_models/add_project_model.dart';

class Boxes {
  static Box<AddProjectModel> getData() =>
      Hive.box<AddProjectModel>('addProject');
}
