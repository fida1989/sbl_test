import 'package:sbl_test/models/profile_response.dart';

class HomeInterface {
  void onDataLoadSuccess(ProfileResponse response){}
  void onDataLoadError(String error) {}
  void onLoadingStart() {}
}