import 'package:flutter/material.dart';
import 'package:publication_app/features/authentication/signup/signup_view.dart';
import 'package:publication_app/utils/assets.dart';
import 'package:publication_app/utils/colors.dart';
import 'package:publication_app/utils/widgets.dart';

import 'package:velocity_x/velocity_x.dart';

import 'login/login_view.dart';

class AuthPresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: whiteColor,
            image: DecorationImage(
              image: AssetImage(authBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: context.screenHeight * 0.15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              //
              children: [
                assetimage(logo, height: context.screenHeight * 0.1),
                (context.screenHeight * 0.05).heightBox,
                customButton(
                  context,
                  buttonTitle: "Login",
                  dialogWidget: LoginView(),
                ),
                15.heightBox,
                customButton(
                  context,
                  buttonTitle: "Signup",
                  showBorder: true,
                  dialogWidget: SignupView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell customButton(
    BuildContext context, {
    String buttonTitle,
    Widget dialogWidget,
    bool showBorder = false,
  }) {
    return InkWell(
      onTap: () {
        //

        showGeneralDialog(
          context: context,
          pageBuilder: (_, __, ___) {
            return Align(
              alignment: Alignment.bottomLeft,
              child: dialogWidget,
            );
          },
        );
      },
      child: Container(
        height: context.screenHeight * 0.05,
        width: context.screenWidth * 0.45,
        child: Center(
          child: text(
            "$buttonTitle",
            textColor: showBorder ? whiteColor : colorPrimary,
            fontSize: context.textTheme.subtitle1.fontSize,
            fontweight: FontWeight.w600,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: whiteColor, width: 2.0),
          color: showBorder ? null : whiteColor,
          borderRadius: BorderRadius.circular(context.safePercentHeight * 2),
        ),
      ),
    );
  }
}
