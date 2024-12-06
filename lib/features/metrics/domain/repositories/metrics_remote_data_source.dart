import '../../../../../../shared/models/order_model.dart';

/// [MetricsRemoteDataSource]
/// An abstract class that defines the contract for fetching project orders.
/// This interface is implemented by concrete classes to provide data from
/// various sources (e.g., remote APIs, local files).

abstract class MetricsRemoteDataSource {
  /// Fetches the project orders.
  ///
  /// This method returns a `Future` containing a list of `Order` objects.
  /// Implementing classes are responsible for providing the actual data source
  /// and fetching logic.
  Future<List<Order>> fetchProjectOrders();
}