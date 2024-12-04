extension GetPrice on String {
  double toPrice() {
    // Remove the dollar sign and commas, then parse to double
    return double.parse(replaceAll('\$', '').replaceAll(',', ''));
  }
}