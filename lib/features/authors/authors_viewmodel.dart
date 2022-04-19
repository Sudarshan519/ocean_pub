import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/models/authors.dart';
import 'package:publication_app/utils/requests.dart';

class AuthorsViewmodel extends BaseViewModel {
  Author authors;
  Future<void> getAuthors() async {
    //
    setBusy(true);
    var response = await getRequest("/authors");
    print(response.body);
    authors = authorFromMap(response.body);
    setBusy(false);
    notifyListeners();
  }
}
