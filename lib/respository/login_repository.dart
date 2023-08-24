
import '../data/network/NetworkApiService.dart';
import '../model/api_model/login_model.dart';
import '../res/app_url.dart';

class LoginRepository {

  final _apiServices = NetworkApiService();
  Future<LoginModel> loginApi(var data) async {
    print('inside provider1');
    var response = await _apiServices.getPostApiResponse(AppUrl.loginApiUrl,data);
    print('asdad $response');
    return LoginModel.fromJson(response);
  }
}
