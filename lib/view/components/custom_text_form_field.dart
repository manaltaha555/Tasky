import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, 
    this.maxLine,
    this.validator,
    required this.text,
    required this.controller,
    required this.hintText,
  });

  final String text;
  final String hintText;
  final int? maxLine;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: TextFormField(
            maxLines:  maxLine,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFF2A2A2A),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0XFF2A2A2A)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
