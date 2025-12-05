import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/schedule_page/schedule_controller.dart';
import 'package:presentation/view_models/schedule_view_model.dart';

import '../../view_models/schedule_item_view_model.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> with TickerProviderStateMixin {
  late TabController tabController;

  ScheduleController get scheduleController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(ScheduleController());
    scheduleController.getSchedule();

    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule")),
      body: SafeArea(
        child: Obx(() {
          if (scheduleController.scheduleVm.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final schedule = scheduleController.scheduleVm.value!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: BoxBorder.all( color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    labelColor: Colors.black,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: "Luni"),
                      Tab(text: "Marți"),
                      Tab(text: "Miercuri"),
                      Tab(text: "Joi"),
                      Tab(text: "Vineri"),
                    ],
                  ),
                ),
              ),

              /// CONTENT BELOW MENU
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildDay(schedule.monday),
                    buildDay(schedule.tuesday),
                    buildDay(schedule.wednesday),
                    buildDay(schedule.thursday),
                    buildDay(schedule.friday),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget buildDay(List lessons) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return buildLessonCard(lessons[index]);
      },
    );
  }

  Widget buildLessonCard(ScheduleItemViewModel lesson) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.lime,
            Colors.lightGreen,
            Colors.amberAccent
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.subject,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text("Time: ${lesson.time}"),
          Text("Room: ${lesson.room ?? '—'}"),
          Text("Teacher: ${lesson.teacher ?? '—'}"),
        ],
      ),
    );
  }
}