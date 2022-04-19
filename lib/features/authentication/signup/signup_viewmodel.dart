import '../authentication_base_viewmodel.dart';

class SignupViewModel extends AuthenticationBaseViewmodel {
  //
  Future<void> signup() async {
    //
    print(emailController.text);
    print(passwordController.text);

    setBusy(true);
    final body = {
      "email": emailController.text.toLowerCase().trim(),
      "password": passwordController.text.toLowerCase().trim(),
      "password_confirmation": confirmPasswordController.text.trim(),
    };
    await authenticate("register", body);
    setBusy(false);
    notifyListeners();
  }
}
