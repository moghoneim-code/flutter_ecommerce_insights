import 'package:flutter/cupertino.dart';

Widget metricsScreenTitle() {
  return const Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 12.0,
    ),
    child: Text(
      'Ecommerce Insights',
      style: TextStyle(
        color: CupertinoColors.black,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}