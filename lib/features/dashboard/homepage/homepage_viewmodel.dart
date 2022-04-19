import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_repository.dart';
import 'package:publication_app/models/homepage_response.dart';

class HomepageViewmodel extends BaseViewModel {
  HomepageRepository _homepageRepository = HomepageRepository();
  HomepageResponse _homepageResponse;
  List activeList = [];
  HomepageData homepageData;
  Future<void> getHomepageData() async {
    //
    print("hheelloo");
    setBusy(true);
    try {
      _homepageResponse = await _homepageRepository.getHomepageData();
      homepageData = _homepageResponse.data;
      changeActiveList(0);
    } catch (e) {
      print(e.toString());
    }
    setBusy(false);
    notifyListeners();
  }

  void changeActiveList(int id) async {
    activeList.clear();

    if (id == 0) {
      activeList.addAll(homepageData.books);
    } else if (id == 1) {
      activeList.addAll(homepageData.video);
    } else {
      activeList.addAll(homepageData.packages);
    }
    notifyListeners();
  }
}
