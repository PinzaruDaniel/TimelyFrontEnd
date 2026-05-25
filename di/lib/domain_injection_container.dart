import 'package:di/domain/schedule_injection_container.dart'as schedule;
import 'package:di/domain/homework_injection_container.dart'as homework;
import 'package:di/domain/chat_injection_controller.dart'as chat;
import 'package:di/domain/auth_injection_container.dart'as auth;
import 'package:di/domain/user_injection_container.dart' as user;
import 'package:di/domain/messaging_injection_container.dart' as messaging;

Future<void> initDomain() async {
  auth.init();
  user.init();
  chat.init();
  schedule.init();
  homework.init();
  messaging.init();
}