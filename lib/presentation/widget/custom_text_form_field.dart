import 'package:flutter/material.dart';

class CustomTextFormFields extends StatelessWidget {
  const CustomTextFormFields({
    super.key,
    required this.title,
    this.validator,

    this.maxLines,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF858597),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          style: Theme.of(context).textTheme.labelMedium,

          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff1F1F39),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xffB8B8D2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xffB8B8D2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Color(0xffB8B8D2)),
            ),
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          maxLines: obscureText ? 1 : null,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
