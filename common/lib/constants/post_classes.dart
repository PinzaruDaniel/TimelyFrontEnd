import 'dart:io';

import 'package:dio/dio.dart';

class CreateHomeworkRequest {
  final String groupId;
  final String subject;
  final String description;
  final String dueDate;
  final File? imageFile;

  CreateHomeworkRequest({
    required this.groupId,
    required this.subject,
    required this.description,
    required this.dueDate,
    this.imageFile,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      'groupId': groupId,
      'subject': subject,
      'description': description,
      'dueDate': dueDate,

      if (imageFile != null)
        'image': await MultipartFile.fromFile(imageFile!.path, filename: imageFile!.path.split('/').last),
    });
  }
}
