import 'package:flutter/material.dart';

class AppDropdownButton<T> extends StatelessWidget {
  const AppDropdownButton({
    Key? key,
    this.value,
    this.labelText,
    this.autovalidateMode,
    this.validator,
    this.filled = false,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final T? value;
  final String? labelText;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator? validator;
  final bool filled;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      onChanged: onChanged,
      style: TextStyle(color: filled ? Colors.black : Colors.white),
      dropdownColor: filled ? Colors.white : Colors.black,
      decoration: InputDecoration(
        filled: filled,
        fillColor: Colors.grey.shade200,
        enabledBorder: filled
            ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              )
            : null,
        focusedBorder: filled
            ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              )
            : null,
        hintText: labelText,
        hintStyle: TextStyle(color: filled ? Colors.grey.shade600 : null),
      ),
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
