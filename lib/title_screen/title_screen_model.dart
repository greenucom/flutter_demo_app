class TitleScreenModel {
  final String code;

  TitleScreenModel({this.code = ""});

  TitleScreenModel copy({
    String? code,
  }) {
    return TitleScreenModel(
      code: code ?? this.code,
    );
  }
}
