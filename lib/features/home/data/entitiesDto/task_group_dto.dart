class TaskGroupDto {
  int id;
  String label;
  int color;

  TaskGroupDto({
    required this.id,
    required this.label,
    required this.color,
  });

  factory TaskGroupDto.fromJson(Map<String, dynamic> json) {
    return TaskGroupDto(
      id: json['id'],
      label: json['label'],
      color: json['color'],
    );
  }
}
