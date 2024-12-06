import 'package:flutter/material.dart';

abstract class ResponsiveCard extends StatelessWidget {
  const ResponsiveCard({super.key});

  Widget buildWideLayout(BuildContext context);

  Widget buildNarrowLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWideScreen
            ? buildWideLayout(context)
            : buildNarrowLayout(context),
      ),
    );
  }
}
