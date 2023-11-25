enum TaskStatus {
  fresh('new'),
  inProgress('in_progress'),
  done('done'),
  unknown('');

  final String status;

  const TaskStatus(this.status);

  static TaskStatus fromJson(String value) {
    return TaskStatus.values.firstWhere(
      (element) => element.status == value,
      orElse: () => TaskStatus.unknown,
    );
  }

  static String toJson(TaskStatus value) {
    return value.status;
  }
}
