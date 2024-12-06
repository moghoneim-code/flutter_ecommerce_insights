import 'package:ecommerce_insights/core/utils/constants/colors/app_colors.dart';
import 'package:ecommerce_insights/features/graph/presentation/widgets/graph_screen_widgets/graph_screen_appBar.dart';
import 'package:ecommerce_insights/features/graph/presentation/widgets/graph_screen_widgets/graph_screen_monthly_sales_title.dart';
import 'package:flutter/material.dart';
import '../../../../core/shared/models/order_model.dart';
import '../providers/graph_screen_provider.dart';
import '../widgets/graph_screen_widgets/graph_screen_chart_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/graph_screen_widgets/graph_screen_month_selector.dart';

/// [GraphScreen]
/// This is the main entry point for the graph screen, which visualizes order data.
/// It initializes the `GraphScreenProvider` to fetch and manage the required data.
/// The `orders` list is passed to the provider for processing.
class GraphScreen extends StatelessWidget {
  /// List of orders passed from the previous screen to generate graph data.
  final List<Order> orders;

  /// Constructor for `GraphScreen`.
  /// Requires a list of `Order` objects to process and display in the graph.
  const GraphScreen({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    /// Provides the `GraphScreenProvider` to the widget tree, initializing it with the `orders` list.
    return ChangeNotifierProvider(
      create: (context) => GraphScreenProvider(orders)..fetchData(),
      child: const GraphScreenView(),
    );
  }
}

/// [GraphScreenView]
/// The main UI for the graph screen. This widget listens to the `GraphScreenProvider`
/// and rebuilds the UI when data changes.
class GraphScreenView extends StatefulWidget {
  /// Constructor for `GraphScreenView`.
  const GraphScreenView({super.key});

  @override
  State<GraphScreenView> createState() => _GraphScreenViewState();
}

class _GraphScreenViewState extends State<GraphScreenView> {
  @override
  Widget build(BuildContext context) {
    /// Listens to the `GraphScreenProvider` to reflect updates in the UI.
    return Consumer<GraphScreenProvider>(builder: (context, p, _) {
      return Scaffold(
        /// Custom app bar for the graph screen.
        appBar: graphScreenAppBar(context),
        backgroundColor: AppColors.appLightGrey,

        /// Main content of the screen.
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// Dropdown or selector for choosing the month.
              const GraphScreenMonthSelector(),

              /// Displays the title for the graph section.
              graphScreenMonthlySalesTitle('Monthly Sales'),

              /// Displays the graph using `OrderChartWidget`.
              Expanded(
                child: OrderChartWidget(
                  data: p.chartData, // Data for the chart provided by the provider.
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

