import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/controller_imports.dart';
import 'package:presentation/util/base/base_app_bar_widget.dart';
import 'package:presentation/util/base/base_page.dart';
import 'package:presentation/util/resources/app_colors.dart';
import 'package:presentation/util/resources/texts_styles.dart';
import 'package:presentation/util/widgets/button_widget.dart';

import 'homework_controller.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => HomeworkPageState();
}

class HomeworkPageState extends State<HomeworkPage> {
  HomeworkController get homeworkController => Get.find();

  void afterAddHomeworks(){
    homeworkController.getHomeworks();
  }

  @override
  void initState() {
    super.initState();
    Get.put(HomeworkController());
    homeworkController.getHomeworks();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pendingIds: ['getHomeworks'],
      appBar: BaseAppBarWidget(title: 'Homeworks', showBackIcon: false,),
      builder: (context) {
        if (homeworkController.homeworks.isEmpty && mainAppController.pendingIds.contains('getHomeworks')) {
          return Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text('No homeworks found!', style: TextsStyles.titleMedium),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ButtonWidget(
                    onTap: () {
                      homeworkController.getHomeworks();
                    },
                    title: 'try again',

                    textStyle: TextsStyles.titleSmall.copyWith(fontSize: 14.sp, color: Colors.white),
                    linearGradient: LinearGradient(colors: [AppColors.primaryCian, AppColors.primaryBlue]),
                    boxShadow: BoxShadow(color: AppColors.primaryCian.withAlpha(100), blurRadius: 6, spreadRadius: 2),
                  ),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: homeworkController.homeworks.length,
          itemBuilder: (context, index) {
            final homework = homeworkController.homeworks[index];

            // Choose gradient based on index
            final gradients = [
              AppColors.royalPurple,
              AppColors.fireRed,
              AppColors.neonOrange,
              AppColors.coolBlue,
              AppColors.deepTeal,
              AppColors.fireRed,
              AppColors.coolBlue,
            ];

            // Pick gradient based on index

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
                    homework.subject,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(homework.description, style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 8),
                  if (homework.dueDate != null) ...[
                    Text(
                      "Due: ${homework.dueDate!.day}.${homework.dueDate!.month}.${homework.dueDate!.year}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                  ],
                  // Display image if it exists
                  if (homework.imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "http://192.168.0.75:5267${homework.imageUrl}", // replace with your base URL
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
    /*
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Homework"),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: SafeArea(
        child: Obx(() {
          if (homeworkController.homeworks.isEmpty) {
            return MainCircularProgressIndicatorWidget();
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: homeworkController.homeworks.length,
            itemBuilder: (context, index) {
              final homework = homeworkController.homeworks[index];

              // Choose gradient based on index
              final gradients = [
                AppColors.royalPurple,
                AppColors.fireRed,
                AppColors.neonOrange,
                AppColors.coolBlue,
                AppColors.deepTeal,
                AppColors.fireRed,
                AppColors.coolBlue,
              ];

              // Pick gradient based on index

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
                      homework.subject,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(homework.description, style: const TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    Text(
                      "Due: ${homework.dueDate.day}.${homework.dueDate.month}.${homework.dueDate.year}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    // Display image if it exists
                    if (homework.imageUrl != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "http://192.168.0.75:5267${homework.imageUrl}", // replace with your base URL
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const SizedBox(),
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );*/
  }
}
