import 'package:flutter/material.dart';

Widget metricsPinnedTitle() {
  return  const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 6.0,
    ),
    child: Text.rich(
      TextSpan(
        text: '',
        children: [
          WidgetSpan(child: Icon(Icons.push_pin_outlined, color: Colors.black38, size: 18,)),
          WidgetSpan(child: SizedBox(width: 4)),
          TextSpan(text: 'Pinned Metrics',
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
  ),
  );
}