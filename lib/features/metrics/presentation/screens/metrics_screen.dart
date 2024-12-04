import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/enums/view_state.dart';
import '../../data/repositories/data_source/remote/metrics_remote_data_source_impl.dart';
import '../providers/metrics_provider.dart';

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
    return Consumer<MetricsProvider>(builder: (context, p, _ ) {
      return  Scaffold(
        body: Center(
          child: (p.state == ViewState.loading)
              ? const CircularProgressIndicator()
              : (p.state == ViewState.failed)
                  ? Text('Failed to load metrics')
                  : (p.metrics == null)
                      ? Text('No metrics available')
                      : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildMetricCard('Total Orders', p.metrics!.totalOrders.toString()),
                          _buildMetricCard('Total Revenue', '\$${p.metrics!.totalOrders.toStringAsFixed(2)}'),
                          _buildMetricCard('Average Price', '\$${p.metrics!.averagePrice.toStringAsFixed(2)}'),
                          _buildMetricCard('Average Quantity', p.metrics!.returnedOrders.toStringAsFixed(2)),
                        ],
        ),
      ));
    });
  }

  Widget _buildMetricCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18)),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

}
