class TaskStatusDto {
  int id;
  String label;

  TaskStatusDto({
    required this.id,
    required this.label,
  });

  factory TaskStatusDto.fromJson(Map<String, dynamic> json) {
    return TaskStatusDto(
      id: json['id'],
      label: json['label'],
    );
  }
}
