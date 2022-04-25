import 'package:get/get.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_repository.dart';
import 'package:publication_app/models/category.dart';
import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/requests.dart';

class HomeController extends GetxController {
  HomepageRepository _homepageRepository = HomepageRepository();
  var categoryApi = CategoriesApi().obs;
  var busy = false.obs;

  var homepageData = HomepageData().obs;
  getHomeData() async {
    busy.toggle();
    homepageData.value = HomepageData();
    categoryApi.value = CategoriesApi();
    try {
      var _homepageResponse = await _homepageRepository.getHomepageData();

      homepageData.value = _homepageResponse.data;
    } catch (e) {
      print(e.toString());
    }
    getCategoryData();
    busy.toggle();
  }

  getCategoryData() async {
    busy.value = false;
    var bdata = await getRequest("/categories");
    // print(bdata);
    var categorydata = categoriesApiFromJson(bdata.body);
    categoryApi.value = categorydata;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
  }
}
