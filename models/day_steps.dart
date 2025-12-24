class DaySteps {
  String date;
  int steps;

  DaySteps({required this.date, required this.steps});

  Map<String, dynamic> toJson() => {'date': date, 'steps': steps};

  static DaySteps fromJson(Map<String, dynamic> json) =>
      DaySteps(date: json['date'], steps: json['steps']);
}