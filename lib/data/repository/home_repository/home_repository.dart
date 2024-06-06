import 'package:flutter_getx_mvvm/data/network/network_api_service.dart';
import 'package:flutter_getx_mvvm/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm/res/app%20url/app_url.dart';

class HomeRepository {
  final _network = NetworkApiService();

  Future<UserListModel> getUserListApi() async {
    dynamic response = await _network.getApi(AppUrl.userList);
    return UserListModel.fromJson(response);
  }
}
