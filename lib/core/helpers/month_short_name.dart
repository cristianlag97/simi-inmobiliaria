extension MonthShortName on int {
  String get shortMonthName {
    const monthNames = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic',
    ];
    if (this < 1 || this > 12) return '';
    return monthNames[this - 1];
  }
}
