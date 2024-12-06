import 'dart:developer';

import 'package:ecommerce_insights/shared/enums/view_state.dart';
import 'package:ecommerce_insights/shared/models/order_model.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/models/OrderMetrics.dart';
import '../../domain/repositories/metrics_remote_data_source.dart';
import '../../domain/use_case/CalculateOrderMetrics.dart';

/// [MetricsProvider]
/// This class acts as a provider for managing the state and data of the metrics screen.
/// It uses the `ChangeNotifier` to notify listeners about state changes, ensuring the UI is updated accordingly.
/// The provider fetches orders, calculates metrics, and exposes these to the UI layer.
class MetricsProvider extends ChangeNotifier {
  /// Repository for fetching order data from a remote data source.
  final MetricsRemoteDataSource? repository;

  /// Stores the calculated metrics for orders.
  OrderMetrics? _metrics;

  /// Exposes the calculated metrics to the UI layer.
  OrderMetrics? get metrics => _metrics;

  /// Current state of the view (e.g., loading, loaded, failed).
  ViewState _state = ViewState.initial;

  /// List of orders fetched from the repository.
  List<Order> _orders = [];

  /// Exposes the list of fetched orders to the UI layer.
  List<Order> get orders => _orders;

  /// Exposes the current state of the view to the UI layer.
  ViewState get state => _state;

  /// Constructor for the `MetricsProvider`.
  /// Requires a repository instance to fetch data.
  MetricsProvider({required this.repository});

  /// Fetches metrics data and updates the state accordingly.
  Future<void> loadMetrics() async {
    try {
      /// Attempts to fetch metrics data.
      await _fetchMetrics();
    } catch (e) {
      /// Logs the error and updates the state to `ViewState.failed`.
      print(e.toString());
      state = ViewState.failed;
    }
  }

  /// Fetches the list of orders and calculates metrics.
  Future<void> _fetchMetrics() async {
    /// Sets the state to `ViewState.loading` before starting the fetch operation.
    state = ViewState.loading;
    notifyListeners();

    /// Fetches orders from the repository and calculates metrics.
    _orders = await repository!.fetchProjectOrders();
    _metrics = CalculateOrderMetrics(_orders).execute();

    /// Logs the calculated average price for debugging purposes.
    log(metrics!.averagePrice.toString());

    /// Updates the state to `ViewState.loaded` after successful data retrieval.
    state = ViewState.loaded;
    notifyListeners();
  }

  /// Updates the current state and notifies listeners.
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  /// Updates the metrics and notifies listeners.
  set metrics(OrderMetrics? value) {
    _metrics = value;
    notifyListeners();
  }

  /// Updates the list of orders and notifies listeners.
  set orders(List<Order> value) {
    _orders = value;
    notifyListeners();
  }
}
