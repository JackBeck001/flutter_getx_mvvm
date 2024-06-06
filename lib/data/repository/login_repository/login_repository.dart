import 'package:flutter_getx_mvvm/data/network/network_api_service.dart';
import 'package:flutter_getx_mvvm/res/app%20url/app_url.dart';

class loginRepository {
  final _network = NetworkApiService();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _network.postApi(AppUrl.login, data);
    return response;
  }
}
