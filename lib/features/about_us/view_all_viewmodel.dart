// import 'package:publication_app/base/base_viewmodel.dart';
// import 'package:publication_app/models/homepage_response.dart';
// import 'package:publication_app/models/view_all_response.dart';
// import 'package:publication_app/utils/requests.dart';

// class ViewAllViewmodel extends BaseViewModel {
//   ViewallResponse _viewAllResponse;
//   Data results;
//   List<dynamic> items = [];
//   String datatype = "";
//   Future<void> getAllData(Object type) async {
//     //

//     type is BookData
//         ? datatype = "books"
//         : type is VideoData
//             ? datatype = "videos"
//             : datatype = "packages";
//     setBusy(true);
//     var response = await getRequest('/$datatype');
//     _viewAllResponse = viewAllResponseFromMap(response.body);
//     results = _viewAllResponse.data;
//     items.addAll(results.items);
//     setBusy(false);
//     notifyListeners();
//   }

//   void changeActiveActegory(int categoryId) {
//     items.clear();
//     //
//     if (categoryId == null) {
//       items.addAll(results.items);
//     } else {
//       results.items.forEach(
//         (book) {
//           if (book.categoryId == categoryId) {
//             print("${book.title},${book.categoryId} ==> $categoryId");
//             items.add(book);
//           } else {
//             //
//           }
//         },
//       );
//     }
//     print(items.length);
//     notifyListeners();
//   }
// }
