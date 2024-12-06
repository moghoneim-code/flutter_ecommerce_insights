import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../../shared/enums/metrics_arrow_direction.dart';
import 'metrics_responsive_card.dart';

/// [MetricsCard]
/// A widget that extends the `ResponsiveCard` to display metrics in a responsive layout.
/// The card adapts its design to wide and narrow screen layouts.
///
/// Each card displays:
/// - An icon with a themed background
/// - A title and description
/// - A metric value
/// - A percentage change indicator with an arrow pointing up or down
class MetricsCard extends ResponsiveCard {
  /// The title displayed on the card.
  final String title;

  /// The value of the metric displayed on the card.
  final String value;

  /// The theme color used for the icon and background.
  final Color themeColor;

  /// The icon displayed on the card.
  final IconData icon;

  /// A brief description of the metric.
  final String description;

  /// The direction of the arrow (up or down) indicating change.
  final MetricsArrowDirection direction;

  /// The color of the arrow.
  final Color arrowColor;

  /// The percentage change in the metric.
  final double changePercentage;

  /// Constructor for the `MetricsCard`.
  /// Requires all properties to be provided.
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

  /// [buildWideLayout]
  /// Builds the layout for wide screens (e.g., tablets or desktops).
  /// Displays the card content in a compact and horizontally-aligned manner.
  @override
  Widget buildWideLayout(BuildContext context) {
    return Column(
      children: [
        /// Icon with themed background.
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

        /// Title of the metric.
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),

        /// Description of the metric.
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

        /// Metric value and percentage change indicator.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
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

  /// [buildNarrowLayout]
  /// Builds the layout for narrow screens (e.g., phones).
  /// Displays the card content in a vertically-aligned manner with more spacing.
  @override
  Widget buildNarrowLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Icon with themed background.
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

        /// Title of the metric.
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),

        /// Description of the metric.
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),

        /// Metric value and percentage change indicator.
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                value,
                maxLines: 1,
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
                    fontSize: 12,
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
