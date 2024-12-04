import 'package:ecommerce_insights/core/utils/constants/strings/local_path_strings.dart';
import 'package:ecommerce_insights/shared/models/order_model.dart';
import 'package:flutter/services.dart';
import '../../../../domain/repositories/metrics_remote_data_source.dart';

class MetricsRemoteDataSourceImpl implements MetricsRemoteDataSource {


  @override
  Future<List<Order>> fetchProjectOrders() async {
    await Future.delayed(const Duration(seconds: 3));
    final jsonString = await rootBundle.loadString(LocalPathStrings.orders);
    final orders = Order.parseOrders(jsonString);
    return orders;
  }
}
