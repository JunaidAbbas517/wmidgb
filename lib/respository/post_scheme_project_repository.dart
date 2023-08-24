import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class PostSchemeProjectRepository {

  final _apiServices = NetworkApiService();
  Future<String> PostSchemeProjectApi(var data) async {
    print('inside provider1');
    var response = await _apiServices.getPostApiResponse(AppUrl.postSchemeApiUrl,data);
    print('asdad $response');
    return response;
  }
}
