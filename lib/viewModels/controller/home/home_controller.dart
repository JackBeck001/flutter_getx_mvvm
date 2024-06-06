import 'package:flutter_getx_mvvm/data/repository/home_repository/home_repository.dart';
import 'package:flutter_getx_mvvm/data/response/status.dart';
import 'package:flutter_getx_mvvm/models/home/user_list_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final userListModel = UserListModel().obs;
  final status = Status.LOADING.obs;
  final error = ''.obs;
  final HomeRepository _homeRepository = HomeRepository();

  void setStatus(Status status) => this.status.value = status;
  void setUserList(UserListModel userList) => userListModel.value = userList;
  void setError(String error) => this.error.value = error;

  void getUserList() {
    _homeRepository.getUserListApi().then((value) {
      setStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setStatus(Status.ERROR);
    });
  }

  void refreshUserList() {
    setStatus(Status.LOADING);
    _homeRepository.getUserListApi().then((value) {
      setStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setStatus(Status.ERROR);
    });
  }
}
