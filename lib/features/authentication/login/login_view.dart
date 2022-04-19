import 'package:flutter/material.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/features/authentication/authentication_widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  static const routeId = "LoginView";
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      viewModel: LoginViewModel(),
      builder: (context, viewmodel, _) {
        return SafeArea(
          child: Scaffold(
            key: viewmodel.scaffoldKey,
            backgroundColor: Colors.transparent,
            body: Container(
              alignment: Alignment.bottomCenter,
              height: context.screenHeight * 0.85,
              child: viewmodel.isProcessing
                  ? CircularProgressIndicator()
                  : AuthenticationPresenter(
                      formType: FormType.login,
                      emailController: viewmodel.emailController,
                      passwordController: viewmodel.passwordController,
                      onButtonTapped: () async {
                        //
                        if (!viewmodel.isProcessing) {
                          await viewmodel.login();
                        }
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
