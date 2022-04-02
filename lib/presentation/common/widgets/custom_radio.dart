import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    const size = 20.0;
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Container(
        height: size,
        width: size,
        decoration: ShapeDecoration(
          color: isSelected ? Colors.green.shade400 : Colors.transparent,
          shape: CircleBorder(
            side: !isSelected
                ? const BorderSide(color: Colors.grey)
                : BorderSide.none,
          ),
        ),
        child: isSelected
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: size * .8,
                  color: Colors.black,
                ),
              )
            : null,
      ),
    );
  }
}
