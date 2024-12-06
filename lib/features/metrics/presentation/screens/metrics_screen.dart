import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/metrics_gridview/metrics_grid.dart';
import 'package:ecommerce_insights/features/metrics/presentation/widgets/metrics_screen_widgets/buttons/metrics_screen_showMoreButton.dart';
import 'package:ecommerce_insights/shared/widgets/grid_placeHolder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants/colors/app_colors.dart';
import '../../../../shared/enums/view_state.dart';
import '../../data/data_source/remote/metrics_remote_data_source_impl.dart';
import '../../domain/models/OrderMetrics.dart';
import '../providers/metrics_provider.dart';
import '../widgets/metrics_screen_widgets/titles/metrics_pinned_title.dart';
import '../widgets/metrics_screen_widgets/metrics_screen_appBar.dart';
import '../widgets/metrics_screen_widgets/titles/metrics_screen_title.dart';
import '../widgets/metrics_screen_widgets/searchfields/metrics_search_field.dart';

class MetricsScreen extends StatelessWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MetricsProvider(
        repository: MetricsRemoteDataSourceImpl(),
      )..loadMetrics(),
      child: const MetricsScreenView(),
    );
  }
}

class MetricsScreenView extends StatefulWidget {
  const MetricsScreenView({super.key});

  @override
  State<MetricsScreenView> createState() => _MetricsScreenViewState();
}

class _MetricsScreenViewState extends State<MetricsScreenView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MetricsProvider>(builder: (context, p, _) {
      return Scaffold(
        backgroundColor: AppColors.appLightGrey,
        appBar: metricsScreenAppBar(),
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Adjust layout based on screen width
            if (constraints.maxWidth < 600) {
              // Mobile Layout
              return _buildBody(
                  state: p.state, metrics: p.metrics, isWeb: false);
            } else {
              // Web/Desktop Layout
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar for web or desktop (if needed)
                  Container(
                    width: 250,
                    color: Colors.grey[200],
                    child: Center(
                      child: Text(
                        'Sidebar Content',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildBody(
                        state: p.state, metrics: p.metrics, isWeb: true),
                  ),
                ],
              );
            }
          },
        ),
      );
    });
  }

  Widget _buildBody(
      {required ViewState state,
      required OrderMetrics? metrics,
      required bool isWeb}) {
    switch (state) {
      case ViewState.loading:
        return const GridPlaceholder(itemsCount: 3);
      case ViewState.failed:
        return const Center(child: Text('Failed to load metrics'));
      case ViewState.loaded:
        return _widgetsList(metrics: metrics!, isWeb: isWeb);
      default:
        return const SizedBox();
    }
  }

  Widget _widgetsList({required OrderMetrics metrics, required bool isWeb}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isWeb ? 32.0 : 16.0, // Wider padding for web
      ),
      child: ListView(
        children: [
          metricsScreenTitle(),
          const MetricsSearchField(),
          const SizedBox(height: 16),
          metricsPinnedTitle(),
          MetricsGrid(metrics: metrics),
          const SizedBox(height: 16),
          metricsScreenShowMoreButton(
            context: context,
            message: 'Display More insights',
            onPressed: () {
              // Action for "Show More Insights" button
            },
          ),
        ],
      ),
    );
  }
}
