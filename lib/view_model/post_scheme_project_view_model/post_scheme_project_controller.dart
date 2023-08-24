import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wmidgb/res/app_url.dart';
import '../../model/api_model/login_model.dart';
import '../../model/hive_models/add_project_model.dart';
import '../../respository/login_repository.dart';
import '../../respository/post_scheme_project_repository.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import 'package:http/http.dart' as http;
class PostSchemeProjectViewModel extends ChangeNotifier {


  bool loading = false;

  Future<void> postSchemeProjectApi() async {
    print('inside provider');
    loading = true;
    notifyListeners();
    var response;
    try {
      var testBox = Hive.box<AddProjectModel>('addProject');

      for(int i = 0 ; i<testBox.length;i++){
        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        };
        var request = http.MultipartRequest('POST', Uri.parse(AppUrl.postSchemeApiUrl));
        request.fields.addAll({
          'name': testBox.getAt(i)!.name!,
          'cost': testBox.getAt(i)!.cost!,
          'duration': testBox.getAt(i)!.duration!,
          'population': testBox.getAt(i)!.population!,
          'detail': testBox.getAt(i)!.detail!,
          'budget':testBox.getAt(i)!.budget!,
          'assets': testBox.getAt(i)!.assets!,
        });
        request.files.add(await http.MultipartFile.fromPath('documentation', testBox.getAt(i)!.image!));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {

          Utils.toastMessage(await response.stream.bytesToString());
          testBox.deleteAt(i);
        }
        else {
          print(response.reasonPhrase);
          Utils.toastMessage(response.reasonPhrase!);
        }

      }

    } catch (e) {
      Utils.toastMessage('Error: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }

}
