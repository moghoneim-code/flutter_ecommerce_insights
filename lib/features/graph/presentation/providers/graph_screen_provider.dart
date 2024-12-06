import 'package:flutter/material.dart';
import '../../../../core/shared/enums/months.dart';
import '../../../../core/shared/models/order_model.dart';
import '../../domain/models/order_time_series.dart';
import '../../domain/use_case/create_chart_data.dart';
import '../../domain/use_case/filter_data_by_month.dart';


/// [GraphScreenProvider]
/// This provider class manages the state and data processing logic for the graph screen.
/// It processes raw order data to generate time-series data for the chart and
/// allows filtering based on the selected month.

class GraphScreenProvider extends ChangeNotifier {
  /// The raw list of orders passed from the parent screen.
  final List<Order> data;

  /// Constructor for `GraphScreenProvider`.
  /// Accepts a list of `Order` objects.
  GraphScreenProvider(this.data);

  /// Stores the chart data in a time-series format.
  List<OrderTimeSeries>? _chartData;

  /// Exposes the processed chart data to the UI layer.
  List<OrderTimeSeries> get chartData => _chartData!;

  /// Represents the currently selected month for filtering data.
  Months _selectedMonth = Months.January;

  /// Exposes the selected month to the UI.
  Months get selectedMonth => _selectedMonth;

  /// Fetches and processes the data for the chart.
  Future<void> fetchData() async {
    /// Processes the raw data into chart-compatible time-series data.
    final data = CreateChartData(this.data).execute();

    /// Filters the data based on the selected month.
    _chartData = setTheDataOfTheMonth(rawData: data);

    /// Notifies listeners to rebuild the UI.
    notifyListeners();
  }

  /// Filters the provided time-series data by the currently selected month.
  ///
  /// [rawData] The full list of `OrderTimeSeries` data.
  /// Returns the filtered list of `OrderTimeSeries` for the selected month.
  List<OrderTimeSeries> setTheDataOfTheMonth(
      {required List<OrderTimeSeries> rawData}) {
    return FilterDataByMonth(rawData, _selectedMonth).execute();
  }

  /// Updates the selected month and notifies listeners to update the UI.
  set selectedMonth(Months value) {
    _selectedMonth = value;
    notifyListeners();
  }

  /// Updates the chart data and notifies listeners to refresh the UI.
  set chartData(List<OrderTimeSeries>? value) {
    _chartData = value!;
    notifyListeners();
  }
}
