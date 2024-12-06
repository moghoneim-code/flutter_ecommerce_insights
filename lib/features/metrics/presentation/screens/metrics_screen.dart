import 'package:ecommerce_insights/features/graph/presentation/screens/graph_screen.dart';
import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/metrics_gridview/metrics_grid.dart';
import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/buttons/metrics_screen_showMoreButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/shared/enums/view_state.dart';
import '../../../../core/shared/models/order_model.dart';
import '../../../../core/shared/widgets/grid_placeHolder.dart';
import '../../../../core/utils/constants/colors/app_colors.dart';

import '../../data/data_source/remote/metrics_remote_data_source_impl.dart';
import '../../domain/models/OrderMetrics.dart';
import '../providers/metrics_provider.dart';
import '../widgets/metrics_screen_widgets/titles/metrics_pinned_title.dart';
import '../widgets/metrics_screen_widgets/metrics_screen_appBar.dart';
import '../widgets/metrics_screen_widgets/titles/metrics_screen_title.dart';
import '../widgets/metrics_screen_widgets/searchfields/metrics_search_field.dart';
import '../widgets/metrics_screen_widgets/web_side_bar.dart';

/// [MetricsScreen]
/// This is the main screen for displaying metrics. It initializes a `MetricsProvider`
/// using the `ChangeNotifierProvider`, which is responsible for loading and managing
/// metrics data. The UI is built based on the `MetricsScreenView` class.
class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Creates and provides the `MetricsProvider` to the widget tree.
    /// The `loadMetrics` method is invoked to fetch the initial data.
    return ChangeNotifierProvider(
      create: (context) => MetricsProvider(
        repository: MetricsRemoteDataSourceImpl(),
      )..loadMetrics(),
      child: const MetricsScreenView(),
    );
  }
}

/// [MetricsScreenView]
/// Stateful widget responsible for rendering the UI based on the device type (mobile or web).
/// Utilizes the `MetricsProvider` to dynamically adjust content and layout.
class MetricsScreenView extends StatefulWidget {
  const MetricsScreenView({super.key});

  @override
  State<MetricsScreenView> createState() => _MetricsScreenViewState();
}

class _MetricsScreenViewState extends State<MetricsScreenView> {
  @override
  Widget build(BuildContext context) {
    /// Listens to the `MetricsProvider` and rebuilds the widget tree when state changes.
    return Consumer<MetricsProvider>(builder: (context, p, _) {
      return Scaffold(
        backgroundColor: AppColors.appLightGrey,
        appBar: metricsScreenAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            /// Adjusts the layout based on the screen width.
            /// Displays a sidebar for wider screens (web/desktop) and a simplified layout for mobile.
            if (constraints.maxWidth < 600) {
              return _buildBody(
                state: p.state,
                metrics: p.metrics,
                isWeb: false,
                orders: p.orders,
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Sidebar for web or desktop screens.
                  webSideBar(context: context, orders: p.orders),
                  /// Main content area.
                  Expanded(
                    child: _buildBody(
                      state: p.state,
                      metrics: p.metrics,
                      isWeb: true,
                      orders: p.orders,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      );
    });
  }

  /// [buildBody]
  /// Dynamically builds the content of the screen based on the current `ViewState`.
  Widget _buildBody({
    required ViewState state,
    required OrderMetrics? metrics,
    required List<Order> orders,
    required bool isWeb,
  }) {
    switch (state) {
      case ViewState.loading:
      /// Shows a placeholder grid while metrics are loading.
        return const GridPlaceholder(itemsCount: 3);
      case ViewState.failed:
      /// Displays an error message if metrics fail to load.
        return const Center(child: Text('Failed to load metrics'));
      case ViewState.loaded:
      /// Builds the main content when data is successfully loaded.
        return _widgetsList(metrics: metrics!, isWeb: isWeb, orders: orders);
      default:
      /// Returns an empty widget for unexpected states.
        return const SizedBox();
    }
  }

  /// [widgetsList]
  /// Constructs the list of widgets displayed on the metrics screen.
  /// Includes titles, search fields, grid views, and a "Show More" button.
  Widget _widgetsList({
    required OrderMetrics metrics,
    required bool isWeb,
    required List<Order> orders,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWeb ? 32.0 : 16.0,
      ),
      child: ListView(
        children: [
          /// Title of the metrics screen.
          metricsScreenTitle(),
          const MetricsSearchField(),
          const SizedBox(height: 16),
          metricsPinnedTitle(),
          MetricsGrid(metrics: metrics),
          const SizedBox(height: 16),
          /// Button to navigate to the `GraphScreen` for more insights.
          if (!isWeb)
          metricsScreenShowMoreButton(
            context: context,
            message: 'Display More insights',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GraphScreen(orders: orders),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

