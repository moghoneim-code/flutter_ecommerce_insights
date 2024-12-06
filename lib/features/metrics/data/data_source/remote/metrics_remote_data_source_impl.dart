import 'package:ecommerce_insights/core/utils/constants/strings/local_path_strings.dart';
import 'package:flutter/services.dart';

import '../../../../../core/shared/models/order_model.dart';
import '../../../domain/repositories/metrics_remote_data_source.dart';

/// [MetricsRemoteDataSourceImpl]
/// An implementation of the `MetricsRemoteDataSource` interface.
/// This class fetches project order data from a local JSON file (simulating a remote data source).
/// The data is loaded asynchronously and parsed into a list of `Order` objects.

class MetricsRemoteDataSourceImpl implements MetricsRemoteDataSource {
  /// Fetches project orders from a local JSON file.
  ///
  /// Simulates a delay to mimic a network request, then loads the JSON string
  /// from the asset path defined in `LocalPathStrings.orders`.
  /// Parses the JSON string into a list of `Order` objects.
  ///
  /// Returns a `Future` containing the list of `Order` objects.
  @override
  Future<List<Order>> fetchProjectOrders() async {
    /// Simulates network delay.
    await Future.delayed(const Duration(seconds: 3));

    /// Loads the JSON string from the specified local file.
    final jsonString = await rootBundle.loadString(LocalPathStrings.orders);

    /// Parses the JSON string into a list of `Order` objects.
    final orders = Order.parseOrders(jsonString);

    /// Returns the parsed list of orders.
    return orders;
  }
}

