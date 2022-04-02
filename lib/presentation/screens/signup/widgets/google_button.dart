import 'package:amplify_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = Size.square(25);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(const StadiumBorder()),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            onPressed: () {
              launch('https://accounts.google.com/signin');
            },
            icon: Assets.google.svg(height: size.height, width: size.width),
            label: const Text(
              'SIGN UP WITH GOOGLE',
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
