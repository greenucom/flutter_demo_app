class TitleScreenModel {
  final String code;

  TitleScreenModel({required this.code});

  TitleScreenModel copy({
    String? code,
  }) {
    return TitleScreenModel(
      code: code ?? this.code,
    );
  }
}
