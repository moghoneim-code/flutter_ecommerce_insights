import 'package:flutter/material.dart';

Widget metricsScreenShowMoreButton({
  required BuildContext context,
  required String message,
  required Function() onPressed,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  // Adjust the button's padding and width based on the screen size
  final isWideScreen = screenWidth > 600;
  final double buttonWidth = isWideScreen ? 300 : double.infinity; // Full width for mobile, fixed width for web/desktop

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: Size(buttonWidth, 50), // Adjust width dynamically
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
