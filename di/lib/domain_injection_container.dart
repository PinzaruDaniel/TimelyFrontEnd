import 'package:di/domain/schedule_injection_container.dart'as schedule;
import 'package:di/domain/homework_injection_container.dart'as homework;

Future<void> initDomain() async {
  schedule.init();
  homework.init();
}