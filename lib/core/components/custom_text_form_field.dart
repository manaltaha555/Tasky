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
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: theme.textTheme.bodyMedium),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: TextFormField(
            maxLines: maxLine,
            controller: controller,
            validator: validator,
            style: theme.textTheme.bodyLarge,
            decoration: InputDecoration(
              filled: true,
              fillColor: theme.cardColor,
              hintText: hintText,
              hintStyle: theme.textTheme.bodyLarge!.copyWith(
                color: theme.hintColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.focusColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.focusColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.focusColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: theme.focusColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
