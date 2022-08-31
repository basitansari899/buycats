import 'package:flutter/material.dart';



class TextStyles {
   static const TextStyle SUBHEAD_STYLE = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 18.36 / 15,
  );
  static const TextStyle NORMAL_TEXT = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 18.36 / 15,
  );
     static const TextStyle SUBTEXT_STYLE = TextStyle(

    fontSize: 13,
    height: 14.36 / 15,

  );
   static const TextStyle HEADING_STYLE = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 34,
  );
}


class StringConstant{
  static const String Featured_TITLE = "Featured";
  static const String ALL_CAT_TITLE = "All cats";
  static const String USER_AGE = "Age";
  static const String MY_CATS = "My cats";
  static const String ERROR_MESSAGE = 'Sorry, we have some problems loading featured cats 😿';
  static const String ERROR_MESSAGE_PROFILE = 'Sorry, we have some problems loading your profile 😿';
}

class FirebaseConstant{
  static const String CAT_COLLECTION = "cats";
  static const String USER_COLLECTION = "users";
  static const String USER_ID = "QzbShLeHBDPxuBl29Hg7";

}

class ButtonLabel{
  static const String ADD = "Add";
  static const String REMOVE = "Remove";


}