import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/models/authresponse.dart';
import 'package:publication_app/models/item.dart';
import 'package:publication_app/models/profile.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/requests.dart';

class ProfileViewmodel extends BaseViewModel {
  //
  AuthResponse _authResponse;
  User user;
  UserProfile item;
  Future<void> getUser() async {
    _authResponse = await getCachedUser();
    user = _authResponse != null ? _authResponse.user : null;
    notifyListeners();
  }

  Future<void> getUserDetails() async {
    setBusy(true);
    await getUser();
    //
    var response = await getRequest("/student-profile");
    item = userProfileFromMap(response.body);
    print(item.toMap());
    setBusy(false);
    notifyListeners();
  }
}
