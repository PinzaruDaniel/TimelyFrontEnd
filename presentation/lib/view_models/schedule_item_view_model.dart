class ScheduleItemViewModel {
  final String time;
  final String subject;
  final String? teacher;
  final String? room;
  final String period;

  ScheduleItemViewModel({
    required this.time,
    required this.subject,
    this.teacher,
    this.room,
    required this.period,
  });

}