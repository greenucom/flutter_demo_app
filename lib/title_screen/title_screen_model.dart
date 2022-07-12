class TitleScreenModel {
  final String code;

  TitleScreenModel({this.code = ""});

  static const int codeMaxLength = 3;

  bool isCodeEntered() => code.length == codeMaxLength;

  TitleScreenModel copy({
    required String code,
  }) {
    final newCode = code.substring(0, 4);
    return TitleScreenModel(code: newCode);
  }
}
