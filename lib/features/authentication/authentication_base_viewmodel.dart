import 'package:flutter/material.dart';
import 'package:publication_app/base/base_viewmodel.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_view.dart';
import 'package:publication_app/models/authresponse.dart';
import 'package:publication_app/utils/functions.dart';
import 'package:publication_app/utils/requests.dart';

class AuthenticationBaseViewmodel extends BaseViewModel {
  //
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AuthResponse authResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> authenticate(
      String apiEndpoint, Map<String, String> data) async {
    //
    setBusy(true);
    FocusScope.of(scaffoldKey.currentContext).unfocus();
    try {
      var response = await postRequest(
        "/$apiEndpoint",
        body: data,
      );
      print(response.body);
      authResponse = authResponseFromMap(response.body);
      if (authResponse.success) {
        await saveUser(authResponse);
        pushReplacement(scaffoldKey.currentContext, HomepageView());
      } else {
        showToast(
          scaffoldKey.currentContext,
          authResponse.message,
          1,
        );
      }
    } catch (e) {
      //
      print(e.toString());
      showToast(
          scaffoldKey.currentContext, "Error occured. Please try again", 1);
    }

    setBusy(false);
    notifyListeners();
  }
}
