import '../../../../shared/models/order_model.dart';
import '../models/OrderMetrics.dart';

/// [CalculateOrderMetrics]
/// A utility class responsible for calculating various metrics from a list of orders.
/// This class takes in a list of `Order` objects and computes:
/// - Total number of orders
/// - Average price of orders
/// - Total number of returned orders

class CalculateOrderMetrics {
  /// The list of orders used to calculate metrics.
  final List<Order> orders;

  /// Constructor for `CalculateOrderMetrics`.
  /// Accepts a list of `Order` objects.
  CalculateOrderMetrics(this.orders);

  /// Executes the metric calculations and returns an `OrderMetrics` object
  /// containing the results.
  ///
  /// - **Total Orders:** The total number of orders in the list.
  /// - **Average Price:** The average price of the orders.
  /// - **Returned Orders:** The total number of orders with a status of `RETURNED`.
  ///
  /// Returns:
  /// - An `OrderMetrics` object containing the calculated metrics.
  OrderMetrics execute() {
    /// Calculate the total number of orders.
    final totalOrders = orders.length;

    /// Calculate the total price of all orders.
    final totalPrice = orders.fold(0.0, (sum, order) => sum + order.price);

    /// Calculate the average price, ensuring there are no division by zero errors.
    final averagePrice = totalOrders > 0 ? totalPrice / totalOrders : 0.0;

    /// Count the number of returned orders.
    final returnedOrders = orders.where((order) => order.status == OrderStatus.RETURNED).length;

    /// Return the calculated metrics as an `OrderMetrics` object.
    return OrderMetrics(
      totalOrders: totalOrders,
      averagePrice: averagePrice,
      returnedOrders: returnedOrders,
    );
  }
}

