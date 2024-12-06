import 'package:ecommerce_insights/features/graph/domain/models/order_time_series.dart';

import '../../../../core/shared/models/order_model.dart';

/// [CreateChartData]
/// A utility class that processes a list of `Order` objects to generate
/// a list of `OrderTimeSeries` objects for charting purposes.
///
/// The resulting time series aggregates the number of orders by day
/// and ensures the data is sorted chronologically.

class CreateChartData {
  /// The list of orders to be processed.
  final List<Order> orders;

  /// Constructor for `CreateChartData`.
  /// Accepts a list of `Order` objects as input.
  CreateChartData(this.orders);

  /// Processes the orders and generates a list of `OrderTimeSeries` objects.
  ///
  /// - Aggregates the number of orders for each unique day.
  /// - Ensures the data is sorted in chronological order.
  ///
  /// Returns:
  /// - A sorted list of `OrderTimeSeries` objects, where each object
  ///   represents a day and the total number of orders for that day.
  List<OrderTimeSeries> execute() {
    /// Initialize an empty list to hold the time series data.
    final orderTimeSeries = <OrderTimeSeries>[];

    for (var order in orders) {
      /// Check if there is already an entry for the day of the current order.
      if (orderTimeSeries
          .any((element) => element.date.day == order.registered.day)) {
        /// Find the index of the existing entry and increment its order count.
        final index = orderTimeSeries
            .indexWhere((element) => element.date.day == order.registered.day);
        orderTimeSeries[index].orderCount++;
      } else {
        /// Add a new entry for the day if it doesn't exist in the time series.
        orderTimeSeries.add(OrderTimeSeries(
          order.registered,
          1, // Initial order count for the new day.
        ));
      }
    }

    /// Sort the time series data by date .
    orderTimeSeries.sort((a, b) => a.date.compareTo(b.date));

    return orderTimeSeries;
  }
}
