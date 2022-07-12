import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/DemoAppColors.dart';
import 'package:flutter_demo_app/DemoAppStrings.dart';
import 'package:flutter_demo_app/title_screen/title_screen_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TitleScreenViewModel(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              children: const [
                _TopBar(),
                _WelcomeText(),
                _CodeRow(),
                _StartNewButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class _TopBar extends StatelessWidget {
  const _TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/svgs/options_horizontal.svg",
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Text(
        DemoAppStrings.welcomeText,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CodeRow extends StatelessWidget {
  const _CodeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 56.0, right: 16.0),
      child: Row(
        children: const [
          Flexible(
            flex: 20,
            child: _CodeTextField(code: "876"),
          ),
          Spacer(flex: 1),
          Flexible(
            flex: 10,
            child: _JoinButton(),
          ),
        ],
      ),
    );
  }
}

class _CodeTextField extends StatelessWidget {
  final String code;

  const _CodeTextField({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TitleScreenViewModel>(context);
    return TextField(
      onChanged: (newCode) {
        viewModel.onCodeChanged(newCode);
      },
      inputFormatters: [LengthLimitingTextInputFormatter(3)],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      cursorColor: DemoAppColors.primaryBlue,
      autocorrect: false,
      style: const TextStyle(
        fontSize: 19.0,
        fontWeight: FontWeight.w400,
        color: DemoAppColors.textOnGray,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: DemoAppColors.containerGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: DemoAppColors.containerGray, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: DemoAppColors.containerGray, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: DemoAppColors.containerGray, width: 0.0),
        ),
        hintText: DemoAppStrings.inviteCode,
        hintMaxLines: 1,
        hintStyle: const TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w400,
          color: DemoAppColors.textOnGray,
        ),
      ),
    );
  }
}

class _JoinButton extends StatelessWidget {
  const _JoinButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TitleScreenViewModel>(context);
    return MaterialButton(
      onPressed: viewModel.isCodeEntered() ? () {} : null,
      color: DemoAppColors.primaryBlue,
      disabledColor: DemoAppColors.containerGray,
      height: 64.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      minWidth: double.infinity,
      textColor: Colors.white,
      disabledTextColor: DemoAppColors.textOnGrayDisabled,
      child: const Text(
        DemoAppStrings.join,
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _StartNewButton extends StatelessWidget {
  const _StartNewButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 32.0, right: 16.0),
      child: MaterialButton(
        onPressed: () {},
        color: DemoAppColors.primaryBlue,
        disabledColor: DemoAppColors.containerGray,
        height: 64.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0,
        minWidth: double.infinity,
        textColor: Colors.white,
        disabledTextColor: DemoAppColors.textOnGrayDisabled,
        child: const Text(
          DemoAppStrings.startNew,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
