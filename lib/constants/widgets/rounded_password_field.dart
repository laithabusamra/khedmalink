import 'package:flutter/material.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/constants/widgets/text_filed_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      childe: TextField(
        obscureText: true,
        onChanged: onChanged,
        style: textStyle ?? const TextStyle(color: Color(0xFF1E1E2C)),
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: hintStyle ?? const TextStyle(color: Color(0xFFB0B0C3)),
          icon: const Icon(
            Icons.lock,
            color: buttounColor,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: buttounColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
