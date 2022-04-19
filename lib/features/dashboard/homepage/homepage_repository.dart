import 'package:publication_app/models/homepage_response.dart';
import 'package:publication_app/utils/requests.dart';

class HomepageRepository {
  Future<HomepageResponse> getHomepageData() async {
    var response = await getRequest('/homepage');
    print(response.body);
    return homepageResponseFromMap(response.body);
  }
}
