import '../data/network/NetworkApiService.dart';
import '../model/api_model/get_scheme_model.dart';
import '../res/app_url.dart';

class GetSchemeRepository {
  final _apiServices = NetworkApiService();
  Future<List<Data>?> getSchemeApi() async {
    print('inside provider1');
    var response = await _apiServices.getGetApiResponse(AppUrl.getSchemeApiUrl);
    print('asdad ${response['data']}');
    print('lenght ${GetSchemeModel.fromJson(response).data!.length}');
    print('ytuyt $GetSchemeModel');

    return GetSchemeModel.fromJson(response).data;
  }
}