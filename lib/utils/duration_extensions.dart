extension DurationX on Duration {
  String get inHoursMins {
    final remainingMins = inMinutes % 60;
    if (remainingMins == 0) return '${inHours}h';
    if (inHours == 0) return '${remainingMins}m';
    return '${inHours}h ${inMinutes % 60}m';
  }

  String get inHoursFrac {
    final hours = inMinutes / 60;
    return '${hours.toStringAsFixed(hours.truncateToDouble() == hours ? 0 : 2)}h';
  }
}
