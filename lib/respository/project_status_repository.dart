import '../data/network/NetworkApiService.dart';
import '../model/api_model/project_status_model.dart';
import '../res/app_url.dart';

class ProjectStatusRepository {
  final _apiServices = NetworkApiService();
  Future<List<Data>?> projectStatusApi() async {
    print('inside provider1');
    var response = await _apiServices.getGetApiResponse(AppUrl.projectStatusApiUrl);
    print('asdad ${response['data']}');
    print('dfsdf ${ProjectStatusModel.fromJson(response).data}');
    print('ytuyt $ProjectStatusModel');

    return ProjectStatusModel.fromJson(response).data;
  }
}