import 'package:amazon_clone/resources/cloudfirestore_methods.dart';
import 'package:flutter/cupertino.dart';
import '../model/user_details_model.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetialsModel? userDetails;

  //We are defining value of userDetails to something because of this when programme will run first time instead of showing error it get initialized data.
  UserDetailsProvider()
      : userDetails =
            UserDetialsModel(name: "Loading name", address: "Loading Address");
  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }
}
