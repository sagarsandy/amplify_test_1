import 'package:amplify_test/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AmplifyLogo extends StatelessWidget {
  const AmplifyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Assets.logo.image(
      width: MediaQuery.of(context).size.width * .4,
    );
  }
}
