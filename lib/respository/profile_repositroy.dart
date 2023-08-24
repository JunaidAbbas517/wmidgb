import '../data/network/NetworkApiService.dart';
import '../model/api_model/profile_model.dart';
import '../res/app_url.dart';

class ProfileRepository {
  final _apiServices = NetworkApiService();
  Future<User?> profileApi() async {
    print('fgdgf');

    var response = await _apiServices.getGetApiResponse(AppUrl.profileApiUrl);

    return GetProfileModel.fromJson(response).user;
  }
}