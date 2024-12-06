import 'package:flutter/material.dart';

/// [ResponsiveCard]
/// An abstract base class for creating responsive cards that adapt their layout
/// based on the screen width (wide or narrow screens).
///
/// Developers can extend this class to define the behavior and design of the card
/// for both wide and narrow layouts.
abstract class ResponsiveCard extends StatelessWidget {
  /// Constructor for `ResponsiveCard`.
  const ResponsiveCard({super.key});

  /// Method to build the layout for wide screens (e.g., Web).
  /// Must be implemented by subclasses.
  Widget buildWideLayout(BuildContext context);

  /// Method to build the layout for narrow screens (e.g., phones).
  /// Must be implemented by subclasses.
  Widget buildNarrowLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    /// Retrieves the screen width to determine the layout type.
    final screenWidth = MediaQuery.of(context).size.width;

    /// Determines if the screen is considered "wide" (greater than 600px).
    final isWideScreen = screenWidth > 600;

    return Card(
      /// Sets the elevation of the card to 0 for a flat design.
      elevation: 0,
      /// Applies a rounded border to the card.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      /// Adds padding around the card content.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        /// Chooses the layout (wide or narrow) based on screen width.
        child: isWideScreen
            ? buildWideLayout(context)
            : buildNarrowLayout(context),
      ),
    );
  }
}
