import 'package:flutter/material.dart';
import 'package:flutter_demo_app/title_screen/title_screen_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TitleScreenViewModel(),
      child: Consumer<TitleScreenViewModel>(builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                _TopBar(),
                _WelcomeText(),
              ],
            ),
          ),
        );
      }),
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
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/svgs/options_horizontal.svg",
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

const _welcomeText = "Hello! ✌\nWelcome to demo video call 🤙";
class _WelcomeText extends StatelessWidget {
  const _WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 32.0, top: 16.0, right: 32.0),
      child: Text(
        _welcomeText,
        style: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
