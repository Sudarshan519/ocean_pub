import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/requests.dart';

class HomepageRepository {
  Future<HomepageResponse> getHomepageData() async {
    var response = await getRequest('/homepage');
    // var data = jsonDecode(response.body); //["data"]["books"]["data"];
    // print(data["data"]["books"]["data"]);
    // print(data.length);
    // (data["data"]["books"]["data"].forEach((v) {
    //   print(v);
    //   if (data != null) print(BookData.fromMap(v));
    // }));
    // print(jsonDecode(data)["data"]);
    // var data = homepageResponseFromMap(response.body);
    // print(data.data.banner);
    return homepageResponseFromMap(response.body);
    // return null;
  }
}
