import '../authentication_base_viewmodel.dart';

class LoginViewModel extends AuthenticationBaseViewmodel {
  //
  Future<void> login() async {
    //
    print(emailController.text);
    print(passwordController.text);

    setBusy(true);
    final body = {
      "email": emailController.text.toLowerCase().trim(),
      "password": passwordController.text.toLowerCase().trim(),
    };
    await authenticate("login", body);
    setBusy(false);
    notifyListeners();
  }
}
