import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  // final String labelText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Color fillColor;
  final Color borderColor;
  final double borderRadius;

  const CommonTextField({
    Key? key,
    // required this.labelText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.fillColor = Colors.white, // Default fill color
    this.borderColor = Colors.grey, // Default border color
    this.borderRadius = 8.0, // Default border radius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        //labelText: labelText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white, // Background color
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0), // Custom border radius
          borderSide: BorderSide(color: Colors.white), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0), // Custom border radius
          borderSide: BorderSide(color: Colors.white, width: 2.0), // Border color when focused
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0), // Custom border radius
        ),
      ),
    );
  }
}
