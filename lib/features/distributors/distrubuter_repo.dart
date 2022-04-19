import 'package:publication_app/features/distributors/distributors_view.dart';
import 'package:publication_app/models/distributor_response.dart';
import 'package:publication_app/utils/requests.dart';

class DistributorRepository {
  Future<DistributorResponse> getDistributerData() async {
    var response = await getRequest('/distributor');
    return distributorResponseFromMap(response.body);
  }
}
