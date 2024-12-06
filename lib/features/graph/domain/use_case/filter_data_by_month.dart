import 'package:ecommerce_insights/shared/enums/months.dart';
import '../models/order_time_series.dart';
import 'package:intl/intl.dart';

/// [FilterDataByMonth]
/// A utility class that filters a list of `OrderTimeSeries` data based on a specified month.
/// It returns only the data points corresponding to the selected month or all data if "All" is selected.



class FilterDataByMonth {
  /// The full list of `OrderTimeSeries` data to be filtered.
  final List<OrderTimeSeries> chartData;

  /// The selected month to filter the data.
  final Months month;

  /// Constructor for `FilterDataByMonth`.
  /// Accepts the chart data and the month to filter.
  FilterDataByMonth(this.chartData, this.month);

  /// Filters the chart data based on the selected month.
  ///
  /// - If the selected month is `Months.All`, the original data is returned.
  /// - Otherwise, it filters the data points whose date corresponds to the selected month.
  ///
  /// Returns:
  /// - A list of `OrderTimeSeries` objects filtered by the selected month.
  List<OrderTimeSeries> execute() {
    /// If "All" is selected, return the complete chart data.
    if (month == Months.All) {
      return chartData;
    }

    /// Get the numerical index of the selected month .
    int monthIndex = DateFormat.MMMM()
        .parse(month.toString().split('.').last)
        .month;

    /// Filter the data points where the month of the date matches the selected month index.
    return chartData.where((data) {
      return data.date.month == monthIndex;
    }).toList();
  }
}
