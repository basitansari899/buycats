import 'package:buy_cats/constants/app_constants.dart';
import 'package:buy_cats/models/cat_model.dart';
import 'package:buy_cats/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<CatModel>> allCats() {
    return _firestore.collection(FirebaseConstant.CAT_COLLECTION).snapshots()
        .map((QuerySnapshot query) {
      List<CatModel> catList = [];
      for (var todo in query.docs) {
        final todoModel = CatModel.fromDocumentSnapshot(documentSnapshot: todo);
        catList.add(todoModel);
      }
      print(catList.length.toString());
      return catList;
    });
  }

  Stream<UserModel> getUserFromDB() {
    return _firestore.collection(FirebaseConstant.USER_COLLECTION).doc(FirebaseConstant.USER_ID).snapshots()
        .map(
      (data) {
        var _mapData = data.data();
        UserModel userData = UserModel.fromMap(dataMap: _mapData);
        return userData;
      },
    );
  }

  deleteUserData(String catFavId) {
    try {
      return _firestore.collection(FirebaseConstant.USER_COLLECTION).doc(FirebaseConstant.USER_ID)
          .update({
        "isFav": FieldValue.arrayRemove([catFavId])
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  addUserData(String catFavId) {
    try {
      return _firestore.collection(FirebaseConstant.USER_COLLECTION).doc(FirebaseConstant.USER_ID)
          .update({
        "isFav": FieldValue.arrayUnion([catFavId])
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
