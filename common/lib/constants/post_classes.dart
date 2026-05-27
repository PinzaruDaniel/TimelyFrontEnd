import 'dart:io';

class CreateHomeworkRequest {
  final String groupId;
  final String subject;
  final String description;
  final String dueDate; // raw DateTime string passed in
  final File? imageFile;

  // Add this getter
  String get dueDateFormatted {
    final parsed = DateTime.tryParse(dueDate);
    if (parsed == null) return dueDate;
    return '${parsed.year.toString().padLeft(4, '0')}-'
        '${parsed.month.toString().padLeft(2, '0')}-'
        '${parsed.day.toString().padLeft(2, '0')}';
  }

  CreateHomeworkRequest({
    required this.groupId,
    required this.subject,
    required this.description,
    required this.dueDate,
    this.imageFile,
  });
}