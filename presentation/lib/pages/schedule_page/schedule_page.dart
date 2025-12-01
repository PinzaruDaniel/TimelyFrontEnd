import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/schedule_page/schedule_controller.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  ScheduleController get scheduleController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ScheduleController());
    scheduleController.getSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 40, height: 50, color: Colors.black);
  }
}
