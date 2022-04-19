import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/features/distributors/distrubuter_repo.dart';
import 'package:publication_app/models/distributor_response.dart';

class DistributerViewmodel extends BaseViewModel {
  //
  DistributorRepository _distributorRepository = DistributorRepository();
  DistributorResponse _distributorResponse;
  List<DistributorData> distributorData;
  Future<void> getDistributorData() async {
    //
    setBusy(true);
    _distributorResponse = await _distributorRepository.getDistributerData();
    distributorData = _distributorResponse.data;
    setBusy(false);
  }
}
