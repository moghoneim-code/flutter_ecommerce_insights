import 'package:flutter/material.dart';


Widget metricsScreenShowMoreButton({
  required BuildContext context,
  required String message,
  required Function() onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}