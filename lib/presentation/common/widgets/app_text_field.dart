import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.controller,
    this.password = false,
    this.labelText,
    this.autovalidateMode,
    this.validator,
    this.filled = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool password;
  final String? labelText;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator? validator;
  final bool filled;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool hideText;

  @override
  void initState() {
    super.initState();
    hideText = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: widget.filled ? Colors.black : Colors.white),
      cursorColor: widget.filled ? Colors.grey.shade600 : null,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: Colors.grey.shade200,
        enabledBorder: widget.filled
            ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              )
            : null,
        focusedBorder: widget.filled
            ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
              )
            : null,
        labelText: widget.labelText,
        labelStyle:
            TextStyle(color: widget.filled ? Colors.grey.shade600 : null),
        suffixIcon: widget.password
            ? _PasswordIcon(
                dark: widget.filled,
                onTap: () => setState(() => hideText = !hideText),
                hide: hideText,
              )
            : null,
      ),
      obscureText: hideText,
      autovalidateMode: widget.autovalidateMode,
      validator: widget.validator,
    );
  }
}

class _PasswordIcon extends StatelessWidget {
  const _PasswordIcon({
    Key? key,
    required this.dark,
    required this.onTap,
    required this.hide,
  }) : super(key: key);

  final bool dark;
  final VoidCallback onTap;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    Color color;
    if (!hide) {
      color = dark
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary;
    } else {
      color = dark ? Colors.grey : Colors.white;
    }

    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.remove_red_eye,
        color: color,
      ),
    );
  }
}
