import 'dart:io';

import 'package:buy_cats/models/cat_model.dart';
import 'package:buy_cats/models/user_model.dart';
import 'package:buy_cats/services/database.dart';
import 'package:get/get.dart';

class CatListController extends GetxController {
  Rx<List<CatModel>> catList = Rx<List<CatModel>>([]);
  Rx<UserModel> userData = UserModel(age: '', name: '', profilelink: '', isFav: []).obs;

  final Database _db = Database();
  late List<String> favCatIds;
  var isloading = false.obs;
  RxBool  activeConnection = false.obs;
  RxString  tempErrorMessage = "".obs;
  @override
  void onInit() {
    super.onInit();
    checkUserConnection();
    catList.bindStream(_db.allCats());
    userData.bindStream(_db.getUserFromDB());
  }




Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

          activeConnection.value = true;
           tempErrorMessage.value = "data is on";
       
      }
    } on SocketException catch (_) {

        activeConnection.value = false;
        tempErrorMessage.value = "data is off";

    }
}
  featureCatList(bool isFeatured) {
    final featureList = catList.value.where((e) => e.isFeature == isFeatured).toList();
    return featureList;
  }

  favList(String catId) {
    final favlist = userData.value.isFav.contains(catId);
    return favlist;
  }

  favCatList() {
    final favlist = catList.value.where((e) => userData.value.isFav.contains(e.catId)).toList();
    return favlist;
  }

  deleteFavCat(String catId) {
    _db.deleteUserData(catId);
  }

  addFavCat(String catId) {
    _db.addUserData(catId);
  }

  @override
  void onClose() {
    catList.close();
    userData.close();
    super.onClose();
  }
}
