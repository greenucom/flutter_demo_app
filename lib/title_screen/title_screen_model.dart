class TitleScreenModel {
  final String code;

  TitleScreenModel({this.code = ""});

  bool isCodeEntered() => code.length == _codeMaxLength;

  TitleScreenModel combineWith({
    required TitleScreenModel model,
  }) {
    final newCode = model.code.length <= _codeMaxLength
        ? model.code
        : model.code.substring(0, 3);
    return TitleScreenModel(
      code: newCode,
    );
  }

  static const int _codeMaxLength = 3;
}
