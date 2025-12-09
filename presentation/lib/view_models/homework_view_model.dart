class HomeworkViewModel {
  final String homeworkId;
  final String subject;
  final String description;
  final DateTime dueDate;
  final String? imageUrl;

  const HomeworkViewModel({
    required this.homeworkId,
    required this.subject,
    required this.description,
    required this.dueDate,
    required this.imageUrl
  });
}