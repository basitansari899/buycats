class UserModel {
  late String name;
  late String age;
  late String profilelink;
  late List isFav;

  UserModel({
    required this.name,
    required this.age,
    required this.profilelink,
    required this.isFav,
  });

  factory UserModel.fromMap({dynamic dataMap}) {
    return UserModel(
      name: dataMap["name"],
      age: dataMap["age"],
      profilelink: dataMap["profilelink"],
      isFav: dataMap["isFav"],
    );
  }
}
