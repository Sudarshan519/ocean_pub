import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:publication_app/models/authresponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

/// changes status bar color
void changeStatusbarcolor(Color color) async {
  // await FlutterStatusbarcolor.setStatusBarColor(color);
}

showToast(BuildContext context, String message, [var position]) {
  if (message != null) {
    context.showToast(
      msg: "$message",
      // position:
      //     position == null ? VxToastPosition.bottom : VxToastPosition.center,
      bgColor: position != null ? Colors.white : null,
      textColor: position != null ? Colors.black : null,
    );
  }
}

/// applies Navigator.push() method
push(BuildContext context, Widget destination) {
  Route<dynamic> route;
  if (destination != null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    ).then((value) => route = value);
    return route;
  } else {
    print("The destination widget is null.");
  }
}

Route<dynamic> pushNamed(BuildContext context, String destinationId,
    {Object data}) {
  if (destinationId != null) {
    Navigator.pushNamed(context, destinationId, arguments: data);
  } else {
    // Navigator.pushNamed(context, ComingSoon.routeId);
  }
  return null;
}

Route<dynamic> materialPageRoute(Widget destination) {
  if (destination != null) {
    return MaterialPageRoute(builder: (context) => destination);
  } else {
    print("The destination widget is null.");
  }
  return null;
}

/// applies Navigator.pushReplacement() method
void pushReplacement(BuildContext context, Widget destination) {
  if (destination != null) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => destination));
  } else {
    print("The destination widget is null.");
  }
}

/// saves user data to local storage using shared preferences package
Future<void> saveUser(AuthResponse userData) async {
  var map = userData.toMap();
  print(map);
  var instance = await SharedPreferences.getInstance();
  await instance.remove("userProfile");
  var saveData = await instance.setString("userProfile", jsonEncode(map));

  print(saveData ? "Saved" : "Couldnot save");
}

/// if rememberMe value is true then this will save the user data to local storage. otherwise not
Future<void> persistLogin() async {
  var instance = await SharedPreferences.getInstance();
  await instance.setBool("loggedIn", true);
}

Future<void> deleteSavedUser() async {
  var instance = await SharedPreferences.getInstance();
  await instance.remove("userProfile");
  await instance.remove("loggedIn");
}

Future<bool> loginCheck() async {
  var instances = await SharedPreferences.getInstance();
  bool loggedIn = instances.getBool("loggedIn");
  return loggedIn ?? false;
}

Future<AuthResponse> getCachedUser() async {
  dynamic data;
  var instance = await SharedPreferences.getInstance();
  var savedData = instance.getString("userProfile");

  data = savedData != null ? authResponseFromMap(savedData) : null;
  return data;
}
