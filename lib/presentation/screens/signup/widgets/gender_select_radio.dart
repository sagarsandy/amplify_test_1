import 'package:amplify_test/presentation/common/widgets/custom_radio.dart';
import 'package:amplify_test/presentation/core/enums/gender.dart';
import 'package:flutter/material.dart';

class GenderSelectRadio extends StatelessWidget {
  const GenderSelectRadio({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final Gender value;
  final ValueChanged<Gender?> onChanged;

  @override
  Widget build(BuildContext context) {
    final widgets = Gender.values
        .map(
          (e) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e.name),
              const SizedBox(width: 10),
              CustomRadio<Gender>(
                value: e,
                groupValue: value,
                onChanged: onChanged,
              ),
            ],
          ),
        )
        .toList();

    return Wrap(
      children: [
        widgets[0],
        const SizedBox(width: 10),
        widgets[1],
        const SizedBox(width: 10),
        widgets[2],
      ],
    );
  }
}
