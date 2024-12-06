import 'package:ecommerce_insights/features/graph/domain/models/order_time_series.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

/// [OrderChartWidget]
/// A widget that displays a line chart for order data using the `Syncfusion` chart library.
/// The chart visualizes the number of orders (`OrderTimeSeries.orderCount`) over time (`OrderTimeSeries.date`).
/// It includes a tooltip for data points and an icon overlay for context.

class OrderChartWidget extends StatelessWidget {
  /// The list of time-series data points to be plotted on the chart.
  final List<OrderTimeSeries> data;

  /// Constructor for `OrderChartWidget`.
  /// Requires a list of `OrderTimeSeries` objects as input.
  const OrderChartWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      /// Styles the chart container with rounded corners and a light background.
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          /// [SfCartesianChart]
          /// The main chart component. Configured with a line series for time-series data visualization.
          SfCartesianChart(
            plotAreaBorderWidth: 0, // Removes border around the chart area.
            tooltipBehavior: TooltipBehavior(
              enable: true,
              header: '',
              format: 'Date: point.x \nOrders: point.y', // Tooltip format.
            ),
            primaryXAxis: DateTimeAxis(
              edgeLabelPlacement: EdgeLabelPlacement.shift, // Prevents label overlap.
              labelStyle: TextStyle(
                color: Colors.grey.shade600, // X-axis label color.
                fontSize: 12, // X-axis label font size.
              ),
              majorGridLines: const MajorGridLines(width: 0), // Hides grid lines.
              dateFormat: DateFormat('dd MMM'), // Formats dates as 'day month'.
              axisLine: AxisLine(
                dashArray: [5, 5], // Dashed X-axis styling.
                color: Colors.grey.shade600, // X-axis color.
                width: 1, // X-axis line width.
              ),
            ),
            primaryYAxis: const NumericAxis(
              isVisible: false, // Y-axis is hidden for simplicity.
            ),
            series: <CartesianSeries<OrderTimeSeries, DateTime>>[
              /// [LineSeries]
              /// Represents the time-series data as a line chart.
              LineSeries<OrderTimeSeries, DateTime>(
                dataSource: data, // The list of time-series data points.
                xValueMapper: (OrderTimeSeries data, int index) => data.date, // Maps the X-axis value.
                yValueMapper: (OrderTimeSeries data, int index) =>
                data.orderCount, // Maps the Y-axis value.
                color: Colors.black87, // Line color.
                width: 2, // Line width.
                markerSettings: const MarkerSettings(
                  isVisible: true, // Shows markers at data points.
                  shape: DataMarkerType.circle, // Marker shape.
                  color: Colors.white, // Marker fill color.
                  borderWidth: 2, // Marker border width.
                  borderColor: Colors.black87, // Marker border color.
                ),
              ),
            ],
          ),

          /// [Positioned]
          /// A floating icon positioned in the top-right corner of the chart for additional context.
          Positioned(
            top: 12, // Vertical offset from the top.
            right: 12, // Horizontal offset from the right.
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1), // Light green background.
                borderRadius: BorderRadius.circular(8), // Rounded corners.
              ),
              child: Icon(
                Icons.shopping_cart_outlined, // Icon representing orders or sales.
                color: Colors.green.shade700, // Icon color.
                size: 26, // Icon size.
              ),
            ),
          )
        ],
      ),
    );
  }
}
