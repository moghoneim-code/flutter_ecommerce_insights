import 'package:ecommerce_insights/core/utils/constants/colors/app_colors.dart';
import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/metrics_gridview/metrics_card/metrics_responsive_card_impl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../core/shared/enums/metrics_arrow_direction.dart';
import '../../../../domain/models/OrderMetrics.dart';


/// [MetricsGrid]
/// This widget displays a responsive grid of metric cards. The grid layout adjusts
/// dynamically based on the screen width (mobile, tablet, or desktop).
///
/// It utilizes `OrderMetrics` data to populate the cards with metrics such as
/// Total Orders, Average Price, and Returns.
class MetricsGrid extends StatelessWidget {
  /// The metrics data used to populate the grid.
  final OrderMetrics? metrics;

  /// Constructor for the `MetricsGrid` widget.
  /// Accepts an `OrderMetrics` object as input.
  const MetricsGrid({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    /// Fetches the screen width to determine the grid layout.
    final screenWidth = MediaQuery.of(context).size.width;

    /// Variables to determine the number of columns and maximum grid width
    /// based on the screen size.
    int crossAxisCount = 2;

    /// Default number of columns for mobile grid
    double maxGridWidth = 400;

    /// Default grid width for mobile

    if (screenWidth > 800) {
      crossAxisCount = 4;
      maxGridWidth = 800;

      /// Layout for web
    } else if (screenWidth > 600) {
      crossAxisCount = 3;
      maxGridWidth = 600;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxGridWidth, // Restricts grid width
        ),
        child: GridView.builder(
          /// Limits the number of items in the grid to three for simplicity.
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            /// Builds a metric card based on the index.
            return _buildMetricsCard(index);
          },
        ),
      ),
    );
  }

  /// [buildMetricsCard]
  /// Creates a metric card widget based on the provided index.
  ///
  /// Each card displays:
  /// - A title
  /// - A description
  /// - A metric value
  /// - An icon
  /// - A percentage change indicator with an arrow
  Widget _buildMetricsCard(int index) {
    switch (index) {
      case 0:
        return MetricsCard(
          title: 'Total Orders',
          description: 'Total number of orders',
          value: metrics!.totalOrders.toString(),
          themeColor: AppColors.appGreenColor,
          icon: FontAwesomeIcons.cartPlus,
          arrowColor: AppColors.appRedColor,
          direction: MetricsArrowDirection.down,
          changePercentage: 12.3,
        );
      case 1:
        return MetricsCard(
          title: 'Average Price',
          description: 'Average price of orders',
          value: '\$ ${metrics!.averagePrice.toStringAsFixed(2)}',
          themeColor: AppColors.appOrangeColor,
          icon: FontAwesomeIcons.dollarSign,
          arrowColor: AppColors.appGreenColor,
          direction: MetricsArrowDirection.up,
          changePercentage: 23,
        );
      case 2:
        return MetricsCard(
          title: 'Returns',
          description: 'Total number of returned orders',
          value: metrics!.returnedOrders.toString(),
          themeColor: AppColors.appPurpleColor,
          icon: FontAwesomeIcons.undo,
          arrowColor: AppColors.appGreenColor,
          direction: MetricsArrowDirection.down,
          changePercentage: 4,
        );
      default:
        /// Returns an empty widget for any unexpected index.
        return const SizedBox();
    }
  }
}
