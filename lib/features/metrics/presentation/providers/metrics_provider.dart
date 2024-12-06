import 'dart:developer';

import 'package:ecommerce_insights/shared/enums/view_state.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/models/OrderMetrics.dart';
import '../../domain/repositories/metrics_remote_data_source.dart';
import '../../domain/use_case/CalculateOrderMetrics.dart';

class MetricsProvider extends ChangeNotifier {
  final MetricsRemoteDataSource ? repository;

  OrderMetrics? _metrics;

  OrderMetrics? get metrics => _metrics;

  ViewState _state = ViewState.initial;

  ViewState get state => _state;

  MetricsProvider({required this.repository});



  Future<void> loadMetrics() async {
    try {
      await _fetchMetrics();
    } catch (e) {
      print(e.toString());
      state = ViewState.failed;
    }
  }



  Future<void> _fetchMetrics() async {
    state = ViewState.loading;
    notifyListeners();
    final orders = await repository!.fetchProjectOrders();
    _metrics = CalculateOrderMetrics(orders).execute();
    log(metrics!.averagePrice.toString());
    state = ViewState.loaded;
    notifyListeners();
  }



  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  set metrics(OrderMetrics? value) {
    _metrics = value;
    notifyListeners();
  }
}
