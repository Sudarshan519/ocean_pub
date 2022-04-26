import 'package:flutter/material.dart';
import 'package:publication_app/base/base_view.dart';
import 'package:publication_app/features/authentication/login/login_viewmodel.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

enum FormType {
  login,
  signup,
}

class AuthenticationPresenter extends StatelessWidget {
  final VoidCallback onButtonTapped;
  final FormType formType;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  AuthenticationPresenter({
    this.onButtonTapped,
    this.formType,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.7,
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.05,
        vertical: context.screenHeight * 0.05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 5.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          textField(
            controller: emailController,
            title: "Email",
            hintText: "user@mail.com",
            onChanged: (value) {
              // print(value);
            },
          ),
          15.heightBox,
          textField(
            controller: passwordController,
            title: "Password",
            obscureText: true,
            hintText: "*" * 7,
            onChanged: (value) {
              // print(value);
            },
          ),
          if (formType == FormType.login) ...[
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  //
                  context.showToast(
                    msg: "Forgot password tapped",
                    position: VxToastPosition.center,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                  child: text(
                    "Forgot password?",
                    textColor: greyColor,
                  ),
                ),
              ),
            ),
          ],
          if (formType == FormType.signup) ...[
            15.heightBox,
            textField(
              controller: confirmPasswordController,
              title: "Confirm Password",
              obscureText: true,
              hintText: "*" * 7,
              onChanged: (value) {
                print(value);
              },
            ),
          ],
          15.heightBox,
          // (context.screenHeight * 0.05).heightBox,

          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              height: 45.0,
              width: context.screenWidth * 0.4,
              child: ElevatedButton(
                onPressed: onButtonTapped,
                child: text(
                  formType == FormType.login ? "Login" : "Signup",
                  textColor: whiteColor,
                  fontSize: context.textTheme.subtitle2.fontSize,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
