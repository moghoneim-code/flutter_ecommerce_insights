import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/metrics_gridview/metrics_card/metrics_responsive_card_impl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../shared/enums/metrics_arrow_direction.dart';
import '../../../../domain/models/OrderMetrics.dart';


class MetricsGrid extends StatelessWidget {
  final OrderMetrics? metrics;

  const MetricsGrid({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Adjust number of columns dynamically based on screen width
    int crossAxisCount = 2; // Default for small screens (mobile)
    double maxGridWidth = 400; // Default max grid width for mobile

    if (screenWidth > 800) {
      crossAxisCount = 4; // Desktop layout
      maxGridWidth = 800;
    } else if (screenWidth > 600) {
      crossAxisCount = 3; // Tablet layout
      maxGridWidth = 600;
    }

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxGridWidth, // Limit grid width
        ),
        child: GridView.builder(
          itemCount: 3, // Adjust based on the number of metrics cards
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Dynamic number of columns
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return _buildMetricsCard(index);
          },
        ),
      ),
    );
  }

  Widget _buildMetricsCard(int index) {
    switch (index) {
      case 0:
        return MetricsCard(
          title: 'Total Orders',
          description: 'Total number of orders',
          value: metrics!.totalOrders.toString(),
          themeColor: Colors.green,
          icon: FontAwesomeIcons.cartPlus,
          arrowColor: Colors.red,
          direction: MetricsArrowDirection.down,
          changePercentage: 12.3,
        );
      case 1:
        return MetricsCard(
          title: 'Average Price',
          description: 'Average price of orders',
          value: '\$ ${metrics!.averagePrice.toStringAsFixed(2)}',
          themeColor: Colors.blue,
          icon: FontAwesomeIcons.dollarSign,
          arrowColor: Colors.green,
          direction: MetricsArrowDirection.up,
          changePercentage: 23,
        );
      case 2:
        return MetricsCard(
          title: 'Returns',
          description: 'Total number of returned orders',
          value: metrics!.returnedOrders.toString(),
          themeColor: Colors.purple,
          icon: FontAwesomeIcons.undo,
          arrowColor: Colors.green,
          direction: MetricsArrowDirection.down,
          changePercentage: 4,
        );
      default:
        return const SizedBox();
    }
  }
}
