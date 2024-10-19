// Packages
import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/core/core.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.error,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final String? error;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the TextField
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: AppStyles.bodyText.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ),
        // TextField with customized decoration
        TextField(
          onChanged: onChanged,
          controller: controller,
          obscureText: isPassword,
          style: AppStyles.bodyText,
          decoration: InputDecoration(
            hintText: 'Enter your message', // Placeholder text
            hintStyle: AppStyles.text12PxRegular, // Hint text style
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: error != null
                    ? AppColors.errorColor
                    : AppColors.primaryColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.secondaryText,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        // Error message display
        if (error != null && error!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              error!,
              style: AppStyles.text12PxRegularError,
            ),
          ),
      ],
    );
  }
}
