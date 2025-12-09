import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/schedule_page/schedule_controller.dart';
import 'package:presentation/util/widgets/main_circular_progress_indicator_widget.dart';

import '../../util/resources/app_colors.dart';
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
      appBar: AppBar(
        title: const Text("My Schedule"),
      ),
      body: SafeArea(
        child: Obx(() {
          if (scheduleController.scheduleVm.value == null) {
            return MainCircularProgressIndicatorWidget();
          }

          final schedule = scheduleController.scheduleVm.value!;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                    boxShadow:[ BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 3)]
                  ),
                  child: TabBar(
                    indicatorWeight: 0,
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    labelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    indicator: BoxDecoration(
                      color: AppColors.primaryCian,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(text: "MON"),
                      Tab(text: "TUE"),
                      Tab(text: "WED"),
                      Tab(text: "THU"),
                      Tab(text: "FRI"),
                    ],
                  ),
                ),
              ),

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
        return buildLessonCard(lessons[index], index);
      },
    );
  }

  Widget buildLessonCard(ScheduleItemViewModel lesson, int index) {
    final gradients = [
      AppColors.royalPurple,
      AppColors.fireRed,
      AppColors.neonOrange,
      AppColors.coolBlue,
      AppColors.deepTeal,
      AppColors.fireRed,
      AppColors.coolBlue,
    ];

    final gradient = gradients[index % gradients.length];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.time,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            lesson.subject,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text("Room: ${lesson.room ?? '—'}", style: const TextStyle(color: Colors.white70)),
          Text("Teacher: ${lesson.teacher ?? '—'}", style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
