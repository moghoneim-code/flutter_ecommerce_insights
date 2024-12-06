

extension GetPrice on String {
  double toPrice() {
    return double.parse(replaceAll('\$', '').replaceAll(',', ''));
  }
}