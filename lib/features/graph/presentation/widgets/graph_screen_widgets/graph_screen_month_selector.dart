import 'package:ecommerce_insights/core/utils/constants/colors/app_colors.dart';
import 'package:ecommerce_insights/features/graph/presentation/providers/graph_screen_provider.dart';
import 'package:ecommerce_insights/shared/enums/months.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [GraphScreenMonthSelector]
/// A widget that provides a horizontal list of months for selection.
/// The selected month is highlighted, and tapping a month updates the state
/// in the `GraphScreenProvider` and triggers data fetching.

class GraphScreenMonthSelector extends StatefulWidget {
  /// Constructor for the `GraphScreenMonthSelector`.
  const GraphScreenMonthSelector({super.key});

  @override
  State<GraphScreenMonthSelector> createState() =>
      _GraphScreenMonthSelectorState();
}

class _GraphScreenMonthSelectorState extends State<GraphScreenMonthSelector> {
  @override
  Widget build(BuildContext context) {
    /// Listens to the `GraphScreenProvider` to get the selected month and update the UI.
    return Consumer<GraphScreenProvider>(builder: (context, p, _) {
      return Container(
        /// Adds padding and styling to the month selector container.
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.appLightBlueGrey, // Background color of the container.
          borderRadius: BorderRadius.circular(6), // Rounded corners.
        ),
        height: 40, // Fixed height for the month selector.
        child: ListView.builder(
          /// Builds a horizontal list of month items.
          itemBuilder: (context, index) => _itemBuilder(
            month: Months.values[index],
            onTap: () {
              /// Updates the selected month and triggers data fetching.
              p.selectedMonth = Months.values[index];
              p.fetchData();
            },
            isSelected: p.selectedMonth == Months.values[index],
          ),
          itemCount: Months.values.length, // Total number of months.
          shrinkWrap: true, // Optimizes layout for the child widgets.
          scrollDirection: Axis.horizontal, // Enables horizontal scrolling.
        ),
      );
    });
  }

  /// [itemBuilder]
  /// Builds individual month items for the selector.
  ///
  /// [month] The current month being displayed.
  /// [onTap] The callback when a month is tapped.
  /// [isSelected] Indicates if the current month is selected.
  Widget _itemBuilder({
    required Months month,
    required Function() onTap,
    required bool isSelected,
  }) {
    return GestureDetector(
      /// Triggers the `onTap` callback when the item is tapped.
      onTap: onTap,
      child: Container(
        /// Adds spacing and padding to each month item.
        margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
        padding: const EdgeInsets.all(8),

        /// Applies styling to the item based on its selection state.
        decoration: BoxDecoration(
          color: (!isSelected) ? AppColors.appLightBlueGrey : Colors.white70,
          borderRadius: BorderRadius.circular(6), // Rounded corners for the item.
        ),
        child: Center(
          /// Displays the month's name as text.
          child: Text(
            month.toString().split('.').last, // Extracts the month's name.
            style: TextStyle(
              color: (isSelected) ? Colors.black : Colors.grey.shade600,
              fontWeight: FontWeight.bold, // Bold font for better visibility.
            ),
          ),
        ),
      ),
    );
  }
}
