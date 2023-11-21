class TaskTypeDto {
  int id;
  String label;
  int color;

  TaskTypeDto({
    required this.id,
    required this.label,
    required this.color,
  });

  factory TaskTypeDto.fromJson(Map<String, dynamic> json) {
    return TaskTypeDto(
      id: json['id'],
      label: json['label'],
      color: json['color'],
    );
  }
}
