import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/requests.dart';

class HomepageRepository {
  Future<HomepageResponse> getHomepageData() async {
    var response = await getRequest('/homepage');
    // print(response.body);
    // var data = jsonDecode(response.body); //["data"]["books"]["data"];
    // print(data["data"]["packages"]);
    // print(data.length);
    // (data["data"]["books"]["data"].forEach((v) {
    //   print(v);
    //   if (data != null) print(BookData.fromMap(v));
    // }));
    // print(jsonDecode(data)["data"]);
    // var dataa = homepageResponseFromMap(response.body);
    // print(dataa.data.packages);
    // print(data.data.banner);
    if (response.statusCode == 200)
      return homepageResponseFromMap(response.body);
    else {
      return null;
    }
    // return null;
  }
}
