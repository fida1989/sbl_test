import 'dart:convert';

import 'package:sbl_test/models/profile_response.dart';
import 'package:http/http.dart' as http;
import 'package:sbl_test/pages/home_page/home_interface.dart';

class HomePresenter {

  HomeInterface? _interface;

  HomePresenter(HomeInterface interface) {
    _interface = interface;
  }

  void getProfile(bool loading) async {
    if(!loading){
      _interface?.onLoadingStart();
    }
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
      ProfileResponse profile =
          ProfileResponse.fromJson(jsonDecode(response.body));
      _interface?.onDataLoadSuccess(profile);
    } catch (e) {
      print(e);
      _interface?.onDataLoadError(e.toString());
    }
  }

}