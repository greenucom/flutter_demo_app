import 'package:flutter/material.dart';
import 'package:flutter_demo_app/title_screen/title_screen_model.dart';

class TitleScreenViewModel extends ChangeNotifier {
  var _state = TitleScreenModel();

  TitleScreenModel get state => _state;
  set state(TitleScreenModel value) {
    _state = _state.combineWith(model: value);
    notifyListeners();
  }

  bool isCodeEntered() => _state.isCodeEntered();

  void onCodeChanged(String code) {
    final model = TitleScreenModel(code: code);
    state = model;
    notifyListeners();
  }
}
