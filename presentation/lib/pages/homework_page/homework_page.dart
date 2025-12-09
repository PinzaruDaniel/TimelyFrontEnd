import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/pages/homework_page/homework_controller.dart';
import 'package:presentation/util/resources/app_colors.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  HomeworkController get homeworkController => Get.find();

  @override
  void initState() {
    super.initState();
    Get.put(HomeworkController());
    homeworkController.getHomeworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework"),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: SafeArea(
        child: Obx(() {
          if (homeworkController.homeworks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
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
    );
  }
}
