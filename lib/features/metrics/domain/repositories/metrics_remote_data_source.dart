

import '../../../../../../shared/models/order_model.dart';

abstract class MetricsRemoteDataSource {
  Future<List<Order>> fetchProjectOrders();

}