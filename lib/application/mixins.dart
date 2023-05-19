mixin TotalCostMixin {
  double _total() {
    return (y2023 ?? 0) +
        (y2024 ?? 0) +
        (y2025 ?? 0) +
        (y2026 ?? 0) +
        (y2027 ?? 0) +
        (y2028 ?? 0);
  }

  double get total => _total();

  // Define the properties required by the mixin
  double? y2023;
  double? y2024;
  double? y2025;
  double? y2026;
  double? y2027;
  double? y2028;
}
