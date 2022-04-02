import 'package:amplify_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

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
              backgroundColor:
                  MaterialStateProperty.all(const Color(0XFF027FDC)),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
            onPressed: () {
              launch('https://facebook.com');
            },
            icon: Assets.facebook.svg(height: size.height, width: size.width),
            label: const Text(
              'SIGN UP WITH FACEBOOK',
              style: TextStyle(
                color: Colors.white,
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
