import 'package:common/constants/post_classes.dart';
import 'package:domain/modules/homework/use_cases/add_homework_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/controllers/controller_imports.dart';

class MainAppController extends GetxController {
  RxList<String> pendingIds = RxList([]);
  AddHomeworkUseCase addHomeworkUseCase = GetIt.instance<AddHomeworkUseCase>();

  void addPendingIds(List<String> pendingIds) {
    this.pendingIds.addAll(pendingIds);
    this.pendingIds.refresh();
  }

  void removePendingIds(List<String> pendingIds) {
    this.pendingIds.removeWhere((item) => pendingIds.contains(item));
    this.pendingIds.refresh();
  }

  Future<void> addHomework({
    required String subject,
    required String dueDate,
    required String description,
  }) async {
    final result = await addHomeworkUseCase(
      AddHomeworkParams(
        request: CreateHomeworkRequest(
          groupId: userProfileController.userViewModel.value!.groupId,
          subject: subject,
          description: description,
          dueDate: dueDate,
        ),
      ),
    );
    result.fold(
      onFailure: (failure) {
        _showSnack('Failed to add homework: ${failure.message}');
        print('Failed to add homework: ${failure.message}');
      },
      onSuccess: (success) {
        _showSnack('Homework added successfully');
        print('Homework added successfully');
      },
    );
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }
}
