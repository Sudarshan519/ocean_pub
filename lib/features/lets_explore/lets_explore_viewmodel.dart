// import 'package:publication_app/base/base_viewmodel.dart';
// import 'package:publication_app/models/authresponse.dart';
// import 'package:publication_app/models/item.dart';
// import 'package:publication_app/models/lets_explore.dart';
// import 'package:publication_app/utils/functions.dart';
// import 'package:publication_app/utils/requests.dart';

// class LetsExploreViewmodel extends BaseViewModel {
//   //
//   AuthResponse _authResponse;
//   LetsExploreResponse _letsExploreResponse;
//   LetsExploreData letsExploreData;
//   User user;
//   Item item;
//   Future<void> getUserAndToken() async {
//     _authResponse = await getCachedUser();
//     user = _authResponse != null ? _authResponse.user : null;
//     notifyListeners();
//   }

//   Future<void> getAllItems(String itemTitle) async {
//     setBusy(true);
//     await getUserAndToken();
//     // print(itemTitle);
//     //
//     var response = await getRequest("/letsexplore/$itemTitle");
//     _letsExploreResponse = letsExploreResponseFromMap(response.body);
//     letsExploreData = _letsExploreResponse.data;
//     // print(letsExploreData.items.length);
//     setBusy(false);
//     notifyListeners();
//   }
// }
