import 'package:flutter/material.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

class CustomLoginTextField extends StatelessWidget {
  final String hintTextL;
  final TextEditingController ctrl;
  final String? Function(String?)? validation;
  final bool obscureText;
  final TextInputType? type;
  final int? maxLength;
  const CustomLoginTextField({
    Key? key,
    required this.hintTextL,
    required this.ctrl,
    this.validation,
    this.obscureText = false,
    this.type,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      controller: ctrl,
      obscureText: obscureText,
      keyboardType: type,
      maxLength: maxLength,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.toWidth,
          vertical: 12.toHeight,
        ),
        hintText: hintTextL,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 16.toFont,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 16.toFont,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
