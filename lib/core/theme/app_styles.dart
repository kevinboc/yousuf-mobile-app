import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/core/core.dart';

class AppStyles {
  // Text Styles
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryText,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyText,
  );

  static const TextStyle text12PxRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
  );

  // Error Style Variants
  static TextStyle get headlineError {
    return headline.copyWith(color: AppColors.errorColor);
  }

  static TextStyle get subtitleError {
    return subtitle.copyWith(color: AppColors.errorColor);
  }

  static TextStyle get bodyTextError {
    return bodyText.copyWith(color: AppColors.errorColor);
  }

  static TextStyle get text12PxRegularError {
    return text12PxRegular.copyWith(color: AppColors.errorColor);
  }

  // Padding Styles
  static const EdgeInsets pagePadding = EdgeInsets.all(16.0);
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(
    vertical: 8.0,
    horizontal: 12.0,
  );

  // Button Styles
  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: AppColors.buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  );

  static final ButtonStyle secondaryButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.buttonText,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  );

  // Card Styles
  static const BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4,
        offset: Offset(0, 2),
      ),
    ],
  );

  // Input Field Styles
  static const InputDecoration inputDecoration = InputDecoration(
    hintText: 'Enter your message',
    hintStyle: TextStyle(color: AppColors.hintText),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.secondaryText, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  );
}
