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
        // TextField with customized decoration
        TextField(
          onChanged: onChanged,
          controller: controller,
          obscureText: isPassword,
          style: AppStyles.bodyText,
          decoration: InputDecoration(
            hintText: title, // Placeholder text
            hintStyle: AppStyles.bodyText, // Hint text style
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: error != null ? AppColors.errorColor : Colors.green,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.secondaryText,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.errorColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        // Error message display
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8.0),
          child: error != null
              ? Text(
                  error!,
                  style: AppStyles.text12PxRegularError,
                )
              : const Text(''),
        )
      ],
    );
  }
}
