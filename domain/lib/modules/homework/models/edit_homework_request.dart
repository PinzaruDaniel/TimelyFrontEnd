/// Editable homework values. Transport serialization belongs in data.
class EditHomeworkRequest {
  const EditHomeworkRequest({
    required this.homeworkId,
    required this.subject,
    required this.description,
    required this.dueDate,
  });

  final String homeworkId;
  final String subject;
  final String description;

  /// Calendar date in YYYY-MM-DD format (placeholder backend contract).
  final String dueDate;
}
