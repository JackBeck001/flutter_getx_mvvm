import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getx_mvvm/data/response/status.dart';
import 'package:flutter_getx_mvvm/res/components/general_exceptions.dart';
import 'package:flutter_getx_mvvm/res/components/internet_exceptions.dart';
import 'package:flutter_getx_mvvm/res/routes/routes_name.dart';
import 'package:flutter_getx_mvvm/viewModels/controller/home/home_Controller.dart';
import 'package:flutter_getx_mvvm/viewModels/controller/user_prefrences/user_prefrences_view_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreferences userPreferences = UserPreferences();
  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.offAllNamed(RoutesName.loginView);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () {
          switch (homeController.status.value) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.ERROR:
              if (homeController.error.value == "No Internet") {
                return Center(
                  child: InternetExceptionWidget(onPress: () {
                    homeController.refreshUserList();
                  }),
                );
              } else {
                return Center(
                  child: GeneralExceptionWidget(onPress: () {
                    homeController.refreshUserList();
                  }),
                );
              }

            case Status.COMPLETED:
              return ListView.builder(
                itemCount: homeController.userListModel.value.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          homeController.userListModel.value.data![index].avatar.toString(),
                        ),
                      ),
                      title: Text(
                        homeController.userListModel.value.data![index].firstName.toString(),
                      ),
                      subtitle: Text(
                        homeController.userListModel.value.data![index].email.toString(),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
