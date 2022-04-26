import 'package:flutter/material.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/features/authentication/authentication_widgets.dart';
import 'package:publication_app/features/dashboard/homepage/homepage_view.dart';
import 'package:publication_app/utils/functions.dart';
import 'signup_viewmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupView extends StatelessWidget {
  static const routeId = "SignupView";
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SignupViewModel>(
      viewModel: SignupViewModel(),
      builder: (context, viewmodel, _) {
        return Scaffold(
          key: viewmodel.scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.bottomCenter,
            height: context.screenHeight * 0.85,
            child: viewmodel.isProcessing
                ? Container(
                    color: Colors.white, child: CircularProgressIndicator())
                : AuthenticationPresenter(
                    formType: FormType.signup,
                    emailController: viewmodel.emailController,
                    passwordController: viewmodel.passwordController,
                    confirmPasswordController:
                        viewmodel.confirmPasswordController,
                    onButtonTapped: () async {
                      //
                      if (!viewmodel.isProcessing) {
                        await viewmodel.signup();
                      }
                    },
                  ),
          ),
        );
      },
    );
  }
}
