import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  bool usarTemaDark = false;
  static TemaController instance = TemaController();

  TemaController() {
    usarTemaDark = false;
  }

  trocarTema() {
    usarTemaDark = !usarTemaDark;
    notifyListeners();
  }
}
