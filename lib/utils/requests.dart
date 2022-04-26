// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:publication_app/utils/functions.dart';

final String baseUrl = "https://oceanpublication.com.np/api";

Future<http.Response> getRequest(String url) async {
  //
  var header = await getCachedUser().then((value) => value != null
      ? {
          "X-Authorization": "Bearer ${value.token}",
          "Accept": "application/json",
        }
      : null);
  try {
    // print(url);
    var response = await http.get(
      Uri.parse("$baseUrl" + url),
      headers: (header),
    );
    // print(response.body);
    return response;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<http.Response> postRequest(String url,
    {Map<String, String> body, bool requiresHeader = false}) async {
  //
  var header;
  if (requiresHeader) {
    header = await getCachedUser().then((value) => {
          "X-Authorization": "Bearer ${value.token}",
          "Accept": "application/json",
        });
  }
  try {
    var response = await http.post(Uri.parse("$baseUrl" + url),
        headers: header, body: body);
    return response;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// Future<Response> postRequestFile(String url,
//     {Map<String, String> header, Map<String, String> body}) async {
//   //
//   var response = await Dio().post(
//     "$baseUrl" + url,
//     data: FormData.fromMap(body),
//   );
//   return response;
// }
