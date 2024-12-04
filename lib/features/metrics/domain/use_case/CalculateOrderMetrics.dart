import '../../../../shared/models/order_model.dart';
import '../models/OrderMetrics.dart';

class CalculateOrderMetrics {
  final List<Order> orders;

  CalculateOrderMetrics(this.orders);

  OrderMetrics execute() {
    final totalOrders = orders.length;
    final totalPrice = orders.fold(0.0, (sum, order) => sum + order.price);
    final averagePrice = totalOrders > 0 ? totalPrice / totalOrders : 0.0;
    final returnedOrders = orders.where((order) => order.status == OrderStatus.RETURNED).length;

    return OrderMetrics(
      totalOrders: totalOrders,
      averagePrice: averagePrice,
      returnedOrders: returnedOrders,
    );
  }
}
