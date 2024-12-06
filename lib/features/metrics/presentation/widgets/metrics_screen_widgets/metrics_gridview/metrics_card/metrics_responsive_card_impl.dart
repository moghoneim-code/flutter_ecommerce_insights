import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/enums/metrics_arrow_direction.dart';
import 'metrics_responsive_card.dart';

class MetricsCard extends ResponsiveCard {
  final String title;
  final String value;
  final Color themeColor;
  final IconData icon;
  final String description;
  final MetricsArrowDirection direction;
  final Color arrowColor;
  final double changePercentage;

  const MetricsCard({
    super.key,
    required this.title,
    required this.value,
    required this.themeColor,
    required this.icon,
    required this.description,
    required this.direction,
    required this.arrowColor,
    required this.changePercentage,
  });

  @override
  Widget buildWideLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: themeColor,
                size: 26,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  '${changePercentage.toStringAsFixed(2)}%',
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  direction == MetricsArrowDirection.up
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: arrowColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: themeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: themeColor,
            size: 26,
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                value,
                maxLines: 1,
                maxFontSize: 24,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AutoSizeText(
                  '${changePercentage.toStringAsFixed(2)}%',
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  direction == MetricsArrowDirection.up
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: arrowColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
