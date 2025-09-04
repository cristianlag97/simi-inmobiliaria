import 'package:flutter/material.dart';
import 'package:simi_inmobiliaria/core/config/constans/constants.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.label,
    this.isPassword = false,
    this.obscureText,
    this.onToggleVisibility,
    this.errorMessage,
    this.onChanged,
  });

  final String label;
  final bool isPassword;
  final bool? obscureText;
  final VoidCallback? onToggleVisibility;
  final String? errorMessage;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ? obscureText ?? true : false,
      style: const TextStyle(color: SimiColors.white),
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorMessage,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: SimiColors.redshade),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: SimiColors.redshade),
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: SimiColors.white.withValues(alpha: 0.2),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: SimiColors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    obscureText == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: onToggleVisibility,
                )
                : null,
      ),
    );
  }
}
