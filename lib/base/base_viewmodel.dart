import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isProcessing = false;
  bool get isProcessing => _isProcessing;
  
  void setBusy(bool value) {
    _isProcessing = value;
    notifyListeners();
  }
}
